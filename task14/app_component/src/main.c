/* MicroBlaze standalone / SDT: 32-bit generator -> AXIS FIFO -> DMA S2MM.
 * Fill in the three board-specific macros below (or pass them as -D defines).
 * DST_ADDR must reserve 64 KiB of DMA-accessible memory, aligned to 64 KiB,
 * outside the application's code, data, stack and heap.
 * GPIO and generator must share a clock, or start needs a CDC handshake.
 */
#include "xparameters.h"
#include "xaxidma.h"
#include "xil_io.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "sleep.h"

#include "xintc.h"
#include "xil_exception.h"

#include "xgpio.h"

#define DMA_BASE          XPAR_XAXIDMA_0_BASEADDR
#define INTC_BASE         XPAR_XINTC_0_BASEADDR
#define START_GPIO_BASE   XPAR_GPIO_START_BASEADDR 
#define BRAM_BASE         XPAR_AXI_BRAM_0_BASEADDRESS
#define BTN_BASEADDR      XPAR_GPIO_BTNS_BASEADDR

#define DST_ADDR1  (BRAM_BASE + 0x00000U)
#define DST_ADDR2  (BRAM_BASE + 0x10000U)


#define FRAME_BYTES 60000U
#define BUFFER_BYTES 65536U
#define POLL_LIMIT 1000000U
#define GPIO_DATA_OFFSET 0x00U
#define GPIO_TRI_OFFSET  0x04U
#define CLEAR_32BITS 0xA5A5A5A5U
#define DMA_RX_IRQ_ID 1U

static XAxiDma dma_inst;
static XIntc intc;

volatile int errors;
volatile u32 dma_status;
volatile u32 received_bytes;

static volatile u32 rx_done;
static volatile u32 rx_error;
static volatile u32 rx_irq_status;

//********************************************** TOOLS
static void PrepareBuffer(UINTPTR address)
{
    int i = 0;
    for (i = 0; i < BUFFER_BYTES; i += 4U)
        Xil_Out32(address + i, CLEAR_32BITS);
}

static u32 VerifyFrame(UINTPTR address, u32 frame_bytes)
{
    u32 mismatches = 0U;

    /* frame_bytes must be a multiple of 4. */
    for (u32 i = 0; i < frame_bytes / 4U; ++i) {
        u32 b = (i * 4U) & 0xFFU;

        u32 expected = b
                     | ((b + 1U) << 8)
                     | ((b + 2U) << 16)
                     | ((b + 3U) << 24);

        if (Xil_In32(address + i * 4U) != expected)
            ++mismatches;
    }

    return mismatches;
}
//********************************************** HAL wrappers
static void DmaRxHandler(void *ref)
{
    XAxiDma *dma = (XAxiDma *)ref;

    u32 irq = XAxiDma_IntrGetIrq(dma, XAXIDMA_DEVICE_TO_DMA);

    if (!(irq & XAXIDMA_IRQ_ALL_MASK))
        return;

    rx_irq_status = XAxiDma_ReadReg(dma->RegBase + XAXIDMA_RX_OFFSET,XAXIDMA_SR_OFFSET);

    XAxiDma_IntrAckIrq(dma, irq, XAXIDMA_DEVICE_TO_DMA);

    if (irq & XAXIDMA_IRQ_ERROR_MASK) 
    {
        XAxiDma_IntrDisable(dma, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DEVICE_TO_DMA);
        rx_error = 1U;
        return;
    }

    if (irq & XAXIDMA_IRQ_IOC_MASK)
        rx_done = 1U;
}

static int SetupDmaInterrupt(u8 dma_rx_irq_id)
{
    int status;

    status = XIntc_Initialize(&intc, (UINTPTR)INTC_BASE);
    if (status != XST_SUCCESS)
        return status;

    status = XIntc_Connect(
        &intc,
        dma_rx_irq_id,
        (XInterruptHandler)DmaRxHandler,
        &dma_inst);

    if (status != XST_SUCCESS)
        return status;

    status = XIntc_Start(&intc, XIN_REAL_MODE);
    if (status != XST_SUCCESS)
        return status;

    Xil_ExceptionInit();

    Xil_ExceptionRegisterHandler(
        XIL_EXCEPTION_ID_INT,
        (Xil_ExceptionHandler)XIntc_InterruptHandler,
        &intc);

    XIntc_Enable(&intc, dma_rx_irq_id);
    Xil_ExceptionEnable();

    return XST_SUCCESS;
}
XGpio BtnGpio;
// GPIO init
int GpioInitAndRun(XGpio *BtnGpioPtr)
{
    // XGpio_Config *cfg_ptr2 = XGpio_LookupConfig(BTN_BASEADDR);
    // XGpio_CfgInitialize(BtnGpioPtr, cfg_ptr2, cfg_ptr2->BaseAddress);
    XGpio_Initialize(BtnGpioPtr, BTN_BASEADDR);
    XGpio_SetDataDirection(BtnGpioPtr, 1, 0xF); /* Inputs */
    return XST_SUCCESS;
}

int main(void)
{
    int status;
    u32 i;
    UINTPTR dst = (UINTPTR)DST_ADDR2;
    UINTPTR gpio = (UINTPTR)START_GPIO_BASE;
    UINTPTR rx_regs;

    XAxiDma_Config *cfg;

    errors = -1;
    if ((dst & (BUFFER_BYTES - 1U)) != 0U) 
    {
        xil_printf("DST_ADDR1 must be 64-KiB aligned\r\n"); 
        goto stop;
    }

    status = GpioInitAndRun(&BtnGpio);
    if (status != XST_SUCCESS) {
        xil_printf("Gpio initialization failed\r\n");
        goto stop;
    }
    u32 btn_value = 0;
    u32 sw_value = 0;
    u32 previous_buttons = 0;
    while (1) {
        // nevertheless we are calling this fucn every 50ms
        // it still return that key is up during several cycles
        // the logic belong prevent that            
        btn_value = XGpio_DiscreteRead(&BtnGpio, 1) & 0x0FU;
        u32 newly_pressed = btn_value & ~previous_buttons;
        previous_buttons = btn_value;
            // Act only when a new press occurs.
            if (newly_pressed != 0U) {
                switch (btn_value) {
                    case 1U:
                    case 2U:
                    case 4U:
                    case 8U:
                        goto button_pressed;
                        break;
                    default:
                        break;
                }
            }
    }
button_pressed:


    /* Dedicated AXI GPIO Start: preload low, then enable outputs. */
    Xil_Out32(gpio + GPIO_DATA_OFFSET, 0U);
    Xil_Out32(gpio + GPIO_TRI_OFFSET, 0U);

    cfg = XAxiDma_LookupConfig((UINTPTR)DMA_BASE);
    if (cfg == NULL) 
    { 
        errors = -2; 
        goto stop; 
    }
    status = XAxiDma_CfgInitialize(&dma_inst, cfg);
    if (status != XST_SUCCESS) 
    { 
        errors = -3; 
        goto stop; 
    }
    if (XAxiDma_HasSg(&dma_inst)) 
    { 
        errors = -4; 
        goto stop; 
    }

    // was needed for debug begin
    volatile u32 debug_dma_cr;
    volatile u32 debug_dma_sr;
    volatile u32 debug_gpio_tri;
    debug_dma_cr = Xil_In32(0x41E00030U);
    debug_dma_sr = Xil_In32(0x41E00034U);
    debug_gpio_tri = Xil_In32(0x40010004U);
    // was needed for debug end

    //disable all interrupts  
    XAxiDma_IntrDisable(
        &dma_inst, 
        XAXIDMA_IRQ_ALL_MASK, 
        XAXIDMA_DEVICE_TO_DMA);
    //acknowledges and clears pending IRQ flags
    XAxiDma_IntrAckIrq(
        &dma_inst, 
        XAXIDMA_IRQ_ALL_MASK, 
        XAXIDMA_DEVICE_TO_DMA);

    /*
        DMA_RX_IRQ_ID number of bit where s2mm_introut connected
    */
    status = SetupDmaInterrupt(DMA_RX_IRQ_ID);
    if (status != XST_SUCCESS) {
        errors = -5;
        goto stop;
    }

    rx_done = 0U;
    rx_error = 0U;
    rx_irq_status = 0U;

   //enable interrupts : interrupt on complete, error DMA  
    XAxiDma_IntrEnable(
        &dma_inst,
        XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_ERROR_MASK, 
        XAXIDMA_DEVICE_TO_DMA);
                     
    rx_regs = dma_inst.RegBase + XAXIDMA_RX_OFFSET;

    /* Initialize and flush a dedicated buffer before DMA owns it. */
    //PrepareBuffer((UINTPTR)DST_ADDR2);
    
    /*
        Writes modified data from the processor cache to memory
        and invalidates the corresponding cache lines.
    */
    Xil_DCacheFlushRange(dst, BUFFER_BYTES);

    /* Arm the receiver BEFORE starting the source. No MM2S transfer. */
    status = XAxiDma_SimpleTransfer(
        &dma_inst, 
        dst, 
        FRAME_BYTES, 
        XAXIDMA_DEVICE_TO_DMA);
    if (status != XST_SUCCESS) {
         errors = -6; 
         goto stop; 
    }

    /*  
        notify data_generation_m_axis_32 to start generate data 
     */
    Xil_Out32(gpio + GPIO_DATA_OFFSET, 1U);
    usleep(1);
    Xil_Out32(gpio + GPIO_DATA_OFFSET, 0U);

    //WAIT
    for (i = 0; i < POLL_LIMIT; ++i) {
        if (rx_done || rx_error){
            break;
        }
            
    }
    if (i == POLL_LIMIT) { 
        errors = -7; 
        goto stop; 
    }

    if (rx_error) {
        dma_status = rx_irq_status;
        errors = -8;
        goto stop;
    }

    if (!rx_done) {
        /* reading real Status Register in case there was no ISR*/
        dma_status = XAxiDma_ReadReg(
            rx_regs, 
            XAXIDMA_SR_OFFSET);
        errors = -9;
        goto stop;
    }
    
    dma_status = rx_irq_status;
    received_bytes = XAxiDma_ReadReg(
        rx_regs, 
        XAXIDMA_BUFFLEN_OFFSET);
    if (received_bytes != FRAME_BYTES) {
        errors = -10;
        goto stop;
    }

    /* DMA has finished: discard cached copies before CPU reads. */
    Xil_DCacheInvalidateRange(
        dst, 
        BUFFER_BYTES);
    /*
    data_generation_m_axis_32 produce such template of the data
    0xC0010000:     03020100 07060504 0B0A0908 0F0E0D0C
    0xC0010010:     13121110 17161514 1B1A1918 1F1E1D1C
    0xC00100F0:     F3F2F1F0 F7F6F5F4 FBFAF9F8 FFFEFDFC
    we would like to verify that
    */
    errors = VerifyFrame(
        dst,
        FRAME_BYTES);

    xil_printf("Received %u bytes; mismatched words: %d\r\n",(unsigned)received_bytes, errors);

stop:
    if (errors < 0)
        xil_printf("Failed: %d, S2MM status: 0x%08x\r\n",
                   errors, (unsigned)dma_status);
    /* On failure do not reuse the buffer or restart without system reset. */
    while (1) {}
    return 0;
}
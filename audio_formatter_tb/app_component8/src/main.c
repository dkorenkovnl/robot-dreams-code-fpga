#include <stdio.h>
#include "xparameters.h"
#include "xil_printf.h"
#include "xiic.h"
#include "xintc.h"
#include "xinterrupt_wrap.h"

#include "xaudioformatter.h"
#include "xi2stx.h"
#include "xi2srx.h"
/*
	CMDS for controlling ADAU1761 
*/
#define    R0_REG_CLOCK_CONTROL              (0x4000)   /* Clock control */
#define    R1_REG_PLL_CONTROL_0              (0x4002)   /* PLL control 0 */
#define    R2_REG_DIG_MIC_JACK_DETECT        (0x4008)   /* Dig mic/jack detect */
#define    R3_REG_REC_POWER_MGMT             (0x4009)   /* Rec power mgmt */
#define    R4_REG_REC_MIXER_LEFT_0           (0x400A)   /* Rec Mixer Left 0 */
#define    R5_REG_REC_MIXER_LEFT_1           (0x400B)   /* Rec Mixer Left 1 */
#define    R6_REG_REC_MIXER_RIGHT_0          (0x400C)   /* Rec Mixer Right 0 */
#define    R7_REG_REC_MIXER_RIGHT_1          (0x400D)   /* Rec Mixer Right 1 */
#define    R8_REG_LEFT_DIFF_INPUT_VOL        (0x400E)   /* Left diff input vol */
#define    R9_REG_RIGHT_DIFF_INPUT_VOL       (0x400F)   /* Right diff input vol */
#define    R10_REG_RECORD_MIC_BIAS           (0x4010)   /* Record mic bias */
#define    R11_REG_ALC_0                     (0x4011)   /* ALC 0 */
#define    R12_REG_ALC_1                     (0x4012)   /* ALC 1 */
#define    R13_REG_ALC_2                     (0x4013)   /* ALC 2 */
#define    R14_REG_ALC_3                     (0x4014)   /* ALC 3 */
#define    R15_REG_SERIAL_PORT_0             (0x4015)   /* Serial Port 0 */
#define    R16_REG_SERIAL_PORT_1             (0x4016)   /* Serial Port 1 */
#define    R17_REG_CONVERTER_0               (0x4017)   /* Converter 0 */
#define    R18_REG_CONVERTER_1               (0x4018)   /* Converter 1 */
#define    R19_REG_ADC_CONTROL               (0x4019)   /* ADC control */
#define    R20_REG_LEFT_DIGITAL_VOL          (0x401A)   /* Left digital vol */
#define    R21_REG_RIGHT_DIGITAL_VOL         (0x401B)   /* Right digital vol */
#define    R22_REG_PLAY_MIXER_LEFT_0         (0x401C)   /* Play Mixer Left 0 */
#define    R23_REG_PLAY_MIXER_LEFT_1         (0x401D)   /* Play Mixer Left 1 */
#define    R24_REG_PLAY_MIXER_RIGHT_0        (0x401E)   /* Play Mixer Right 0 */
#define    R25_REG_PLAY_MIXER_RIGHT_1        (0x401F)   /* Play Mixer Right 1 */
#define    R26_REG_PLAY_L_R_MIXER_LEFT       (0x4020)   /* Play L/R mixer left */
#define    R27_REG_PLAY_L_R_MIXER_RIGHT      (0x4021)   /* Play L/R mixer right */
#define    R28_REG_PLAY_L_R_MIXER_MONO       (0x4022)   /* Play L/R mixer mono */
#define    R29_REG_PLAY_HP_LEFT_VOL          (0x4023)   /* Play HP left vol */
#define    R30_REG_PLAY_HP_RIGHT_VOL         (0x4024)   /* Play HP right vol */
#define    R31_REG_LINE_OUTPUT_LEFT_VOL      (0x4025)   /* Line output left vol */
#define    R32_REG_LINE_OUTPUT_RIGHT_VOL     (0x4026)   /* Line output right vol */
#define    R33_REG_PLAY_MONO_OUTPUT          (0x4027)   /* Play mono output */
#define    R34_REG_POP_CLICK_SUPPRESS        (0x4028)   /* Pop/click suppress */
#define    R35_REG_PLAY_POWER_MGMT           (0x4029)   /* Play power mgmt */
#define    R36_REG_DAC_CONTROL_0             (0x402A)   /* DAC Control 0 */
#define    R37_REG_DAC_CONTROL_1             (0x402B)   /* DAC Control 1 */
#define    R38_REG_DAC_CONTROL_2             (0x402C)   /* DAC Control 2 */
#define    R39_REG_SERIAL_PORT_PAD           (0x402D)   /* Serial port pad */
#define    R40_REG_CONTROL_PORT_PAD_0        (0x402F)   /* Control Port Pad 0 */
#define    R41_REG_CONTROL_PORT_PAD_1        (0x4030)   /* Control Port Pad 1 */
#define    R42_REG_JACK_DETECT_PIN           (0x4031)   /* Jack detect pin */
#define    R67_REG_DEJITTER_CONTROL          (0x4036)   /* Dejitter control */
#define    R43_REG_CRC_3                     (0x40C0)   /* CRC_3 */
#define    R44_REG_CRC_2                     (0x40C1)   /* CRC_2 */
#define    R45_REG_CRC_1                     (0x40C2)   /* CRC_1 */
#define    R46_REG_CRC_0                     (0x40C3)   /* CRC_0 */
#define    R47_REG_CRC_ENABLE                (0x40C4)   /* CRC enable */
#define    R48_REG_GPIO0_PIN_CONTROL         (0x40C6)   /* GPIO0 pin control */
#define    R49_REG_GPIO1_PIN_CONTROL         (0x40C7)   /* GPIO1 pin control */
#define    R50_REG_GPIO2_PIN_CONTROL         (0x40C8)   /* GPIO2 pin control */
#define    R51_REG_GPIO3_PIN_CONTROL         (0x40C9)   /* GPIO3 pin control */
#define    R52_REG_WATCHDOG_ENABLE           (0x40D0)   /* Watchdog enable */
#define    R53_REG_WATCHDOG_VALUE_2          (0x40D1)   /* Watchdog value 2 */
#define    R54_REG_WATCHDOG_VALUE_1          (0x40D2)   /* Watchdog value 1 */
#define    R55_REG_WATCHDOG_VALUE_0          (0x40D3)   /* Watchdog value 0 */
#define    R56_REG_WATCHDOG_ERROR            (0x40D4)   /* Watchdog error */
#define    R57_REG_DSP_SAMPLING_RATE_SETTING (0x40EB)   /* DSP sampling rate setting */
#define    R58_REG_SERIAL_INPUT_ROUTE_CTRL   (0x40F2)   /* Serial input route ctrl */
#define    R59_REG_SERIAL_OUTPUT_ROUTE_CTRL  (0x40F3)   /* Serial output route ctrl */
#define    R60_REG_SERIAL_DATA_PIN_CONFIG    (0x40F4)   /* Serial data pin config */
#define    R61_REG_DSP_ENABLE                (0x40F5)   /* DSP enable */
#define    R62_REG_DSP_RUN                   (0x40F6)   /* DSP run */
#define    R63_REG_DSP_SLEW_MODES            (0x40F7)   /* DSP slew modes */
#define    R64_REG_SERIAL_PORT_SAMPLING_RATE (0x40F8)   /* Serial port sampling rate */
#define    R65_REG_CLOCK_ENABLE_0            (0x40F9)   /* Clock Enable 0 */
#define    R66_REG_CLOCK_ENABLE_1            (0x40FA)   /* Clock Enable 1 */

/*
	IIC address of the ADAU1761 
*/
#define SLAVE_ADDRESS	(59)

#define INTERRUPT_PARENT  		0x41200001U
#define I2S_TX_INTERRUPT_ID     0x2000U
#define I2S_RX_INTERRUPT_ID     0x2003U
#define AF_S2MM_INTERRUPT_ID    0x2002U
#define AF_MM2S_INTERRUPT_ID    0x2001U
/*
for Fs = 48Khz, the supplied aud_clk is 24.576Mhz, 
then this register should be programmed with a value of 512.
For example, 48Khz * 512 = 24.576Mhz.
*/

//ratio between the master clock (MCLK) and the audio sample rate
// also ref to R0_REG_CLOCK_CONTROL bits INFREQ
/*
MCLK              = 24.576 MHz = 24,576,000 Hz
Sample rate Fs    = 48 kHz     = 48,000 frames/second
Channels          = 2         (left and right)
Bits per slot     = 32        (24 audio bits within each slot)

2 channels × 32 bits = 64 BCLK cycles/frame

BCLK = Fs × 64
     = 48,000 × 64
     = 3,072,000 Hz
     = 3.072 MHz
	
MCLK / BCLK = 24,576,000 / 3,072,000 = 8

BCLK  = MCLK / (2 × Divider)
      = 24,576,000 / (2 × 4)
      = 3,072,000 Hz

LRCLK = BCLK / 64
      = 3,072,000 / 64
      = 48,000 Hz
	  
*/

#define RATIO_MCLK_AUD_CLK  (24576000/48000) //512

#define I2S_RX_FS		48 /* kHz */
#define I2S_RX_MCLK		(RATIO_MCLK_AUD_CLK * I2S_RX_FS)//24576

#define I2S_TX_FS		48 /* kHz */
#define I2S_TX_MCLK		(RATIO_MCLK_AUD_CLK * I2S_TX_FS)//24576

#define AF_FS		    48 /* kHz */
#define AF_MCLK		    (RATIO_MCLK_AUD_CLK * AF_FS) //24576

/*
This sets how long the Audio Formatter waits without incoming audio data before a capture timeout.
The function writes 2,147,483,648 clock cycles into the S2MM timeout register. 
This is also the hardware’s default value.
s_axis_s2mm_aclk = 100 MHz then	21.47 seconds
*/
#define AF_S2MM_TIMEOUT 0x80000000

XIic iic_inst;
XI2s_Rx i2s_rx_inst;
XAudioFormatter af_inst;
XI2s_Tx i2s_tx_inst;

volatile u8 IICSendComplete = 0;
volatile u8 IICReceiveComplete = 0;
volatile u8 IICSlaveNoAck = 0;
volatile u8 IICOther = 0;

volatile u32 I2sTxIntrReceived = 0;
volatile u32 I2sRxIntrReceived = 0;

volatile u32 S2MMAFRxPeriodsCompleted = 0;
volatile u32 MM2SAFTxPeriodsCompleted = 0;
volatile u32 AFAudioError = 0;

volatile u8 IICAddrOffset = 0;
/*
One stereo audio frame occupies 8 bytes in memory:
4 bytes for the left channel and 4 bytes for the right channel.
Each channel contains 24 valid audio bits in a 32-bit container.

The RX buffer contains 8 periods, each 16384 bytes (16 KiB).
Total RX buffer size: 8 * 16384 = 131072 bytes (128 KiB).

Each period holds 16384 / 8 bytes = 2048 stereo frames.
At 48 kHz, one period represents approximately 42.67 ms of audio.

The total 8 periods represents 341.36 ms of audio or 2048 *8 = 16384 stereo frames
or 8 bytes * 16384 = 131072 bytes (128 KiB) in memory.

With period-completion interrupts enabled, the RX callback is invoked
after each completed period, approximately every 42.67 ms.

After all 8 periods, the DMA wraps around to the beginning of the buffer.
Process or copy completed periods before the DMA overwrites them.
*/ 

#define AUDIO_BUFFER_ADDR  0xC0000000U

#if BUILD_FOR_SIM == 1
    #define AUDIO_PERIOD_BYTES     256U
    #define AUDIO_BUFFER_PERIODS   2U
    #define AUDIO_PREFILL_PERIODS  1U
#else
    #define AUDIO_PERIOD_BYTES     32768U
    #define AUDIO_BUFFER_PERIODS   8U
    #define AUDIO_PREFILL_PERIODS  4U
#endif


/* Both channels access the same 256 KiB circular buffer. */
// The RX buffer contains 8 periods, each 32768U bytes (32 KiB).
// Total RX buffer size: 8 * 32768U = 262144 bytes (256 KiB).
XAudioFormatterHwParams af_hw_params_rx = {
	.buf_addr         = AUDIO_BUFFER_ADDR, 
	.active_ch        = 2,
	.bits_per_sample  = BIT_DEPTH_24,
	.periods 		  = AUDIO_BUFFER_PERIODS, //8
	.bytes_per_period = AUDIO_PERIOD_BYTES};  //32768U
// The TX buffer contains 8 periods, each 32768U bytes (32 KiB).
// Total TX buffer size: 8 * 32768U = 262144 bytes (256 KiB).
XAudioFormatterHwParams af_hw_params_tx = {
	.buf_addr         = AUDIO_BUFFER_ADDR, 
	.active_ch        = 2, 
	.bits_per_sample  = BIT_DEPTH_24,
    .periods 		  = AUDIO_BUFFER_PERIODS, //8
	.bytes_per_period = AUDIO_PERIOD_BYTES};  //32768U

/* Offsets for audio_filter.cpp in this package. Verify exported register map. */
#define AUDIO_FILTER_BASEADDR ((UINTPTR)0x00020000U)

#define AUDIO_FILTER_CTRL_OFFSET     0x00U
#define AUDIO_FILTER_BYPASS_OFFSET   0x20U
#define AUDIO_FILTER_AP_START        0x01U
#define AUDIO_FILTER_AUTO_RESTART    0x80U
u32 aud_filter_bypass = 0U;

/* Call once after reset, before starting the audio stream. */
void AudioFilter_Start(UINTPTR base, u32 bypass)
{
    Xil_Out32(base + AUDIO_FILTER_BYPASS_OFFSET, bypass ? 1U : 0U);
    Xil_Out32(base + AUDIO_FILTER_CTRL_OFFSET,
              AUDIO_FILTER_AUTO_RESTART | AUDIO_FILTER_AP_START);
}

/* May be called while audio is streaming. Does not stop either DMA. */
void AudioFilter_SetBypass(UINTPTR base, u32 bypass)
{
    Xil_Out32(base + AUDIO_FILTER_BYPASS_OFFSET, bypass ? 1U : 0U);
}

u32 AudioFilter_GetBypass(UINTPTR base)
{
    return Xil_In32(base + AUDIO_FILTER_BYPASS_OFFSET) & 1U;
}
// ****************************************************************
void IICRecvHandler(XIic *InstancePtr)
{
	IICReceiveComplete = 0;
}

void IICSendHandler(XIic *InstancePtr)
{
	IICSendComplete = 0;
}

void IICStatusHandler(XIic *InstancePtr, int Event)
{
	if (Event == XII_ARB_LOST_EVENT) {
	}
	else if (Event == XII_BUS_NOT_BUSY_EVENT) {
	}
	else if(Event == XII_SLAVE_NO_ACK_EVENT)
	{
		IICSlaveNoAck = 1;
	}
	else
	{
		IICOther = Event;
	}
}
// ****************************************************************
void I2sTxAesBlockCmplIntrHandler(void *CallBackRef)
{
}

void I2sTxAesBlockErrIntrHandler(void *CallBackRef)
{
}

void I2sTxAesGetChStsHandler(void *CallBackRef)
{
}

void I2sTxUnderflowIntrHandler(void *CallBackRef)
{
}

void I2sRxAesBlockCmplIntrHandler(void *CallBackRef)
{
}

void I2sRxOvrflwIntrHandler(void *CallBackRef)
{
}
// ****************************************************************
void XS2MMAFCallback(void *data)
{
    (void)data;
    S2MMAFRxPeriodsCompleted++;
}

void XS2MMTimeoutCallback(void *data)
{
    (void)data;
    AFAudioError = 1;
}

void XS2MMErrorCallback(void *data)
{
    (void)data;
    AFAudioError = 1;
}
// ****************************************************************
void XMM2SAFCallback(void *data)
{
    (void)data;
    MM2SAFTxPeriodsCompleted++;
}

void XMM2STimeoutCallback(void *data)
{
    (void)data;
    AFAudioError = 1;
}

void XMM2SErrorCallback(void *data)
{
    (void)data;
    AFAudioError = 1;
}
// ****************************************************************

int IicWrite(XIic *IicInstancePtr,u8 addr,u8 *buffer, u16 ByteCount)
{
#if defined(BUILD_FOR_SIM) && (BUILD_FOR_SIM == 0)
	u32 Status;
	// Set the Slave address.
	Status = XIic_SetAddress(IicInstancePtr, XII_ADDR_TO_SEND_TYPE, addr);
	if (Status != XST_SUCCESS) {
		xil_printf("IicWrite: Failed to set address\n\r");
		return XST_FAILURE;
	}
	// Set the defaults.
	IICSendComplete = 1;
	IICSlaveNoAck = 0;
	IicInstancePtr->Stats.TxErrors = 0;
	/*
	 * Start the IIC device.
	 */
	Status = XIic_Start(IicInstancePtr);
	if (Status != XST_SUCCESS) {
		xil_printf("XIic_Start XST_FAILURE\n\r");
		return XST_FAILURE;
	}
	/*
	 * Send the Data.
	 */
	Status = XIic_MasterSend(IicInstancePtr, buffer, ByteCount);
	if (Status != XST_SUCCESS) {
		xil_printf("XIic_MasterSend XST_FAILURE\n\r");
		return XST_FAILURE;
	}
	/*
	 * Wait till the transmission is completed.
	 */
	while (( IICSendComplete || (XIic_IsIicBusy(IicInstancePtr) == TRUE))) {

		if(IICSlaveNoAck == 1)
		{
			xil_printf("SlaveNoAck up\n\r");
			return XST_FAILURE;
		}
		usleep(10);
	}
	xil_printf("IicWrite while done\n\r");
	/*
	 * Stop the IIC device.
	 */
	Status = XIic_Stop(IicInstancePtr);
	if (Status != XST_SUCCESS) {
		xil_printf("XIic_Stop XST_FAILURE\n\r");
		return XST_FAILURE;
	}
	return Status;
#else
	return XST_SUCCESS;
#endif
}

u32 InitializeI2C(XIic *IicInstancePtr)
{
#if defined(BUILD_FOR_SIM) && (BUILD_FOR_SIM == 0)
	u32 Status = XST_SUCCESS;
    XIic_Config *ConfigPtr;
    ConfigPtr = XIic_LookupConfig(XPAR_AXI_IIC_0_BASEADDR);
	if (ConfigPtr == NULL)
	{
		xil_printf("I2C Configuration Lookup Failed\n");
		return XST_FAILURE;
	}
	Status = XIic_CfgInitialize(IicInstancePtr, ConfigPtr, ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS)
	{
		xil_printf("I2C Init Failed\n");
		return XST_FAILURE;
	}

	XIic_SetRecvHandler(IicInstancePtr, IicInstancePtr, (XIic_Handler) IICRecvHandler);
    XIic_SetSendHandler(IicInstancePtr, IicInstancePtr, (XIic_Handler) IICSendHandler);
	XIic_SetStatusHandler(IicInstancePtr, IicInstancePtr, (XIic_StatusHandler) IICStatusHandler);

	Status = XSetupInterruptSystem(
		IicInstancePtr, &XIic_InterruptHandler,
		ConfigPtr->IntrId,
		ConfigPtr->IntrParent,
		XINTERRUPT_DEFAULT_PRIORITY);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	return Status;
#else
	return XST_SUCCESS;
#endif

}

int InitAudioHardwareCodec()
{
#if defined(BUILD_FOR_SIM) && (BUILD_FOR_SIM == 0)

	u8 WriteBuffer[3] = {0x00};
	u8 ReadBuffer[3] = {0x00};
	//******************************************************************
	// config_audio_pll
	//******************************************************************
	/*
	 * Disable Core Clock
	 */
    WriteBuffer[0] = R0_REG_CLOCK_CONTROL >> 8;
    WriteBuffer[1] = R0_REG_CLOCK_CONTROL & 0xff;
    WriteBuffer[2] = 0x00;
    xil_printf("R0_REG_CLOCK_CONTROL sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
    u32 Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
	//******************************************************************
	/*
	 * Table 17. Fractional PLL Parameter Settings for f S = 48 kHz (PLL Output = 49.152 MHz = 1024 × f S )
	 * mclk 24MHz 0x007D 000C 2301
	 */
	//******************************************************************
	//******************************************************************
	/*
	 * Table 18. Integer PLL Parameter Settings for f S = 48 kHz (PLL Output = 49.152 MHz = 1024 × f S )
	 * mclk 24.576MHz 0x0000 0000 1001
	 */
	//******************************************************************
	//u8 LocalWriteBuffer[8] = {0x00,0x00,0x00,0x00,0x00,0x00, 0x10,0x01};
	u8 LocalWriteBuffer[8] = {0x00,0x00,0x00,0x00,0x00,0x00, 0x20, 0x01};
	LocalWriteBuffer[0] = R1_REG_PLL_CONTROL_0 >> 8;
	LocalWriteBuffer[1] = R1_REG_PLL_CONTROL_0 & 0xff;

    xil_printf("R1_REG_PLL_CONTROL_0 ALL\n");
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		LocalWriteBuffer,
		sizeof(LocalWriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}

	//******************************************************************
	/*
	 * Enable Core Clock
	 */
    //R0: Clock Control, 16,384 (0x4000)
    WriteBuffer[0] = R0_REG_CLOCK_CONTROL >> 8;
    WriteBuffer[1] = R0_REG_CLOCK_CONTROL & 0xff;
    WriteBuffer[2] = 0b00000011;
    //[3]	 CLKSRC        0: PLL clock
    //[2:1]  INFREQ[1:0]   01: 512 × f S //RATIO_MCLK_AUD_CLK
    //[0]    COREN         1: Core clock enabled
    xil_printf("R0_REG_CLOCK_CONTROL sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
	//******************************************************************
	// SERIAL DATA INPUT/OUTPUT PORTS R15,R16,R17,R18
	//******************************************************************

    WriteBuffer[0] = R15_REG_SERIAL_PORT_0 >> 8;
    WriteBuffer[1] = R15_REG_SERIAL_PORT_0 & 0xff;
    WriteBuffer[2] = 0b00000001;
    //[2:1] CHPF[1:0] (Channels per frame sets the number of channels per LRCLK frame.) 00 Stereo (default)
    //[0]   MS (Serial data port bus mode. Both LRCLK and BCLK are master of the serial port when set in master mode and are
    //serial port slave in slave mode.)1 = master mode
    xil_printf("R15_REG_SERIAL_PORT_0 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}

    WriteBuffer[0] = R16_REG_SERIAL_PORT_1 >> 8;
    WriteBuffer[1] = R16_REG_SERIAL_PORT_1 & 0xff;
    //WriteBuffer[2] = 0x42;
    //[7:5] BPF[2:0] (Number of bit clock cycles per LRCLK audio frame)   010  48 Bit Clock Cycles
    //[1:0] LRDEL[1:0] (Data delay from LRCLK edge (in BCLK units).)  01  0 Delay (Bit Clock Cycles) <--- not working
    WriteBuffer[2] = 0b00000000;
    xil_printf("R16_REG_SERIAL_PORT_1 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
	//for R17_REG_CONVERTER_0 valid bits 6:0
    WriteBuffer[0] = R17_REG_CONVERTER_0 >> 8;
    WriteBuffer[1] = R17_REG_CONVERTER_0 & 0xff;
    WriteBuffer[2] = 0b0011000;
    //[4] DAOSR (DAC oversampling ratio.) 1 = 64×
    //[3] ADOSR (ADC oversampling ratio) 1 = 64×
    //[2:0] CONVSR[2:0] (Converter sampling rate. The ADCs and DACs operate at the sampling rate set in this register.
	//The converter rate selected is a ratio of the base sampling rate, f S . 
	//The base sampling rate is determined by the operating frequency
    //of the core clock.) 000 48 kHz, base (default)
    xil_printf("R17_REG_CONVERTER_0 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
	//******************************************************************
	// RECORD
	//******************************************************************

    WriteBuffer[0] = R4_REG_REC_MIXER_LEFT_0 >> 8;
    WriteBuffer[1] = R4_REG_REC_MIXER_LEFT_0 & 0xff;
    WriteBuffer[2] = 0x01;
    xil_printf("R4_REG_REC_MIXER_LEFT_0 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
    WriteBuffer[0] = R6_REG_REC_MIXER_RIGHT_0 >> 8;
    WriteBuffer[1] = R6_REG_REC_MIXER_RIGHT_0 & 0xff;
    WriteBuffer[2] = 0x01;
    xil_printf("R6_REG_REC_MIXER_RIGHT_0 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}

    WriteBuffer[0] = R5_REG_REC_MIXER_LEFT_1 >> 8;
    WriteBuffer[1] = R5_REG_REC_MIXER_LEFT_1 & 0xff;
    WriteBuffer[2] = 0b101;
    xil_printf("R5_REG_REC_MIXER_LEFT_1 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
    WriteBuffer[0] = R7_REG_REC_MIXER_RIGHT_1 >> 8;
    WriteBuffer[1] = R7_REG_REC_MIXER_RIGHT_1 & 0xff;
    WriteBuffer[2] = 0b101;
    xil_printf("R7_REG_REC_MIXER_RIGHT_1 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
	//******************************************************************
	// Set up the ADC
	// Enable ADC on both channels, normal polarity and ADC high-pass filter
    WriteBuffer[0] = R19_REG_ADC_CONTROL >> 8;
    WriteBuffer[1] = R19_REG_ADC_CONTROL & 0xff;
    //[1:0] ADCEN[1:0] (ADC enable) 11 - Both on
    WriteBuffer[2] = 0b0000011;
    xil_printf("R19_REG_ADC_CONTROL sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
	//******************************************************************
	// PLAY
	//******************************************************************

    WriteBuffer[0] = R22_REG_PLAY_MIXER_LEFT_0 >> 8;
    WriteBuffer[1] = R22_REG_PLAY_MIXER_LEFT_0 & 0xff;
    WriteBuffer[2] = 0b0100001;
    xil_printf("R22_REG_PLAY_MIXER_LEFT_0 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
    WriteBuffer[0] = R24_REG_PLAY_MIXER_RIGHT_0 >> 8;
    WriteBuffer[1] = R24_REG_PLAY_MIXER_RIGHT_0 & 0xff;
    WriteBuffer[2] = 0b1000001;
    xil_printf("R24_REG_PLAY_MIXER_RIGHT_0 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
	//******************************************************************
    WriteBuffer[0] = R29_REG_PLAY_HP_LEFT_VOL >> 8;
    WriteBuffer[1] = R29_REG_PLAY_HP_LEFT_VOL & 0xff;
    WriteBuffer[2] = 0b11001111;
    xil_printf("R29_REG_PLAY_HP_LEFT_VOL sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
    WriteBuffer[0] = R30_REG_PLAY_HP_RIGHT_VOL >> 8;
    WriteBuffer[1] = R30_REG_PLAY_HP_RIGHT_VOL & 0xff;
    WriteBuffer[2] = 0b11001111;
    xil_printf("R30_REG_PLAY_HP_RIGHT_VOL sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
	//******************************************************************
	// Set up the DAC
    WriteBuffer[0] = R35_REG_PLAY_POWER_MGMT >> 8;
    WriteBuffer[1] = R35_REG_PLAY_POWER_MGMT & 0xff;
    WriteBuffer[2] = 0b0000011;
    //[1] PREN (Playback right channel enable)  1 = enabled
    //[0] PLEN (Playback left channel enable)   1 = enabled
    xil_printf("R35_REG_PLAY_POWER_MGMT sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
    WriteBuffer[0] = R36_REG_DAC_CONTROL_0 >> 8;
    WriteBuffer[1] = R36_REG_DAC_CONTROL_0 & 0xff;
    WriteBuffer[2] = 0b0000011;
    //[1:0] DACEN[1:0] (DAC enable) 11 Both on
    xil_printf("R36_REG_DAC_CONTROL_0 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}

    WriteBuffer[0] = R37_REG_DAC_CONTROL_1 >> 8;
    WriteBuffer[1] = R37_REG_DAC_CONTROL_1 & 0xff;
    WriteBuffer[2] = 0b0001111;
    xil_printf("R37_REG_DAC_CONTROL_1 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}

    WriteBuffer[0] = R38_REG_DAC_CONTROL_2 >> 8;
    WriteBuffer[1] = R38_REG_DAC_CONTROL_2 & 0xff;
    WriteBuffer[2] = 0b0001111;
    xil_printf("R38_REG_DAC_CONTROL_2 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}

	//******************************************************************
	//R57: DSP Sampling Rate Setting, 16,619 (0x40EB)
	WriteBuffer[0] = R57_REG_DSP_SAMPLING_RATE_SETTING >> 8;
	WriteBuffer[1] = R57_REG_DSP_SAMPLING_RATE_SETTING & 0xff;
	WriteBuffer[2] = 0x01;
	//[3:0] DSPSR[3:0] (SigmaDSP core sampling rate) 0001 48 kHz (default)
	xil_printf("R57_REG_DSP_SAMPLING_RATE_SETTING sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
	}
	//******************************************************************
	// Set up the signal routing
    WriteBuffer[0] = R58_REG_SERIAL_INPUT_ROUTE_CTRL >> 8;
    WriteBuffer[1] = R58_REG_SERIAL_INPUT_ROUTE_CTRL & 0xff;
    WriteBuffer[2] = 0b01;
    //[3:0] SINRT[3:0] (Serial data input routing. This register sets the input where the DACs receive serial data. This location can be
    //from the DSP or from any TDM slot on the serial port.) 0001 Serial input [L0, R0] to DACs [L, R]
    xil_printf("R58_REG_SERIAL_INPUT_ROUTE_CTRL sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
	}
	//******************************************************************
	// Power up the various parts of the cores
    WriteBuffer[0] = R59_REG_SERIAL_OUTPUT_ROUTE_CTRL >> 8;
    WriteBuffer[1] = R59_REG_SERIAL_OUTPUT_ROUTE_CTRL & 0xff;
    WriteBuffer[2] = 0b01;
    //[3:0] SOUTRT[3:0] (Serial data output routing. This register sets the output where the ADCs send serial data. This location can be to
    //the DSP or to any TDM slot on the serial port.) 0001 ADCs [L, R] to serial output [L0, R0]
    xil_printf("R59_REG_SERIAL_OUTPUT_ROUTE_CTRL sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
	}
    //******************************************************************

	/*
	 * Enable Digital Clock Generator 0 and 1.
	 * Generator 0 generates sample rates for the ADCs, DACs, and DSP.
	 * Generator 1 generates BCLK and LRCLK for the serial port.
	 */
	 //R61_REG_DSP_ENABLE (default)
	 //R62_REG_DSP_RUN    (default)

	//R64: Serial Port Sampling Rate, 16,632 (0x40F8)
	//48 kHz, base (default)
	//R64_REG_SERIAL_PORT_SAMPLING_RATE


    WriteBuffer[0] = R65_REG_CLOCK_ENABLE_0 >> 8;
    WriteBuffer[1] = R65_REG_CLOCK_ENABLE_0 & 0xff;
    WriteBuffer[2] = 0b1111111;
    //[6] SLEWPD (Codec slew digital clock engine enable. When powered down, the analog playback path volume controls are
    //disabled and stay set to their current state)                         1 = enabled
    //[5] ALCPD (ALC digital clock engine enable)
    //[4] DECPD (Decimator resync (dejitter) digital clock engine enable)   1 = enabled
    //[3] SOUTPD (Serial routing outputs digital clock engine enable)       1 = enabled
    //[2] INTPD (Interpolator resync (dejitter) digital clock engine enable)1 = enabled
    //[1] SINPD (Serial routing inputs digital clock engine enable)         1 = enabled
    //[0] SPPD (Serial port digital clock engine enable.) 					1 = enabled
    xil_printf("R65_REG_CLOCK_ENABLE_0 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
		return XST_FAILURE;
	}
    WriteBuffer[0] = R66_REG_CLOCK_ENABLE_1 >> 8;
    WriteBuffer[1] = R66_REG_CLOCK_ENABLE_1 & 0xff;
    WriteBuffer[2] = 0b11;
    //[1] CLK1 (Digital Clock Generator 1) 1 = on
	//[0] CLK1 (Digital Clock Generator 0) 1 = on
    xil_printf("R66_REG_CLOCK_ENABLE_1 sz %d\n",sizeof(WriteBuffer)/sizeof(u8));
	Status = IicWrite(
		&iic_inst,
		SLAVE_ADDRESS + IICAddrOffset,
		WriteBuffer,
		sizeof(WriteBuffer)/sizeof(u8));
	if (Status != XST_SUCCESS)
	{
		xil_printf("IicWrite Failed\n");
	}
	return Status;
#else
	return XST_SUCCESS;
#endif
}

u32 InitializeI2sTx(XI2s_Tx *i2s_tx_ptr)
{
	u32 Status;
	XI2stx_Config *I2STxConfig;
	I2STxConfig = XI2s_Tx_LookupConfig(XPAR_I2S_TRANSMITTER_0_BASEADDR);
	if (I2STxConfig == NULL) {
		return XST_FAILURE;
	}

	Status = XI2s_Tx_CfgInitialize(i2s_tx_ptr, I2STxConfig,I2STxConfig->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XI2s_Tx_SetHandler(
		i2s_tx_ptr, 
		XI2S_TX_HANDLER_AES_BLKCMPLT,   
		&I2sTxAesBlockCmplIntrHandler,
		(void *)i2s_tx_ptr);
	XI2s_Tx_SetHandler(
		i2s_tx_ptr, 
		XI2S_TX_HANDLER_AES_BLKSYNCERR, 
		&I2sTxAesBlockErrIntrHandler,
		(void *)i2s_tx_ptr);
	XI2s_Tx_SetHandler(
		i2s_tx_ptr, 
		XI2S_TX_HANDLER_AES_CHSTSUPD,   
		&I2sTxAesGetChStsHandler,
		(void *)i2s_tx_ptr);
	XI2s_Tx_SetHandler(
		i2s_tx_ptr, 
		XI2S_TX_HANDLER_AUD_UNDRFLW,    
		&I2sTxUnderflowIntrHandler,
		(void *)i2s_tx_ptr);

	XI2s_Tx_SetSclkOutDiv(i2s_tx_ptr, I2S_TX_MCLK, I2S_TX_FS);
	XI2s_Tx_SetChMux(i2s_tx_ptr, 0, XI2S_TX_CHMUX_AXIS_01);

	XI2s_Tx_IntrEnable(i2s_tx_ptr, XI2S_TX_GINTR_EN_MASK);

	XI2s_Tx_IntrEnable(i2s_tx_ptr, XI2S_TX_INTR_AES_BLKCMPLT_MASK);
	XI2s_Tx_IntrEnable(i2s_tx_ptr, XI2S_TX_INTR_AES_BLKSYNCERR_MASK);
	XI2s_Tx_IntrEnable(i2s_tx_ptr, XI2S_TX_INTR_AES_CHSTSUPD_MASK);
	XI2s_Tx_IntrEnable(i2s_tx_ptr, XI2S_TX_INTR_AUDUNDRFLW_MASK);

	Status = XSetupInterruptSystem(
		i2s_tx_ptr, 
		&XI2s_Tx_IntrHandler,
		I2S_TX_INTERRUPT_ID,
		INTERRUPT_PARENT,
		XINTERRUPT_DEFAULT_PRIORITY);

	if (Status == XST_FAILURE) {
		xil_printf("IRQ init failed.\n\r\r");
		return XST_FAILURE;
	}
	return Status;
}

u32 InitializeI2sRx(XI2s_Rx *i2s_rx_ptr)
{
	u32 Status;
	XI2srx_Config *I2SRxConfig;
	I2SRxConfig = XI2s_Rx_LookupConfig(XPAR_I2S_RECEIVER_0_BASEADDR);
	if (I2SRxConfig == NULL)
		return XST_FAILURE;

	Status = XI2s_Rx_CfgInitialize(i2s_rx_ptr, I2SRxConfig,I2SRxConfig->BaseAddress);
	if (Status != XST_SUCCESS)
		return XST_FAILURE;

	XI2s_Rx_SetHandler(
		i2s_rx_ptr, 
		XI2S_RX_HANDLER_AES_BLKCMPLT, 
		&I2sRxAesBlockCmplIntrHandler, 
		(void *)i2s_rx_ptr);
	XI2s_Rx_SetHandler(
		i2s_rx_ptr, 
		XI2S_RX_HANDLER_AUD_OVRFLW, 
		&I2sRxOvrflwIntrHandler, 
		(void *)i2s_rx_ptr);

	XI2s_Rx_SetSclkOutDiv(i2s_rx_ptr, I2S_RX_MCLK, I2S_RX_FS);
	XI2s_Rx_SetChMux(i2s_rx_ptr, XI2S_RX_CHID0, XI2S_RX_CHMUX_XI2S_01);

	XI2s_Rx_IntrEnable(i2s_rx_ptr, XI2S_RX_GINTR_EN_MASK);
	XI2s_Rx_IntrEnable(i2s_rx_ptr, XI2S_RX_INTR_AES_BLKCMPLT_MASK);
	XI2s_Rx_IntrEnable(i2s_rx_ptr, XI2S_RX_INTR_AUDOVRFLW_MASK);

	Status = XSetupInterruptSystem(
		i2s_rx_ptr, 
		&XI2s_Rx_IntrHandler,
		I2S_RX_INTERRUPT_ID,
		INTERRUPT_PARENT,
		XINTERRUPT_DEFAULT_PRIORITY);

	if (Status == XST_FAILURE) {
		xil_printf("IRQ init failed.\n\r\r");
		return XST_FAILURE;
	}
	return Status;
}

u32 InitializeAudioFormatter(XAudioFormatter *af_ptr)
{
    u32 Status;

    Status = XAudioFormatter_Initialize(
        af_ptr, 
		XPAR_AUDIO_FORMATTER_0_BASEADDR);

    if (Status != XST_SUCCESS)
        return Status;

    if (af_ptr->s2mm_presence == 1) {
        af_ptr->ChannelId = XAudioFormatter_S2MM;

        XAudioFormatter_SetS2MMCallback(
            af_ptr, 
			XAudioFormatter_IOC_Handler,
            XS2MMAFCallback, 
			af_ptr);
        XAudioFormatter_SetS2MMCallback(
            af_ptr, 
			XAudioFormatter_TIMEOUT_Handler,
            XS2MMTimeoutCallback, 
			af_ptr);
        XAudioFormatter_SetS2MMCallback(
            af_ptr, 
			XAudioFormatter_ERROR_Handler,
            XS2MMErrorCallback, 
			af_ptr);
        XAudioFormatterSetS2MMTimeOut(af_ptr, AF_S2MM_TIMEOUT);
        XAudioFormatterSetHwParams(af_ptr, &af_hw_params_rx);
        Status = XSetupInterruptSystem(
            af_ptr,
            &XAudioFormatterS2MMIntrHandler,
            AF_S2MM_INTERRUPT_ID,
            INTERRUPT_PARENT,
            XINTERRUPT_DEFAULT_PRIORITY);
        if (Status != XST_SUCCESS) {
            xil_printf("S2MM IRQ setup failed\r\n");
            return Status;
        }
        XAudioFormatter_InterruptEnable(
            af_ptr,
            XAUD_CTRL_IOC_IRQ_MASK |
            XAUD_CTRL_TIMEOUT_IRQ_MASK |
            XAUD_CTRL_ERR_IRQ_MASK);
    }

    if (af_ptr->mm2s_presence == 1) {
        af_ptr->ChannelId = XAudioFormatter_MM2S;

        XAudioFormatter_SetMM2SCallback(
            af_ptr, 
			XAudioFormatter_IOC_Handler,
            XMM2SAFCallback, 
			af_ptr);
        XAudioFormatter_SetMM2SCallback(
            af_ptr, 
			XAudioFormatter_ERROR_Handler,
            XMM2SErrorCallback, 
			af_ptr);
        XAudioFormatterSetFsMultiplier(af_ptr, AF_MCLK, AF_FS);
        XAudioFormatterSetHwParams(af_ptr, &af_hw_params_tx);
        Status = XSetupInterruptSystem(
            af_ptr,
            &XAudioFormatterMM2SIntrHandler,
            AF_MM2S_INTERRUPT_ID,
            INTERRUPT_PARENT,
            XINTERRUPT_DEFAULT_PRIORITY);
        if (Status != XST_SUCCESS) {
            xil_printf("MM2S IRQ setup failed\r\n");
            return Status;
        }
        XAudioFormatter_InterruptEnable(
            af_ptr,
            XAUD_CTRL_IOC_IRQ_MASK |
            XAUD_CTRL_ERR_IRQ_MASK);
    }

    return XST_SUCCESS;
}

int RecordThenPlay(XAudioFormatter *af_ptr,XI2s_Rx *i2s_rx_ptr,XI2s_Tx *i2s_tx_ptr)
{
    XI2s_Rx_Enable(i2s_rx_ptr, FALSE);
    XI2s_Tx_Enable(i2s_tx_ptr, FALSE);

    /* Release CPU cache ownership before DMA accesses BRAM. */
    Xil_DCacheFlushRange((UINTPTR)AUDIO_BUFFER_ADDR, 256U * 1024U);
    Xil_DCacheInvalidateRange((UINTPTR)AUDIO_BUFFER_ADDR, 256U * 1024U);

    /* Configure both DMA channels to use the entire shared buffer. */
    af_ptr->ChannelId = XAudioFormatter_S2MM;
    XAudioFormatterSetHwParams(af_ptr, &af_hw_params_rx);
    XAudioFormatter_InterruptClear(af_ptr, XAUD_CTRL_IOC_IRQ_MASK);

    af_ptr->ChannelId = XAudioFormatter_MM2S;
    XAudioFormatterSetHwParams(af_ptr, &af_hw_params_tx);
    XAudioFormatter_InterruptClear(af_ptr, XAUD_CTRL_IOC_IRQ_MASK);

    S2MMAFRxPeriodsCompleted = 0;
    MM2SAFTxPeriodsCompleted = 0;
    AFAudioError = 0;

    /* Start writing into the first 128 KiB. */
    af_ptr->ChannelId = XAudioFormatter_S2MM;
    XAudioFormatterDMAStart(af_ptr);
    XI2s_Rx_Enable(i2s_rx_ptr, TRUE);

    /* Wait until all eight periods of the first half are filled. */
    while (S2MMAFRxPeriodsCompleted < AUDIO_PREFILL_PERIODS) {
        if (AFAudioError)
            goto stop_audio;

        usleep(100);
    }

    /*
     * RX now continues writing into the second 128 KiB.
     * Start TX reading from the first 128 KiB.
     */
    af_ptr->ChannelId = XAudioFormatter_MM2S;
    XAudioFormatterDMAStart(af_ptr);
    XI2s_Tx_Enable(i2s_tx_ptr, TRUE);

    /*
     * Both channels continue automatically:
     * RX writes second half; TX reads first half.
     * RX writes first half;  TX reads second half.
     */
	 /*
	 The Audio Formatter DMA moves through memory automatically.
	 Each DMA channel has a 256 KiB circular buffer. After period 7, it automatically returns to period 0.
	 RX and TX have independent positions in that same buffer.
	 The delayed TX start creates the separation between them.
	 */
     
    while (!AFAudioError) {
        for (u32 i = 0U; i < 50U && !AFAudioError; ++i) {
            usleep(100000);  /* 100 ms × 50 = 5 seconds */
        }

        if (AFAudioError)
            break;

        aud_filter_bypass ^= 1U;
        AudioFilter_SetBypass(AUDIO_FILTER_BASEADDR, aud_filter_bypass);

        xil_printf("Filter %s\r\n", aud_filter_bypass ? "OFF (bypassed)" : "ON");
    }

	stop_audio:
    XI2s_Rx_Enable(i2s_rx_ptr, FALSE);

    af_ptr->ChannelId = XAudioFormatter_S2MM;
    XAudioFormatterDMAStop(af_ptr);

    af_ptr->ChannelId = XAudioFormatter_MM2S;
    XAudioFormatterDMAStop(af_ptr);

    XI2s_Tx_Enable(i2s_tx_ptr, FALSE);

    /* Reset/reinitialize the hardware before calling again. */
    return XST_FAILURE;
}

int main()
{
	int Status = XST_FAILURE;
	InitializeI2C(&iic_inst);

	Status = InitAudioHardwareCodec();
	if (Status == XST_FAILURE) {
		xil_printf("\ninitHarwareCodec failed\n");
		return XST_FAILURE;
	}

	Status = InitializeI2sTx(&i2s_tx_inst);
	if (Status == XST_FAILURE) {
		xil_printf("\nI2sTx Init failed\n");
		return XST_FAILURE;
	}

	Status = InitializeAudioFormatter(&af_inst);
	if (Status == XST_FAILURE) {
		xil_printf("\nAudio Formatter Init failed\n");
		return XST_FAILURE;
	}

	Status = InitializeI2sRx(&i2s_rx_inst);
	if (Status == XST_FAILURE) {
		xil_printf("\nI2SRx Init failed\n");
		return XST_FAILURE;
	}

    AudioFilter_Start(AUDIO_FILTER_BASEADDR, 1U);
	
	Status = RecordThenPlay(
		&af_inst,
		&i2s_rx_inst,
		&i2s_tx_inst);

	if (Status != XST_SUCCESS) {
		xil_printf("Audio streaming stopped due to an error\r\n");
	}
}

#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"
#include "xil_exception.h"
#include "xtmrctr.h"
#include "xinterrupt_wrap.h"
#include "xgpio.h"
#include "xil_types.h"
#include "sleep.h"
#include "xiltimer.h"
#include <stdio.h>

/* Check the timer macro against your xparameters.h. */
#define LED_BASEADDR XPAR_AXI_LEDS_BASEADDR
#define BTN_BASEADDR XPAR_AXI_BTNS_BASEADDR
#define SW_BASEADDR  XPAR_AXI_SWS_BASEADDR
#define TIMER_BASEADDR  XPAR_AXI_TIMER_0_BASEADDR

#define TIMER_CHANNEL_0   0U



// uncomment it for real hardware
//#define REAL_HARDWARE

#ifdef REAL_HARDWARE
    #define TIMER_TICK (0.050)     /* 50 ms */
    #define TIMER_CLOCK_HZ 50000000U
#else
    #define TIMER_TICK (0.000010)  /* 10 us */
    #define TIMER_CLOCK_HZ 100000000U
#endif         
#define RESET_VALUE    (TIMER_CLOCK_HZ*TIMER_TICK - 2U)  /* 2_499_998U */

#define SHIFT_DIRECTION_LEFT (0)
#define SHIFT_DIRECTION_RIGHT (1)

#define SHIFT_DIRECTION_STATUS_STOPPED (0)
#define SHIFT_DIRECTION_STATUS_RUNNING (1)

#define LED_OFF (0)
#define LED_ON (1)

#define LED_POSITION_OUT_LEFT (0)
#define LED_POSITION_1 (1)
#define LED_POSITION_2 (2)
#define LED_POSITION_3 (4)
#define LED_POSITION_4 (8)
#define LED_POSITION_OUT_RIGHT (16)


//***********************************************
// this array contains possible delays for the software timer 
// the field CurrentDelayPosition of the LedApp structure keeps 
// possition of the delay that we are currently using


#ifdef REAL_HARDWARE
    #define DEFAUL_DELAY_POSIOTION (4) //20/*1000ms*/
    u32 PossibleDelays[] = {2/*100 ms*/, 5/*250 ms*/, 10/*500 ms*/, 15 /*750 ms*/, 20/*1000 ms*/, 30/*1500 ms*/, 40/*2000 ms*/};
#else
    #define DEFAUL_DELAY_POSIOTION (0) //1/*10 us*/
    u32 PossibleDelays[] = {1/*10 us*/, 2/*20 us*/, 3/*30 us*/, 4 /*40 us*/, 5/*50 us*/, 6/*60 us*/, 7/*70 us*/};
#endif   

const u32 DelaysSize = sizeof(PossibleDelays)/sizeof(u32);

void MoveDelayPositionUp(u32* Position)
{
    if(Position == NULL)
        return; 

    if(*Position == DelaysSize-1)
        *Position = 0;
    else
         (*Position)++;
       
}
void MoveDelayPositionDown(u32* Position)
{
    if(Position == NULL)
        return; 

    if(*Position == 0)
        *Position = DelaysSize-1;
    else
         (*Position)--;
}
//***********************************************
typedef struct 
{
    u8 LedState;
    u8 LedPosition;
    u8 LedShiftDirection;
    u32 CurrentDelayPosition;
    u32 TickCounter;
    u8 ShiftStatus;
    
} LedApp;
//***********************************************
LedApp application_;
static volatile u32 TimerExpired = 0U;

//***********************************************
//Timer handler called every TIMER_TICK ms
void TimerCounterHandler(void *CallBackRef, u8 TmrCtrNumber)
{
    XTmrCtr *InstancePtr = (XTmrCtr *)CallBackRef;
    if ((TmrCtrNumber == TIMER_CHANNEL_0) && XTmrCtr_IsExpired(InstancePtr, TmrCtrNumber)) {
        ++TimerExpired;
    }
}

//Timer init
int TimerInitAndRun(XTmrCtr *InstancePtr, UINTPTR BaseAddr)
{
    int Status;
    u32 TimerClockHz;

    Status = XTmrCtr_Initialize(InstancePtr, BaseAddr);
    if (Status != XST_SUCCESS) {
        return Status;
    }

    Status = XTmrCtr_SelfTest(InstancePtr, TIMER_CHANNEL_0);
    if (Status != XST_SUCCESS) {
        return Status;
    }

    /* Frequency of the AXI Timer's s_axi_aclk. */
    TimerClockHz = TIMER_CLOCK_HZ;

    if (TimerClockHz < 2U) {
        return XST_FAILURE;
    }

    XTmrCtr_SetHandler(InstancePtr,
                      TimerCounterHandler,
                      InstancePtr);

    XTmrCtr_SetOptions(InstancePtr, 
					TIMER_CHANNEL_0,
                    XTC_INT_MODE_OPTION |
                    XTC_AUTO_RELOAD_OPTION |
                    XTC_DOWN_COUNT_OPTION);

    // every 50ms we get the tick from axi timer
    XTmrCtr_SetResetValue(InstancePtr,
                         TIMER_CHANNEL_0,
                         RESET_VALUE);

    Status = XSetupInterruptSystem(
        InstancePtr,
        (XInterruptHandler)XTmrCtr_InterruptHandler,
        InstancePtr->Config.IntrId,
        InstancePtr->Config.IntrParent,
        XINTERRUPT_DEFAULT_PRIORITY);

    if (Status != XST_SUCCESS) {
        return Status;
    }

    xil_printf("Timer clock: %u Hz\r\n",(unsigned int)TimerClockHz);

    /* Initialize the shared counter BEFORE starting the timer. */
    TimerExpired = 0U;
    XTmrCtr_Start(InstancePtr, TIMER_CHANNEL_0);

    return XST_SUCCESS;
}
//***********************************************
// GPIO init
int GpioInitAndRun(XGpio *LedGpioPtr,XGpio *BtnGpioPtr,XGpio *SwGpioPtr)
{
    //XGpio_Config *cfg_ptr1 = XGpio_LookupConfig(LED_BASEADDR);
    //XGpio_CfgInitialize(LedGpioPtr, cfg_ptr1, cfg_ptr1->BaseAddress);
    XGpio_Initialize(LedGpioPtr, LED_BASEADDR);

    // XGpio_Config *cfg_ptr2 = XGpio_LookupConfig(BTN_BASEADDR);
    // XGpio_CfgInitialize(BtnGpioPtr, cfg_ptr2, cfg_ptr2->BaseAddress);
    XGpio_Initialize(BtnGpioPtr, BTN_BASEADDR);

    // XGpio_Config *cfg_ptr3 = XGpio_LookupConfig(SW_BASEADDR);
    // XGpio_CfgInitialize(SwGpioPtr, cfg_ptr3, cfg_ptr3->BaseAddress);
    XGpio_Initialize(SwGpioPtr, SW_BASEADDR);

    XGpio_SetDataDirection(LedGpioPtr, 1, 0x0); /* Outputs */
    XGpio_SetDataDirection(BtnGpioPtr, 1, 0xF); /* Inputs */
    XGpio_SetDataDirection(SwGpioPtr, 1, 0xF);  /* Inputs */
    return XST_SUCCESS;
}
void ShiftToNextPosition(LedApp* app)
{
    if(application_.ShiftStatus == SHIFT_DIRECTION_STATUS_RUNNING)
    {
        if (app->LedShiftDirection == SHIFT_DIRECTION_LEFT)        
            app->LedPosition = application_.LedPosition << 1;
        else  if (app->LedShiftDirection == SHIFT_DIRECTION_RIGHT) 
            application_.LedPosition = app->LedPosition >> 1;
        
        // handle the case of out of range value
        if ( app->LedShiftDirection == SHIFT_DIRECTION_LEFT)  
        {
            if(app->LedPosition == LED_POSITION_OUT_RIGHT)
            {
                app->LedPosition = LED_POSITION_1;
            }
        }
        else if (app->LedShiftDirection == SHIFT_DIRECTION_RIGHT) 
        {
            if(app->LedPosition == LED_POSITION_OUT_LEFT)
            {
                app->LedPosition = LED_POSITION_4;
            }
        }
    }
}
//***********************************************
int main(void)
{
    XGpio led_gpio;
    XGpio btn_gpio;
    XGpio sw_gpio;
    XTmrCtr TimerCounterInst;

    int InitStatus;
    u32 LastTimerExpired = 0U;
    application_.CurrentDelayPosition = DEFAUL_DELAY_POSIOTION;
    application_.TickCounter = 0;
    application_.ShiftStatus = SHIFT_DIRECTION_STATUS_RUNNING;

    xil_printf("Start app\r\n");

    InitStatus = TimerInitAndRun(&TimerCounterInst, TIMER_BASEADDR);
    if (InitStatus != XST_SUCCESS) {
        xil_printf("Timer initialization failed\r\n");
        return XST_FAILURE;
    }
 
    InitStatus = GpioInitAndRun(&led_gpio, &btn_gpio, &sw_gpio);
    if (InitStatus != XST_SUCCESS) {
        xil_printf("Gpio initialization failed\r\n");
        return XST_FAILURE;
    }

    u32 btn_value = 0;
    u32 sw_value = 0;
    u32 previous_buttons = 0;
    application_.LedPosition = LED_POSITION_1;
    application_.LedState = LED_ON;
    
    while (1) {
            
        u32 CurrentTimerExpired = TimerExpired;
        //max timer value was reached process logic for leds
        if (CurrentTimerExpired != LastTimerExpired) {
            LastTimerExpired = CurrentTimerExpired;
            
            //here we are getting 2 bits value
            sw_value= XGpio_DiscreteRead(&sw_gpio, 1);
            
            switch(sw_value){
                case 0://both switches are off
                    application_.LedShiftDirection = SHIFT_DIRECTION_LEFT;
                break;
                case 1://one switche is off other is on
                    application_.LedShiftDirection = SHIFT_DIRECTION_RIGHT;
                break;
                case 2://one switche is off other is on
                    application_.LedShiftDirection = SHIFT_DIRECTION_RIGHT;
                break;
                break;
                case 3://both switches in off
                    application_.LedShiftDirection = SHIFT_DIRECTION_LEFT;
                break;
            }
    
            // nevertheless we are calling this fucn every 50ms
            // it still return that key is up during several cycles
            // the logic belong prevent that            
            btn_value = XGpio_DiscreteRead(&btn_gpio, 1) & 0x0FU;
            u32 newly_pressed = btn_value & ~previous_buttons;
            previous_buttons = btn_value;

            // Act only when a new press occurs.
            if (newly_pressed != 0U) {
                switch (btn_value) {
                    case 1U:
                        MoveDelayPositionDown(
                            &application_.CurrentDelayPosition);
                            application_.TickCounter = 0;
                        break;

                    case 2U:
                        MoveDelayPositionUp(
                            &application_.CurrentDelayPosition);
                            application_.TickCounter = 0;
                        break;

                    case 4U:
                        // Stop.
                        application_.ShiftStatus = SHIFT_DIRECTION_STATUS_STOPPED;
                        break;

                    case 8U:
                        // Start.
                        application_.ShiftStatus = SHIFT_DIRECTION_STATUS_RUNNING;
                        break;

                    default:
                        // Ignore multiple buttons pressed together.
                        break;
                }
            }

            // here is the impl of the software timer
            application_.TickCounter++;
            u32 CurrentDalay = PossibleDelays[application_.CurrentDelayPosition];
            if(application_.TickCounter == CurrentDalay) {
                // new strobe for indication
                application_.TickCounter = 0;
    
                if(application_.LedState == LED_ON)
                {
                    application_.LedState = LED_OFF;
                    XGpio_DiscreteWrite(&led_gpio, 1, application_.LedPosition & 0xF);
                }
                else
                {
                    application_.LedState = LED_ON;
                    XGpio_DiscreteWrite(&led_gpio, 1, LED_OFF & 0xF);
                    
                    // we went through the ON-OFF cycle for current led possition
                    // time to shift it based on LedShiftDirection
                    ShiftToNextPosition(&application_);
                } 
            }
        }
    }
    xil_printf("End app\r\n");
}

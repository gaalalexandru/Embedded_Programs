/*--------------------Type Includes------------------*/
#include "stdbool.h"
#include "stdint.h"
/*------------------Project Includes-----------------*/

#include "gpio_handler.h"
#include "pwm_handler.h"
//#include "ssi_handler.h"
#include "ssi_handler_tw.h"
#include "rgb_st.h"
#include "lcd.h"
#include "SysTick.h"

/*-------------------Driver Includes-----------------*/
#include "driverlib/sysctl.h"
#include "driverlib/pin_map.h"
#include "driverlib/gpio.h"
#include "inc/hw_memmap.h"

#include "timer.h"

#include "display.h"

#define RED (0x02)	//PF1
#define BLUE (0x04)	//PF2
#define GREEN (0x08)  //PF3
//#define Servo_DutyCycle_Step (1)

#ifdef __TI_COMPILER_VERSION__
	//Code Composer Studio Code
	void Delay(uint32_t ulCount){
	__asm (	"loop    subs    r0, #1\n"
			"    bne     loop\n");
}

#else
	//Keil uVision Code
	__asm void
	Delay(uint32_t ulCount)
	{
    subs    r0, #1
    bne     Delay
    bx      lr
	}
#endif



int main(void)
{
	unsigned long ui32SysClock;
	uint8_t number = 0x01;
	uint32_t n;
	
	SysCtlClockSet(SYSCTL_SYSDIV_2_5 | SYSCTL_USE_PLL | SYSCTL_XTAL_16MHZ | SYSCTL_OSC_MAIN); //80 Mhz
	ui32SysClock = SysCtlClockGet();

	Display_Init();
	Display_String("Clock Initialized "); 
	Display_NewLine();
	
	SSI0_Init();  //Init SPI to shift register, needed to control LCD
	LCD_Init();  //Init LCD
	Display_String("LCD Initialized "); 
	Display_NewLine();
	
	n = 0;
	LCD_Clear();
	LCD_OutString(" Test LCD ");
	//LCD_Clear();
	
	while(ui32SysClock)  //Clock working
	{
		Display_String("LCD running "); 
		Display_NewLine();
		//LCD_Clear();
		//LCD_OutUDec(n);
		//SysTick_Wait10ms(50);
		//LCD_OutChar(32);
		LCD_OutUHex(n);
		SysTick_Wait10ms(40);
		//n++;
		n = (n + 1) % 16;

	}
	return 0;
}
//EOF

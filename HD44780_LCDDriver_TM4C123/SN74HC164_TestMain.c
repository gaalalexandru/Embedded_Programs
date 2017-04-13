// Nokia5110TestMain.c
// Runs on LM4F120/TM4C123
// Test the functions in Nokia5110.c by printing various
// things to the LCD.
// Daniel Valvano
// September 16, 2013

#include <stdint.h>
#include "SSI_handler.h"
#include "PLL.h"

// delay function for testing from sysctl.c
// which delays 3*ulCount cycles
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


int main(void){
	uint8_t number = 0x01;
  PLL_Init(Bus80MHz);  // set system clock
  SSI0_Init();
  while(1){
		number = 0xff;
		SSI0_DataOut(number);
		//number = ((number + 1) % 8);
		//number = number << 1;
		//if(!number) number = 1;
		//Delay(80000000);  // delay ~0.5 sec at 50 MHz
		
  }
}

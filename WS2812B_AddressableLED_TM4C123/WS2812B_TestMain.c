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

#define HighBit (0xF8)
#define LowBit	(0xE0)

int main(void){
	uint8_t mask = 0x80;
	uint8_t	data[15] = {0x00 ,0x00 ,0x00,0x00 ,0x00 ,0x00,0x00 ,0x00 ,0x00,0x00 ,0xFF ,0x00,0x00 ,0xFF ,0x00};
	uint8_t i = 0;
	uint8_t j = 0;
  PLL_Init(Bus80MHz);
  SSI0_Init();
  while(1){
		for (i=0;i<15;i++){
			for (j=0;j<8;j++){
				if ((data[i]&(mask>>j)) == 1){
					SSI0_DataOut(HighBit);
				}
				else{
					SSI0_DataOut(LowBit);
				}
			}
		}
		Delay(8333);
  }
}

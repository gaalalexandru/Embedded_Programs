#include <stdint.h>
#include "SSI_handler_tivaware.h"
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
	uint8_t number = 0;
  PLL_Init(Bus80MHz);                   // set system clock to 50 MHz
  SSI0_Init();
  while(1){
		SSI0_DataOut(number);
		number = ((number + 1) % 8);
		Delay(8333333);                     // delay ~0.5 sec at 50 MHz
  }
}

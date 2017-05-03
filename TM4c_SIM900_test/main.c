#include "uart_handler.h"
#include "driverlib/uart.h"
#include "driverlib/sysctl.h"
/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"

void delay(unsigned long time){
	while(time){
		time--;
	}
}
	
int main(void){
	uint8_t data_uart0[200];
	SysCtlClockSet(SYSCTL_SYSDIV_2_5 | SYSCTL_USE_PLL | SYSCTL_XTAL_16MHZ | SYSCTL_OSC_MAIN); //80 Mhz
	UART2_Init();
	UART0_Init();
	while(1){
		UART0_GetString(data_uart0, 200);
		UART2_SendString(data_uart0);
		UART0_SendNewLine();
		if(UARTCharsAvail(UART2_BASE)){
			UART0_SendChar(UART2_GetChar());
		}
		UART0_SendNewLine();
		UART0_SendString("sent");
	}
}
//EOF

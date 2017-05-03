//uart_handler.c

#include "uart_handler.h"
#include "driverlib\sysctl.h"
#include "driverlib\gpio.h"
#include "driverlib\uart.h"
#include "driverlib/pin_map.h"
#include "inc/hw_memmap.h"

void UART0_Init(void){
	uint32_t clock = 0;
	uint32_t baud_check = 0;
	uint32_t config_check = 0;
	
	SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);  //Enable clock on UART0
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);  //Enable clock on port A  //PA0 and PA1 is hard wired to debugger and USB
	
	UARTDisable(UART0_BASE);  //Disable UART0 while configuration
	GPIOPinConfigure(GPIO_PA1_U0TX);
	GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_1);
	UARTClockSourceSet(UART0_BASE, UART_CLOCK_SYSTEM);  //Set the clock source for UART0
	//Next: Set the BAUD RATE, and configure UART0 with 8 data bits, 1 stop bit and no parity bit
	clock = SysCtlClockGet();
	UARTConfigSetExpClk(UART0_BASE, clock, BAUD_RATE, (UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE |UART_CONFIG_PAR_NONE));  
	UARTFIFOEnable(UART0_BASE);  //Enable the UART FIFO
	UARTEnable(UART0_BASE);  //Enable UART0
	UARTConfigGetExpClk(UART0_BASE, clock, &baud_check, &config_check);
	clock++;
}

void UART0_SendChar(uint8_t data){
	UARTCharPut(UART0_BASE, data);
}

void UART0_SendString(uint8_t *string){
	while(*string){
		UART0_SendChar(*string);
		string++;
	}
}

void UART0_SendDecimal(uint32_t decimal){
	if(decimal >= 10){
		UART0_SendDecimal(decimal/10);
		decimal = decimal % 10;
  }
  UART0_SendChar(decimal +'0'); /* n is between 0 and 9 */
}

void UART0_NewLine(void){
	UART0_SendChar(CR);
	UART0_SendChar(LF);
}
//EOF

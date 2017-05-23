/*------------------Project Includes-----------------*/
#include "uart_handler.h"
#include "pc_display.h"
//#include "fifo.h"
/*-------------------Driver Includes-----------------*/
#include "driverlib/sysctl.h"
#include "driverlib/uart.h"
#include "driverlib/pin_map.h"
#include "driverlib/gpio.h"
#include "driverlib/interrupt.h"
/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"
#include "utils/uartstdio.h"
/*-------------------Macro Definitions----------------*/
// U0Rx (VCP receive) connected to PA0
// U0Tx (VCP transmit) connected to PA1

#define BAUD_RATE (115200)
#define GSM_BAUD_RATE (115200)
#define GSM_UART_PORT (2)

#define UART2_INT_PRIO (2)

#define GPIO_PORTD_LOCK_R       (*((volatile uint32_t *)0x40007520))
#define GPIO_PORTD_CR_R         (*((volatile uint32_t *)0x40007524))

//#define FIFOSIZE   128	// size of the FIFOs (must be power of 2)
//#define FIFOSUCCESS 1		// return value on success
//#define FIFOFAIL    0		// return value on failure

// create index implementation FIFO (see FIFO.h)
//AddIndexFifo(GSM_Rx, FIFOSIZE, char, FIFOSUCCESS, FIFOFAIL)
//AddPointerFifo(GSM_Rx, FIFOSIZE, char, FIFOSUCCESS, FIFOFAIL)
//AddIndexFifo(GSM_Tx, FIFOSIZE, char, FIFOSUCCESS, FIFOFAIL)
//AddPointerFifo(GSM_Tx, FIFOSIZE, char, FIFOSUCCESS, FIFOFAIL)

/*-------------Global Variable Definitions------------*/
extern int32_t SMSReceived;
uint32_t Baud_Rate_Read = 0;
uint32_t GSM_Baud_Rate_Read = 0;

/*-------------------Function Definitions-------------*/
// copy from hardware RX FIFO to software RX FIFO
// stop when hardware RX FIFO is empty or software RX FIFO is full
/*
void static copyHardwareToSoftware(void){
	char letter;
	while((UARTCharsAvail(UART2_BASE)) && (GSM_RxFifo_Size() < (FIFOSIZE - 1))){
		letter = UARTCharGet(UART2_BASE);
		GSM_RxFifo_Put(letter);
		PC_Display_Message("HW -> SW char sent ",letter," ");
	}
}

// copy from software TX FIFO to hardware TX FIFO
// stop when software TX FIFO is empty or hardware TX FIFO is full
void static copySoftwareToHardware(void){
	char letter;
	while((UARTSpaceAvail(UART2_BASE)) && (GSM_TxFifo_Size() > 0)){
		GSM_TxFifo_Get(&letter);
		UARTCharPut(UART2_BASE,letter);
		PC_Display_Message("SW -> HW char sent ",letter," ");
	}
}
*/

//*****************************************************************************
//
// UART0 SPECIFIC FUNCTIONS
//
//*****************************************************************************
void UART0_Init(void){
	uint32_t uart_config_read = 0;
	SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);  //Enable clock on UART0
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);  //Enable clock on port A  //PA0 and PA1 is hard wired to debugger and USB
	UARTDisable(UART0_BASE);  //Disable UART0 while configuration
	
	GPIOPinConfigure(GPIO_PA0_U0RX);
	GPIOPinConfigure(GPIO_PA1_U0TX);
	GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1); //AleGaa PA0
	UARTClockSourceSet(UART0_BASE, UART_CLOCK_SYSTEM);  //Set the clock source for UART0
	//Next: Set the BAUD RATE, and configure UART0 with 8 data bits, 1 stop bit and no parity bit
	UARTConfigSetExpClk(UART0_BASE, SysCtlClockGet(), BAUD_RATE, (UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE |UART_CONFIG_PAR_NONE));  
	UARTFIFOEnable(UART0_BASE);  //Enable the UART FIFO
	UARTEnable(UART0_BASE);  //Enable UART0
	UARTConfigGetExpClk(UART0_BASE, SysCtlClockGet(), &Baud_Rate_Read, &uart_config_read);  //Get the Baud Rate
}

void UART0_SendChar(uint8_t data){
	UARTCharPut(UART0_BASE, data);
}

void UART0_SendString(uint8_t *pt){
	while(*pt) { //While not the end of the string
		UART0_SendChar(*pt);  //display current character
		pt++;  //move to next character
	}
}

void UART0_SendUDecimal(uint32_t n){
// This function uses recursion to convert an unsigned decimal number
//   of unspecified length as an ASCII string
	if(n >= 10){
		UART0_SendUDecimal(n/10);
		n = n%10;
  }
  UART0_SendChar(n+'0'); /* n is between 0 and 9 */
}

void UART0_SendNewLine(void){
  UART0_SendChar(CR);
  UART0_SendChar(LF);
}

//*****************************************************************************
//
// UART2 SPECIFIC FUNCTIONS
//
//*****************************************************************************
void UART2_Init(void){
	uint32_t uart_config_read = 0;
	SysCtlPeripheralEnable(SYSCTL_PERIPH_UART2);  //Enable clock on UART2
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);  //Enable clock on port D  //PD6 and PD7 will be RX and TX to GSM module
	while(!SysCtlPeripheralReady(SYSCTL_PERIPH_UART2));  //wait for UART2 to initialize
	while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOD));  //wait for PortD to initialize
	
	//GSM_RxFifo_Init();  // initialize empty FIFOs
	//GSM_TxFifo_Init();
	
	GPIO_PORTD_LOCK_R = 0x4C4F434B;  //Unlock GPIO PD7
	GPIO_PORTD_CR_R |= 0xC0;  //Allow changes to PD6,7
	
	IntDisable(INT_UART2);
	UARTIntDisable(UART2_BASE,UART_INT_RX|UART_INT_TX|UART_INT_RT);  //Disable UART2 Interrupts
	UARTDisable(UART2_BASE);  //Disable UART2 while configuration
	
	GPIOPinConfigure(GPIO_PD6_U2RX);  //PCTL
	GPIOPinConfigure(GPIO_PD7_U2TX);
	GPIOPinTypeUART(GPIO_PORTD_BASE, GPIO_PIN_6 | GPIO_PIN_7);  //DIR, PAD, 
	
	UARTClockSourceSet(UART2_BASE, UART_CLOCK_SYSTEM);  //Set the clock source for UART2
	//Next: Set the BAUD RATE, and configure UART2 with 8 data bits, 1 stop bit and no parity bit
	//UARTConfigSetExpClk(UART2_BASE, SysCtlClockGet(), GSM_BAUD_RATE, (UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE |UART_CONFIG_PAR_NONE));  
	UARTParityModeSet(UART2_BASE, UART_CONFIG_PAR_NONE);
	//UARTFIFOLevelSet(UART2_BASE,UART_FIFO_TX1_8,UART_FIFO_RX1_8);
	

	
	UARTFIFOEnable(UART2_BASE);  //Enable the UART FIFO
	//UARTEnable(UART2_BASE);  //Enable UART2
	//UARTIntEnable(UART2_BASE,UART_INT_RX|UART_INT_TX|UART_INT_RT);
	//IntPrioritySet(INT_UART2,(UART2_INT_PRIO<<5));
	//IntEnable(INT_UART2);
	
	UARTStdioConfig(GSM_UART_PORT, GSM_BAUD_RATE, SysCtlClockGet());
	UARTEchoSet(false);
	
	UARTConfigGetExpClk(UART2_BASE, SysCtlClockGet(), &GSM_Baud_Rate_Read, &uart_config_read);  //Get the Baud Rate
}

//EOF
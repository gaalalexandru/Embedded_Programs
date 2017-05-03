//main.c
#include "stdint.h"
#include "stdbool.h"
#include "driverlib\gpio.h"
#include "driverlib\sysctl.h"
#include "driverlib\pin_map.h"
#include "driverlib\interrupt.h"

#include "inc\hw_memmap.h"
#include "inc\hw_ints.h"

#include "uart_handler.h"

#define GPIO_PORTF_LOCK_R       (*((volatile unsigned long *)0x40025520))
#define GPIO_PORTF_CR_R         (*((volatile unsigned long *)0x40025524))

uint32_t Desired_Color = 0;
uint8_t Desired_State = 1;

void delay(unsigned long time) {
	while (time) {
		time --;
	}
}

void Switch_Color(void){
	static uint8_t counter = 0;
	counter = (counter + 1) % 8;
	Desired_Color = counter * 2;
	UART0_SendString("Color code changed to: ");
	UART0_SendDecimal(Desired_Color);
	UART0_NewLine();
}

void Toggle_Led(void){
	Desired_State ^= 1;
	UART0_SendString("State changed to: ");
	UART0_SendDecimal(Desired_State);
	UART0_NewLine();
}

void Init_PortF_Input(void){
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);  //Enable clock on port F
	GPIO_PORTF_LOCK_R = 0x4C4F434B;  //Unlock PortF PF0
  GPIO_PORTF_CR_R |= 0x11;  //Allow changes to PF0,4
	IntDisable(INT_GPIOF);  //GPIO Port F disable of interrupts
	GPIOIntDisable(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4);
	GPIOIntTypeSet(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4, GPIO_FALLING_EDGE);  //Set Low level interrupt type
	GPIODirModeSet(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4, GPIO_DIR_MODE_IN);
	GPIOPadConfigSet(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4,GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);
	IntPrioritySet(INT_GPIOF,0);
	GPIOIntEnable(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4);
	IntEnable(INT_GPIOF);  //GPIO Port F disable of interrupts
}

void Init_PortF_Output(void){
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);  //Enable clock on port F
	GPIO_PORTF_LOCK_R = 0x4C4F434B;  //Unlock PortF PF0
  GPIO_PORTF_CR_R |= 0x0E;  //Allow changes to PF1,2,3
	GPIODirModeSet(GPIO_PORTF_BASE, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_DIR_MODE_OUT);
	GPIOPadConfigSet(GPIO_PORTF_BASE, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_STRENGTH_8MA, GPIO_PIN_TYPE_STD);
}

void GPIOF_Handler(void){
uint8_t pressed_button = 0;
	IntDisable(INT_GPIOF);  //GPIO Port F enable of interrupts
	delay(500000);
	pressed_button = GPIOPinRead(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4);
	GPIOIntClear(GPIO_PORTF_BASE, GPIO_PIN_0 | GPIO_PIN_4);
	if((pressed_button&GPIO_PIN_0) == 0) {
		Switch_Color();
	}
	if((pressed_button&GPIO_PIN_4) == 0) {
		Toggle_Led();
	}
	IntEnable(INT_GPIOF);  //GPIO Port F disable of interrupts
}

int main(void){
	Init_PortF_Output();
	Init_PortF_Input();
	UART0_Init();
	IntMasterEnable();
	UART0_SendString("System init done...");
	UART0_NewLine();
	while(1){
		delay(5);
		if(Desired_State){
			GPIOPinWrite(GPIO_PORTF_BASE,GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, Desired_Color);
		}
		else {
			GPIOPinWrite(GPIO_PORTF_BASE,GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, 0);
		}
	}
	return 0;
}

//EOF

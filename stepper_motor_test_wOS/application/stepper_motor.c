
#include "stepper_motor.h"

#define STEP_PIN	GPIO_PIN_2
#define DIR_PIN	GPIO_PIN_3

#define GPIO_PORTF_LOCK_R       (*((volatile unsigned long *)0x40025520))
#define GPIO_PORTF_CR_R         (*((volatile unsigned long *)0x40025524))

void SM_Init(void) {
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);	//Enable clock on port F
	while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOF));
	GPIO_PORTF_LOCK_R = 0x4C4F434B;  //Unlock GPIO PF0 if necessary
	GPIO_PORTF_CR_R |= 0x1F;  //Allow changes to PF4-0
	
	GPIOIntDisable(GPIO_PORTF_BASE,STEP_PIN | DIR_PIN);  //Disable GPIO pin interrupt
	GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, STEP_PIN | DIR_PIN);  //Set GPIO Output
	GPIODirModeSet(GPIO_PORTF_BASE, STEP_PIN | DIR_PIN, GPIO_DIR_MODE_OUT);  //Set direction output
	GPIOPadConfigSet(GPIO_PORTF_BASE, STEP_PIN | DIR_PIN, GPIO_STRENGTH_12MA, GPIO_PIN_TYPE_STD); //Configure PUR
	
	GPIOPinWrite(GPIO_PORTF_BASE, STEP_PIN | DIR_PIN, 0);
}

void SM_DIR(uint8_t status) {
	GPIOPinWrite(GPIO_PORTF_BASE, DIR_PIN, status);	//Set the desired status	
}

void SM_STEP(void) {
	uint8_t i = 255;
	GPIOPinWrite(GPIO_PORTF_BASE, STEP_PIN, STEP_PIN);	//Set
	while(i){		//whait a bit
		i--;
	}
	GPIOPinWrite(GPIO_PORTF_BASE, STEP_PIN, 0);	//Clear
}
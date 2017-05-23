#ifndef GPIO_HANDLER_H
#define GPIO_HANDLER_H

/*--------------------Type Includes------------------*/
#include "stdbool.h"
#include "stdint.h"

/*-------------------HW define Includes--------------*/
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"
/*------------------TivaWare Includes----------------*/
#include "driverlib/gpio.h"

#include "driverlib/sysctl.h"

#define PORT_A 0x0
#define PORT_B 0x1
#define PORT_C 0x2
#define PORT_D 0x3
#define PORT_E 0x4 
#define PORT_F 0x5
/*-------------------Macro Definitions----------------*/

#define SetGPIOPin(port, pin)     (GPIOPinWrite(GPIO_PORT ## port ## _BASE,pin,pin))
#define ClearGPIOPin(port, pin)		(GPIOPinWrite(GPIO_PORT ## port ## _BASE,pin,0)) 

//GPIO_PORTF_BASE
//SYSCTL_PERIPH_GPIOF
//example for set / clear pin from application where port and pin might vary at runtime
#define SetGPIO_PF1								(SetGPIOPin(F,1))
#define ClearGPIO_PF1							(ClearGPIOPin(F,1))
#define SetGPIO_PF2								(SetGPIOPin(F,2))
#define ClearGPIO_PF2							(ClearGPIOPin(F,2))
#define SetGPIO_PF3								(SetGPIOPin(F,3))
#define ClearGPIO_PF3							(ClearGPIOPin(F,3))

#define SetGPIOOutput(port, pin) { SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIO ## port);\
														GPIOPinTypeGPIOOutput(GPIO_PORT ## port ## _BASE, pin);\
														GPIODirModeSet(GPIO_PORT ## port ## _BASE,pin, GPIO_DIR_MODE_OUT);\
														GPIOPadConfigSet(GPIO_PORT ## port ## _BASE, pin, GPIO_STRENGTH_2MA,GPIO_PIN_TYPE_STD);\
														GPIOPinWrite(GPIO_PORT ## port ## _BASE,pin,0);};

														/*
														switch (port){\
														case GPIO_PORTA_BASE: SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA); break; \
														case GPIO_PORTB_BASE: SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB); break; \
														case GPIO_PORTC_BASE: SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOC); break; \
														case GPIO_PORTD_BASE: SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD); break; \
														case GPIO_PORTE_BASE: SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE); break; \
														case GPIO_PORTF_BASE: SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF); break; \
														default: break;}
														*/														
														
//SetGPIOInput - init: set GPIO Output, set direction output, configure, set initially 0
//ClearGPIOPin - write Port & Pin to clear it
//SetGPIOOutput - write Port & Pin to set it
														
/*-----------External function definisions-----------*/
void RGB_Led_Blink(unsigned long, unsigned long);
void delay(int);
void delayMS(int);
void SetGPIOInput(unsigned long , unsigned long );
void SetGPIOInterrupt(unsigned long , unsigned long, unsigned long );
int ReadPinState(unsigned long , unsigned long );
void SavePinState(char, unsigned long , unsigned long )	;	
#endif


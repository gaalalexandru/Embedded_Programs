// os_hw.h - ssOS Target HW specific code - Interrupt Service Routines, Target configurations
// ssOS - stupid simple Operating System
// A very simple real time operating system with minimal features.
// For copyright, configuration and usage read readme.txt

#ifndef __OSHW_H
#define __OSHW_H  1

#include "os_core.h"

/*
#define	Pin0	(0x01)
#define Pin1	(0x02)
#define Pin2	(0x04)
#define Pin3	(0x08)
#define Pin4	(0x10)
#define Pin5	(0x20)
#define Pin6	(0x40)
#define	Pin7	(0x80)
*/

struct port_sema {
	int32_t pin0;
	int32_t pin1;
	int32_t pin2;
	int32_t pin3;
	int32_t pin4;
	int32_t pin5;
	int32_t pin6;
	int32_t pin7;
};
typedef struct port_sema PortSema_t;

#ifdef TARGET_TM4C
//TM4C specific code
#include "BSP_TM4C.h"

/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"
/*-------------------HW define Includes--------------*/
#include "inc/hw_ints.h"
#include "inc/hw_memmap.h"
/*-------------------Driver Includes-----------------*/
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/interrupt.h"
#include "driverlib/sysctl.h"

enum tm4c_ports {
	PortA = 0,
	PortB,
	PortC,
	PortD,
	PortE,
	PortF
};
typedef enum tm4c_ports	ports_t;

#define GPIO_PORTA_LOCK_R       (*((volatile uint32_t *)0x40004520))
#define GPIO_PORTA_CR_R         (*((volatile uint32_t *)0x40004524))
#define GPIO_PORTB_LOCK_R       (*((volatile uint32_t *)0x40005520))
#define GPIO_PORTB_CR_R         (*((volatile uint32_t *)0x40005524))
#define GPIO_PORTC_LOCK_R       (*((volatile uint32_t *)0x40006520))
#define GPIO_PORTC_CR_R         (*((volatile uint32_t *)0x40006524))
#define GPIO_PORTD_LOCK_R       (*((volatile uint32_t *)0x40007520))
#define GPIO_PORTD_CR_R         (*((volatile uint32_t *)0x40007524))
#define GPIO_PORTE_LOCK_R       (*((volatile uint32_t *)0x40024520))
#define GPIO_PORTE_CR_R         (*((volatile uint32_t *)0x40024524))
#define GPIO_PORTF_LOCK_R       (*((volatile uint32_t *)0x40025520))
#define GPIO_PORTF_CR_R         (*((volatile uint32_t *)0x40025524))
	
#endif //TARGET_TM4C

#ifdef TARGET_MSP432
//MSP432 specific code
#include "BSP_MSP432.h"

#define Port1	(0);
#define	Port2	(1);
#define Port3	(2);
#define	Port4	(3);
#define Port5	(4);
#define	Port6	(5);

#endif //TARGET_TM4C

uint8_t OS_EdgeTrigger_Restart(ports_t port, uint8_t pin);
uint8_t OS_EdgeTrigger_Init(ports_t port, uint8_t pin, uint8_t priority, uint8_t type, uint8_t resistor);	
#endif

//EOF

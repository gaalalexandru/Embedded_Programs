#include "stdbool.h"
#include "stdint.h"
#include "SSI_handler_tivaware.h"

/*-------------------Driver Includes-----------------*/
#include "gpio.h"
#include "pin_map.h"
#include "ssi.h"
#include "sysctl.h"
#include "inc/hw_memmap.h"

void SSI0_DataOut(uint8_t data){
	SSIDataPut(SSI0_BASE,data);
}

void SSI0_Init(void){
	uint8_t delay = 0;
	
	SysCtlPeripheralEnable(SYSCTL_PERIPH_SSI0);		//SSI 0 enable 
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);	//Port A enable
	
	SSIDisable(SSI0_BASE);												 //Disable SSI0

	GPIOPinConfigure(GPIO_PA2_SSI0CLK);		//PA2 - Clock
	GPIOPinConfigure(GPIO_PA5_SSI0TX);		//PA5 - TX
	GPIOPinTypeSSI(GPIO_PORTA_BASE, GPIO_PIN_2 | GPIO_PIN_5);	// Configure PA2 and PA5 as SSI
	
	SSIClockSourceSet(SSI0_BASE, SSI_CLOCK_SYSTEM);	// Set the SSI clock source
	
	//Peripherial base, Input clock, Frame format, Mode, Bit Data Rate,	Data Width	
	SSIConfigSetExpClk(SSI0_BASE, SysCtlClockGet(), SSI_FRF_MOTO_MODE_0, SSI_MODE_MASTER, 3125000 ,8);
	SSIEnable(SSI0_BASE);				//Enable SSI

  for(delay=0; delay<10; delay=delay+1);// delay minimum 100 ns
}

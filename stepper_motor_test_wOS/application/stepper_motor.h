#ifndef SMC
#define SMC

/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"
/*-------------------HW define Includes--------------*/
//#include "inc/hw_ints.h"
#include "inc/hw_memmap.h"
/*-------------------Driver Includes-----------------*/
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
//#include "driverlib/interrupt.h"
#include "driverlib/sysctl.h"

void SM_Init(void);
void SM_DIR(uint8_t status);
void SM_STEP(void);

#endif
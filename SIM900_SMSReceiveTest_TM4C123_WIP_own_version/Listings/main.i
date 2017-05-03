#line 1 "main.c"

#line 1 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 3 "main.c"
#line 1 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"
 






 





#line 25 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"



#line 4 "main.c"
#line 1 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"



























































#line 68 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"

















#line 91 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"







#line 105 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"







#line 119 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"







#line 135 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"






extern void GPIODirModeSet(uint32_t ui32Port, uint8_t ui8Pins,
                           uint32_t ui32PinIO);
extern uint32_t GPIODirModeGet(uint32_t ui32Port, uint8_t ui8Pin);
extern void GPIOIntTypeSet(uint32_t ui32Port, uint8_t ui8Pins,
                           uint32_t ui32IntType);
extern uint32_t GPIOIntTypeGet(uint32_t ui32Port, uint8_t ui8Pin);
extern void GPIOPadConfigSet(uint32_t ui32Port, uint8_t ui8Pins,
                             uint32_t ui32Strength, uint32_t ui32PadType);
extern void GPIOPadConfigGet(uint32_t ui32Port, uint8_t ui8Pin,
                             uint32_t *pui32Strength, uint32_t *pui32PadType);
extern void GPIOIntEnable(uint32_t ui32Port, uint32_t ui32IntFlags);
extern void GPIOIntDisable(uint32_t ui32Port, uint32_t ui32IntFlags);
extern uint32_t GPIOIntStatus(uint32_t ui32Port, _Bool bMasked);
extern void GPIOIntClear(uint32_t ui32Port, uint32_t ui32IntFlags);
extern void GPIOIntRegister(uint32_t ui32Port, void (*pfnIntHandler)(void));
extern void GPIOIntUnregister(uint32_t ui32Port);
extern int32_t GPIOPinRead(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinWrite(uint32_t ui32Port, uint8_t ui8Pins, uint8_t ui8Val);
extern void GPIOPinConfigure(uint32_t ui32PinConfig);
extern void GPIOPinTypeADC(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeCAN(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeComparator(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeComparatorOutput(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeEPI(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeEthernetLED(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeEthernetMII(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeGPIOInput(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeGPIOOutput(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeGPIOOutputOD(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeI2C(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeI2CSCL(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeLCD(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypePWM(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeQEI(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeSSI(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeTimer(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeUART(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeUSBAnalog(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeUSBDigital(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeWakeHigh(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOPinTypeWakeLow(uint32_t ui32Port, uint8_t ui8Pins);
extern uint32_t GPIOPinWakeStatus(uint32_t ui32Port);
extern void GPIODMATriggerEnable(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIODMATriggerDisable(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOADCTriggerEnable(uint32_t ui32Port, uint8_t ui8Pins);
extern void GPIOADCTriggerDisable(uint32_t ui32Port, uint8_t ui8Pins);










#line 5 "main.c"
#line 1 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"










































#line 44 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"
#line 45 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"





















#line 143 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"








#line 158 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"








#line 174 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"







#line 188 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"
                                            





















#line 217 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"







#line 388 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"







#line 465 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"

















#line 489 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"








                                            

                                            











#line 519 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"






#line 538 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"















#line 559 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"


























extern uint32_t SysCtlSRAMSizeGet(void);
extern uint32_t SysCtlFlashSizeGet(void);
extern uint32_t SysCtlFlashSectorSizeGet(void);
extern _Bool SysCtlPeripheralPresent(uint32_t ui32Peripheral);
extern _Bool SysCtlPeripheralReady(uint32_t ui32Peripheral);
extern void SysCtlPeripheralPowerOn(uint32_t ui32Peripheral);
extern void SysCtlPeripheralPowerOff(uint32_t ui32Peripheral);
extern void SysCtlPeripheralReset(uint32_t ui32Peripheral);
extern void SysCtlPeripheralEnable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralDisable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralSleepEnable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralSleepDisable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralDeepSleepEnable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralDeepSleepDisable(uint32_t ui32Peripheral);
extern void SysCtlPeripheralClockGating(_Bool bEnable);
extern void SysCtlIntRegister(void (*pfnHandler)(void));
extern void SysCtlIntUnregister(void);
extern void SysCtlIntEnable(uint32_t ui32Ints);
extern void SysCtlIntDisable(uint32_t ui32Ints);
extern void SysCtlIntClear(uint32_t ui32Ints);
extern uint32_t SysCtlIntStatus(_Bool bMasked);
extern void SysCtlLDOSleepSet(uint32_t ui32Voltage);
extern uint32_t SysCtlLDOSleepGet(void);
extern void SysCtlLDODeepSleepSet(uint32_t ui32Voltage);
extern uint32_t SysCtlLDODeepSleepGet(void);
extern void SysCtlSleepPowerSet(uint32_t ui32Config);
extern void SysCtlDeepSleepPowerSet(uint32_t ui32Config);
extern void SysCtlReset(void);
extern void SysCtlSleep(void);
extern void SysCtlDeepSleep(void);
extern uint32_t SysCtlResetCauseGet(void);
extern void SysCtlResetCauseClear(uint32_t ui32Causes);
extern void SysCtlBrownOutConfigSet(uint32_t ui32Config,
                                    uint32_t ui32Delay);
extern void SysCtlDelay(uint32_t ui32Count);
extern void SysCtlMOSCConfigSet(uint32_t ui32Config);
extern uint32_t SysCtlPIOSCCalibrate(uint32_t ui32Type);
extern void SysCtlClockSet(uint32_t ui32Config);
extern uint32_t SysCtlClockGet(void);
extern void SysCtlDeepSleepClockSet(uint32_t ui32Config);
extern void SysCtlDeepSleepClockConfigSet(uint32_t ui32Div,
                                          uint32_t ui32Config);
extern void SysCtlPWMClockSet(uint32_t ui32Config);
extern uint32_t SysCtlPWMClockGet(void);
extern void SysCtlIOSCVerificationSet(_Bool bEnable);
extern void SysCtlMOSCVerificationSet(_Bool bEnable);
extern void SysCtlPLLVerificationSet(_Bool bEnable);
extern void SysCtlClkVerificationClear(void);
extern void SysCtlGPIOAHBEnable(uint32_t ui32GPIOPeripheral);
extern void SysCtlGPIOAHBDisable(uint32_t ui32GPIOPeripheral);
extern void SysCtlUSBPLLEnable(void);
extern void SysCtlUSBPLLDisable(void);
extern uint32_t SysCtlClockFreqSet(uint32_t ui32Config,
                                   uint32_t ui32SysClock);
extern void SysCtlResetBehaviorSet(uint32_t ui32Behavior);
extern uint32_t SysCtlResetBehaviorGet(void);
extern void SysCtlClockOutConfig(uint32_t ui32Config, uint32_t ui32Div);
extern void SysCtlAltClkConfig(uint32_t ui32Config);
extern uint32_t SysCtlNMIStatus(void);
extern void SysCtlNMIClear(uint32_t ui32Status);
extern void SysCtlVoltageEventConfig(uint32_t ui32Config);
extern uint32_t SysCtlVoltageEventStatus(void);
extern void SysCtlVoltageEventClear(uint32_t ui32Status);










#line 6 "main.c"
#line 1 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"















































#line 213 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 384 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 555 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 726 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 875 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 1024 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 1250 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 1399 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 1625 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 1774 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2000 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2171 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2342 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2513 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2684 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2833 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2982 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 3208 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 3357 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 3583 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 3732 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 3958 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 4136 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 4314 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 4492 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 4646 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 4880 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 5034 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 5268 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 5422 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 5656 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 5880 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 6104 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 6288 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 6593 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 6777 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 7082 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 7313 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 7544 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 7733 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 8046 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"









































































#line 8125 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"

#line 8132 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"










#line 8148 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"

#line 8155 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"













































#line 8208 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"

#line 8216 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"

























#line 8548 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 8857 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 9166 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 9483 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 9886 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 10338 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 10749 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 11209 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 11669 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 12041 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 12536 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 12930 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 13455 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 13811 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 14167 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 14671 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 15197 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 15732 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 16267 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 16639 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 17134 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 17528 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 18053 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 18409 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 18765 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 19269 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 19804 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 20378 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 20952 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"

#line 7 "main.c"
#line 1 "..\\..\\TivaWare_C_Series-2.1.1.71\\driverlib\\interrupt.h"


































































extern _Bool IntMasterEnable(void);
extern _Bool IntMasterDisable(void);
extern void IntRegister(uint32_t ui32Interrupt, void (*pfnHandler)(void));
extern void IntUnregister(uint32_t ui32Interrupt);
extern void IntPriorityGroupingSet(uint32_t ui32Bits);
extern uint32_t IntPriorityGroupingGet(void);
extern void IntPrioritySet(uint32_t ui32Interrupt,
                           uint8_t ui8Priority);
extern int32_t IntPriorityGet(uint32_t ui32Interrupt);
extern void IntEnable(uint32_t ui32Interrupt);
extern void IntDisable(uint32_t ui32Interrupt);
extern uint32_t IntIsEnabled(uint32_t ui32Interrupt);
extern void IntPendSet(uint32_t ui32Interrupt);
extern void IntPendClear(uint32_t ui32Interrupt);
extern void IntPriorityMaskSet(uint32_t ui32PriorityMask);
extern uint32_t IntPriorityMaskGet(void);
extern void IntTrigger(uint32_t ui32Interrupt);










#line 8 "main.c"

#line 1 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_memmap.h"
















































#line 116 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_memmap.h"
                                            

                                            

                                            
#line 141 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_memmap.h"
                                            

                                            
#line 150 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_memmap.h"

#line 10 "main.c"
#line 1 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"
















































#line 58 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"






#line 94 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"
                                            
#line 170 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"






#line 244 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"
                                            
#line 283 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"






#line 318 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"






#line 339 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"













#line 475 "..\\..\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"
















#line 11 "main.c"

#line 1 "uart_handler.h"



 
#line 6 "uart_handler.h"
#line 7 "uart_handler.h"

 



#line 19 "uart_handler.h"






 

void UART0_Init(void);
void UART0_SendChar(uint8_t data);
void UART0_SendString(uint8_t *pt);
void UART0_SendUDecimal(uint32_t n);
void UART0_SendDecimal(int32_t n);
void UART0_SendFloat2(int32_t n);
void UART0_SendFloat3(int32_t n);
void UART0_SendUHex(uint32_t number);
void UART0_SendNewLine(void);
uint8_t UART0_GetChar(void);
void UART0_GetString(uint8_t *bufPt, uint16_t max);
uint32_t UART0_GetUDecimal(void);
uint32_t UART0_GetUHex(void);


void UART2_Init(void);
void UART2_SendChar(uint8_t data);
void UART2_SendString(uint8_t *pt);
void UART2_SendUDecimal(uint32_t n);
void UART2_SendDecimal(int32_t n);
void UART2_SendUHex(uint32_t number);
void UART2_SendNewLine(void);
char UART2_GetChar(void);
void UART2_GetString(char *bufPt, uint16_t max);
uint32_t UART2_GetUDecimal(void);
uint32_t UART2_GetUHex(void);


#line 13 "main.c"
#line 1 "gsm.h"



 
#line 6 "gsm.h"
#line 7 "gsm.h"


void PowerOnGSM(void);
uint8_t GSMgetResponse(void);
_Bool GSMparseMessage(uint8_t lineCount);
void GSMprocessMessage(uint8_t msgNum);
void GSMprocessMessageNew(uint8_t msgNum);



#line 14 "main.c"





uint32_t Desired_Color = 0;
uint8_t Desired_State = 1;

void delay(unsigned long time) {
	while (time) {
		time --;
	}
}

void Switch1(void){
	static uint8_t toggle = 0;
	toggle ^= 0x00000004;
	GPIOPinWrite(0x40025000,0x00000004,toggle);
	
}

void Switch2(void){
	GSMprocessMessage(1);
	
}

void Init_PortF_Input(void){
	SysCtlPeripheralEnable(0xf0000805);  
	(*((volatile unsigned long *)0x40025520)) = 0x4C4F434B;  
  (*((volatile unsigned long *)0x40025524)) |= 0x11;  
	IntDisable(46);  
	GPIOIntDisable(0x40025000, 0x00000001 | 0x00000010);
	GPIOIntTypeSet(0x40025000, 0x00000001 | 0x00000010, 0x00000000);  
	GPIODirModeSet(0x40025000, 0x00000001 | 0x00000010, 0x00000000);
	GPIOPadConfigSet(0x40025000, 0x00000001 | 0x00000010,0x00000001, 0x0000000A);
	IntPrioritySet(46,0);
	GPIOIntEnable(0x40025000, 0x00000001 | 0x00000010);
	IntEnable(46);  
}

void Init_PortF_Output(void){
	SysCtlPeripheralEnable(0xf0000805);  
	(*((volatile unsigned long *)0x40025520)) = 0x4C4F434B;  
  (*((volatile unsigned long *)0x40025524)) |= 0x0E;  
	GPIODirModeSet(0x40025000, 0x00000002 | 0x00000004 | 0x00000008, 0x00000001);
	GPIOPadConfigSet(0x40025000, 0x00000002 | 0x00000004 | 0x00000008, 0x00000066, 0x00000008);
}

void GPIOPortF_Handler(void){
uint8_t pressed_button = 0;
	IntDisable(46);  
	delay(500000);
	pressed_button = GPIOPinRead(0x40025000, 0x00000001 | 0x00000010);
	GPIOIntClear(0x40025000, 0x00000001 | 0x00000010);
	if((pressed_button&0x00000001) == 0) {
		Switch2();
	}
	if((pressed_button&0x00000010) == 0) {
		Switch1();
	}
	IntEnable(46);  
}

int main(void){
	SysCtlClockSet(0xC1000000 | 0x00000000 | 0x00000540 | 0x00000000);
	Init_PortF_Output();
	Init_PortF_Input();
	UART0_Init();
	UART2_Init();
	PowerOnGSM();
	IntMasterEnable();
	UART0_SendString((uint8_t*)"System init done...");
	UART0_SendNewLine();
	while(1){
		delay(5);
		
	}
	return 0;
}



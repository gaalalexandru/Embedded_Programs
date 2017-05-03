#line 1 "main.c"

#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
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




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 3 "main.c"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"
 






 





#line 25 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"



#line 4 "main.c"
#line 1 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"



























































#line 68 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"

















#line 91 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"







#line 105 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"







#line 119 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"







#line 135 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\gpio.h"






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
#line 1 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"






























































#line 140 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"








#line 155 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"








#line 171 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"







#line 185 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"
                                            





















#line 214 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"







#line 385 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"







#line 462 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"

















#line 486 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"








                                            

                                            











#line 516 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"






#line 535 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"















#line 556 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\sysctl.h"


























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
#line 1 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"















































#line 213 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 384 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 555 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 726 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 875 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 1024 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 1250 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 1399 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 1625 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 1774 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2000 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2171 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2342 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2513 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2684 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2833 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 2982 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 3208 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 3357 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 3583 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 3732 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 3958 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 4136 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 4314 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 4492 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 4646 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 4880 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 5034 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 5268 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 5422 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 5656 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 5880 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 6104 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 6288 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 6593 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 6777 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 7082 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 7313 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 7544 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 7733 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 8046 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"









































































#line 8125 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"

#line 8132 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"










#line 8148 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"

#line 8155 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"













































#line 8208 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"

#line 8216 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"

























#line 8548 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 8857 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 9166 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 9483 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 9886 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 10338 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 10749 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 11209 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 11669 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 12041 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 12536 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 12930 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 13455 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 13811 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 14167 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 14671 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 15197 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 15732 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 16267 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 16639 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 17134 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 17528 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 18053 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 18409 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 18765 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 19269 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 19804 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 20378 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"






#line 20952 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\pin_map.h"

#line 7 "main.c"
#line 1 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\driverlib\\interrupt.h"


































































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

#line 1 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_memmap.h"
















































#line 116 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_memmap.h"
                                            

                                            

                                            
#line 141 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_memmap.h"
                                            

                                            
#line 150 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_memmap.h"

#line 10 "main.c"
#line 1 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"
















































#line 58 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"






#line 94 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"
                                            
#line 170 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"






#line 244 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"
                                            
#line 283 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"






#line 318 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"






#line 339 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"













#line 475 "..\\..\\tools\\TivaWare_C_Series-2.1.1.71\\inc\\hw_ints.h"
















#line 11 "main.c"

#line 1 "uart_handler.h"

#line 5 "uart_handler.h"
#line 6 "uart_handler.h"
 



#line 17 "uart_handler.h"

void UART0_Init(void);
void UART0_SendChar(uint8_t data);
void UART0_SendString(uint8_t *string);
void UART0_SendDecimal(uint32_t decimal);
void UART0_NewLine(void);



#line 13 "main.c"




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

void GPIOF_Handler(void){
uint8_t pressed_button = 0;
	IntDisable(46);  
	delay(500000);
	pressed_button = GPIOPinRead(0x40025000, 0x00000001 | 0x00000010);
	GPIOIntClear(0x40025000, 0x00000001 | 0x00000010);
	if((pressed_button&0x00000001) == 0) {
		Switch_Color();
	}
	if((pressed_button&0x00000010) == 0) {
		Toggle_Led();
	}
	IntEnable(46);  
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
			GPIOPinWrite(0x40025000,0x00000002 | 0x00000004 | 0x00000008, Desired_Color);
		}
		else {
			GPIOPinWrite(0x40025000,0x00000002 | 0x00000004 | 0x00000008, 0);
		}
	}
	return 0;
}



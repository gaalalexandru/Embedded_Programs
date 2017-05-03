#line 1 "OS\\os_hw.c"





 
#line 1 "OS\\os_hw.h"








#line 1 "OS\\os_core.h"








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






 
#line 10 "OS\\os_core.h"
























struct tcb{  
  int32_t *sp;  
  struct tcb *next;  
	int32_t *blocked;  
	int32_t sleep;  
  uint8_t priority;  
};
typedef struct tcb tcbType;

struct ptcb{	
	int32_t semaphore;
	uint32_t period;
	uint32_t counter;
};
typedef struct ptcb ptcbType;







 





struct fifo_st{
	uint32_t Fifo[10];
	uint32_t LostData;	
	int32_t CurrentSize;
	int32_t Mutex;
	uint8_t PutI;
	uint8_t GetI;
};
typedef struct fifo_st fifo_t;







void OS_Init(void);







int OS_AddThreads(void(*thread0)(void), uint32_t p0,
                  void(*thread1)(void), uint32_t p1,
                  void(*thread2)(void), uint32_t p2,
                  void(*thread3)(void), uint32_t p3,
                  void(*thread4)(void), uint32_t p4,
                  void(*thread5)(void), uint32_t p5,
                  void(*thread6)(void), uint32_t p6,
                  void(*thread7)(void), uint32_t p7);












int OS_AddPeriodicEventThread(int32_t *semaPt, uint32_t period);







void OS_Launch(uint32_t theTimeSlice);






void OS_Suspend(void);






void OS_Sleep(uint32_t sleepTime);






void OS_InitSemaphore(int32_t *semaPt, int32_t value);







void OS_Wait(int32_t *semaPt);







void OS_Signal(int32_t *semaPt);






void OS_FIFO_Init(fifo_t *fifo);







int OS_FIFO_Put(fifo_t *fifo,uint32_t data);







uint32_t OS_FIFO_Get(fifo_t *fifo);



#line 10 "OS\\os_hw.h"










 

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



#line 1 ".\\3rd_party\\BSP_TM4C.h"
































 




























































































































#line 170 ".\\3rd_party\\BSP_TM4C.h"






void BSP_Button1_Init(void);








uint8_t BSP_Button1_Input(void);






void BSP_Button2_Init(void);








uint8_t BSP_Button2_Input(void);








void BSP_Joystick_Init(void);












void BSP_Joystick_Input(uint16_t *x, uint16_t *y, uint8_t *select);













void BSP_RGB_Init(uint16_t red, uint16_t green, uint16_t blue);










void BSP_RGB_Set(uint16_t red, uint16_t green, uint16_t blue);













void BSP_RGB_D_Init(int red, int green, int blue);










void BSP_RGB_D_Set(int red, int green, int blue);










void BSP_RGB_D_Toggle(int red, int green, int blue);








void BSP_Buzzer_Init(uint16_t duty);








void BSP_Buzzer_Set(uint16_t duty);







void BSP_Accelerometer_Init(void);











void BSP_Accelerometer_Input(uint16_t *x, uint16_t *y, uint16_t *z);






void BSP_Microphone_Init(void);









void BSP_Microphone_Input(uint16_t *mic);








void BSP_LCD_Init(void);













void BSP_LCD_DrawPixel(int16_t x, int16_t y, uint16_t color);











void BSP_LCD_DrawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color);











void BSP_LCD_DrawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color);







void BSP_LCD_FillScreen(uint16_t color);











void BSP_LCD_FillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);








uint16_t BSP_LCD_Color565(uint8_t r, uint8_t g, uint8_t b);







uint16_t BSP_LCD_SwapColor(uint16_t x);





















void BSP_LCD_DrawBitmap(int16_t x, int16_t y, const uint16_t *image, int16_t w, int16_t h);

















void BSP_LCD_DrawCharS(int16_t x, int16_t y, char c, int16_t textColor, int16_t bgColor, uint8_t size);















void BSP_LCD_DrawChar(int16_t x, int16_t y, char c, int16_t textColor, int16_t bgColor, uint8_t size);












uint32_t BSP_LCD_DrawString(uint16_t x, uint16_t y, char *pt, int16_t textColor);










void BSP_LCD_SetCursor(uint32_t newX, uint32_t newY);








void BSP_LCD_OutUDec(uint32_t n, int16_t textColor);








void BSP_LCD_OutUDec4(uint32_t n, int16_t textColor);








void BSP_LCD_OutUDec5(uint32_t n, int16_t textColor);









void BSP_LCD_OutUFix2_1(uint32_t n, int16_t textColor);









void BSP_LCD_OutUHex2(uint32_t n, int16_t textColor);


















void BSP_LCD_Drawaxes(uint16_t axisColor, uint16_t bgColor, char *xLabel,
  char *yLabel1, uint16_t label1Color, char *yLabel2, uint16_t label2Color,
  int32_t ymax, int32_t ymin);












void BSP_LCD_PlotPoint(int32_t data1, uint16_t color1);









void BSP_LCD_PlotIncrement(void);










void BSP_Clock_InitFastest(void);






uint32_t BSP_Clock_GetFreq(void);











void BSP_PeriodicTask_Init(void(*task)(void), uint32_t freq, uint8_t priority);









void BSP_PeriodicTask_Stop(void);





void BSP_PeriodicTask_Restart(void);











void BSP_PeriodicTask_InitB(void(*task)(void), uint32_t freq, uint8_t priority);
 





void BSP_PeriodicTask_StopB(void);











void BSP_PeriodicTask_InitC(void(*task)(void), uint32_t freq, uint8_t priority);






void BSP_PeriodicTask_StopC(void);







void BSP_Time_Init(void);









uint32_t BSP_Time_Get(void);






void BSP_Delay1ms(uint32_t n);








void BSP_LightSensor_Init(void);








uint32_t BSP_LightSensor_Input(void);








void BSP_LightSensor_Start(void);












int BSP_LightSensor_End(uint32_t *light);









void BSP_TempSensor_Init(void);









void BSP_TempSensor_Input(int32_t *sensorV, int32_t *localT);








void BSP_TempSensor_Start(void);














int BSP_TempSensor_End(int32_t *sensorV, int32_t *localT);
#line 37 "OS\\os_hw.h"

 
#line 1 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"
 






 





#line 25 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"



#line 40 "OS\\os_hw.h"
#line 41 "OS\\os_hw.h"
 
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
















































#line 58 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 94 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
                                            
#line 170 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 244 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
                                            
#line 283 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 318 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"






#line 339 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"













#line 475 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_ints.h"
















#line 43 "OS\\os_hw.h"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
















































#line 116 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
                                            

                                            

                                            
#line 141 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"
                                            

                                            
#line 150 "..\\TivaWare_C_Series-2.1.1.71\\inc/hw_memmap.h"

#line 44 "OS\\os_hw.h"
 
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"



























































#line 68 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"

















#line 91 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"







#line 105 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"







#line 119 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"







#line 135 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/gpio.h"






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










#line 46 "OS\\os_hw.h"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"















































#line 213 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 384 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 555 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 726 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 875 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 1024 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 1250 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 1399 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 1625 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 1774 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2000 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2171 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2342 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2513 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2684 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2833 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 2982 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 3208 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 3357 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 3583 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 3732 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 3958 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 4136 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 4314 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 4492 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 4646 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 4880 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 5034 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 5268 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 5422 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 5656 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 5880 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 6104 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 6288 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 6593 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 6777 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 7082 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 7313 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 7544 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 7733 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 8046 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"









































































#line 8125 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"

#line 8132 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"










#line 8148 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"

#line 8155 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"













































#line 8208 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"

#line 8216 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"

























#line 8548 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 8857 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 9166 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 9483 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 9886 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 10338 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 10749 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 11209 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 11669 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 12041 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 12536 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 12930 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 13455 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 13811 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 14167 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 14671 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 15197 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 15732 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 16267 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 16639 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 17134 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 17528 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 18053 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 18409 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 18765 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 19269 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 19804 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 20378 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"






#line 20952 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/pin_map.h"

#line 47 "OS\\os_hw.h"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/interrupt.h"


































































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










#line 48 "OS\\os_hw.h"
#line 1 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"










































#line 44 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"
#line 45 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"





















#line 143 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"








#line 158 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"








#line 174 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"







#line 188 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"
                                            





















#line 217 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"







#line 388 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"







#line 465 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"

















#line 489 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"








                                            

                                            











#line 519 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"






#line 538 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"















#line 559 "..\\TivaWare_C_Series-2.1.1.71\\driverlib/sysctl.h"


























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










#line 49 "OS\\os_hw.h"

enum tm4c_ports {
	PortA = 0,
	PortB,
	PortC,
	PortD,
	PortE,
	PortF
};
typedef enum tm4c_ports	ports_t;

#line 72 "OS\\os_hw.h"
	


#line 87 "OS\\os_hw.h"

uint8_t OS_EdgeTrigger_Restart(ports_t port, uint8_t pin);
uint8_t OS_EdgeTrigger_Init(ports_t port, uint8_t pin, uint8_t priority, uint8_t type, uint8_t resistor);	



#line 8 "OS\\os_hw.c"





PortSema_t SemPortA;
PortSema_t SemPortB;
PortSema_t SemPortC;
PortSema_t SemPortD;
PortSema_t SemPortE;
PortSema_t SemPortF;

void GPIOPortD_Handler(void){	 
	
  
  
	uint8_t status;	
	status = GPIOIntStatus(0x40007000, 1);
	if(status & 0x00000001) {
		GPIOIntClear(0x40007000,0x00000001); 
		OS_Signal(&SemPortD.pin0);  
		GPIOIntDisable(0x40007000, 0x00000001);  
	}
	if(status & 0x00000002) { GPIOIntClear(0x40007000,0x00000002); OS_Signal(&SemPortD.pin1); GPIOIntDisable(0x40007000, 0x00000002);}
	if(status & 0x00000004) { GPIOIntClear(0x40007000,0x00000004); OS_Signal(&SemPortD.pin2); GPIOIntDisable(0x40007000, 0x00000004);}
	if(status & 0x00000008) {	GPIOIntClear(0x40007000,0x00000008); OS_Signal(&SemPortD.pin3); GPIOIntDisable(0x40007000, 0x00000008);}
	if(status & 0x00000010) { GPIOIntClear(0x40007000,0x00000010); OS_Signal(&SemPortD.pin4); GPIOIntDisable(0x40007000, 0x00000010);}
	if(status & 0x00000020) {	GPIOIntClear(0x40007000,0x00000020); OS_Signal(&SemPortD.pin5); GPIOIntDisable(0x40007000, 0x00000020);}
	if(status & 0x00000040) { GPIOIntClear(0x40007000,0x00000040); OS_Signal(&SemPortD.pin6); GPIOIntDisable(0x40007000, 0x00000040);}
	if(status & 0x00000080) {	GPIOIntClear(0x40007000,0x00000080); OS_Signal(&SemPortD.pin7); GPIOIntDisable(0x40007000, 0x00000080);}
  OS_Suspend();
}

void GPIOPortF_Handler(void){	 
	uint8_t status;	
	status = GPIOIntStatus(0x40025000, 1);
	if(status & 0x00000001) {
		GPIOIntClear(0x40025000,0x00000001); 
		OS_Signal(&SemPortF.pin0);  
		GPIOIntDisable(0x40025000, 0x00000001);  
	}
	if(status & 0x00000002) {	GPIOIntClear(0x40025000,0x00000002); OS_Signal(&SemPortF.pin1); GPIOIntDisable(0x40025000, 0x00000002);}
	if(status & 0x00000004) {	GPIOIntClear(0x40025000,0x00000004); OS_Signal(&SemPortF.pin2); GPIOIntDisable(0x40025000, 0x00000004);}
	if(status & 0x00000008) { GPIOIntClear(0x40025000,0x00000008); OS_Signal(&SemPortF.pin3); GPIOIntDisable(0x40025000, 0x00000008);}
	if(status & 0x00000010) { GPIOIntClear(0x40025000,0x00000010); OS_Signal(&SemPortF.pin4); GPIOIntDisable(0x40025000, 0x00000010);}
  OS_Suspend();
}





uint8_t OS_EdgeTrigger_Init(ports_t port, uint8_t pin, uint8_t priority, uint8_t type, uint8_t resistor){
	uint32_t clock;
	uint32_t bit_prio;
	switch (port) {
		case PortA:  
			
			(*((volatile uint32_t *)0x40004520)) = 0x4C4F434B;  
			(*((volatile uint32_t *)0x40004524)) |= 0xFF;  
			break;
		case PortB:  
			
			break;
		case PortC:  
			
			break;
		case PortD:  
			SysCtlPeripheralEnable(0xf0000803);
			while(!SysCtlPeripheralReady(0xf0000803));
			if(pin && 0x00000080) { (*((volatile uint32_t *)0x40007520)) = 0x4C4F434B; } 
			(*((volatile uint32_t *)0x40007524)) |= 0xFF;  
			IntDisable(19);
			GPIOIntDisable(0x40007000,pin);
			GPIOPinTypeGPIOInput(0x40007000, pin);
			GPIOIntTypeSet(0x40007000, pin, type);
			GPIODirModeSet(0x40007000, pin, 0x00000000);
			GPIOPadConfigSet(0x40007000, pin, 0x00000001,resistor);
			GPIOIntEnable(0x40007000, pin);
			IntPrioritySet(19,(priority<<5));
			IntEnable(19);
			break;
		case PortE:  
			break;
		case PortF:  
			SysCtlPeripheralEnable(0xf0000805);	
			while(!SysCtlPeripheralReady(0xf0000805));
			if(pin && 0x00000001) { (*((volatile uint32_t *)0x40025520)) = 0x4C4F434B; } 
			(*((volatile uint32_t *)0x40025524)) |= 0x1F;  
			
			IntDisable(46);  
			GPIOIntDisable(0x40025000,pin);  
			GPIOPinTypeGPIOInput(0x40025000, pin);  
			GPIOIntTypeSet(0x40025000, pin, type);  
			GPIODirModeSet(0x40025000, pin, 0x00000000);  
			GPIOPadConfigSet(0x40025000, pin, 0x00000001,resistor); 
			GPIOIntEnable(0x40025000, pin);  
			IntPrioritySet(46,(priority<<5)); 
			IntEnable(46); 
			break;		
		default:
			return 0;  
	}
	return 1;  
}






uint8_t OS_EdgeTrigger_Restart(ports_t port, uint8_t pin){
	
	
	
	switch (port) {
		case PortA:  
			break;
		case PortB:  
			break;
		case PortC:  
			break;
		case PortD:  
			GPIOIntEnable(0x40007000, pin);  
			IntEnable(19); 
			break;
		case PortE:  
			break;
		case PortF:  
			GPIOIntEnable(0x40025000, pin);  
			IntEnable(46); 
			break;		
		default:
			return 0;  
	}
	return 1;  
}








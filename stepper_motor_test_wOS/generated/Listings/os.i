#line 1 "core\\os.c"





 




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






 
#line 12 "core\\os.c"
#line 1 "core\\os.h"









#line 11 "core\\os.h"



struct fifo{
	uint32_t Fifo[10];
	uint32_t LostData;	
	int32_t CurrentSize;
	int32_t Mutex;
	uint8_t PutI;
	uint8_t GetI;
};
typedef struct fifo fifo_t;







void OS_Init(void);






int OS_AddThreads(void(*thread0)(void),
                  void(*thread1)(void),
                  void(*thread2)(void),
                  void(*thread3)(void),
                  void(*thread4)(void),
                  void(*thread5)(void));












int OS_AddPeriodicEventThread(void(*thread)(void), uint32_t period);







void OS_Launch(uint32_t theTimeSlice);






void OS_Suspend(void);






void OS_Sleep(uint32_t sleepTime);






void OS_InitSemaphore(int32_t *semaPt, int32_t value);







void OS_Wait(int32_t *semaPt);







void OS_Signal(int32_t *semaPt);






void OS_FIFO_Init(fifo_t *fifo);







int OS_FIFO_Put(fifo_t *fifo,uint32_t data);







uint32_t OS_FIFO_Get(fifo_t *fifo);



#line 13 "core\\os.c"
#line 1 ".\\inc\\CortexM.h"





#line 18 ".\\inc\\CortexM.h"







void DisableInterrupts(void); 





void EnableInterrupts(void);  






long StartCritical(void);    






void EndCritical(long sr);    







void WaitForInterrupt(void);  

#line 14 "core\\os.c"
#line 1 ".\\inc\\BSP.h"
































 




























































































































#line 170 ".\\inc\\BSP.h"






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
#line 15 "core\\os.c"


void StartOS(void);


void static runperiodicevents(void);
void static runsleep(void);





struct tcb{					
  int32_t *sp;      
  struct tcb *next; 
	int32_t *blocked;	
	int32_t sleep;		
};
typedef struct tcb tcbType;
tcbType tcbs[6];
tcbType *RunPt;
int32_t Stacks[6][100];

struct ptcb{	
	void (*task)(void);
	uint32_t period;
	uint32_t counter;
};
typedef struct ptcb ptcbType;
ptcbType PerTask[2];











void OS_Init(void){
  
  DisableInterrupts();
  BSP_Clock_InitFastest();
  BSP_PeriodicTask_Init(runperiodicevents,1000,2);	
  BSP_PeriodicTask_InitB(runsleep,1000,3);	
	
	
}

void SetInitialStack(int i){
  
  tcbs[i].sp = &Stacks[i][100-16]; 
  
  Stacks[i][100-1] = 0x01000000;   
  
  Stacks[i][100-3] = 0x14141414;   
  Stacks[i][100-4] = 0x12121212;   
  Stacks[i][100-5] = 0x03030303;   
  Stacks[i][100-6] = 0x02020202;   
  Stacks[i][100-7] = 0x01010101;   
  Stacks[i][100-8] = 0x00000000;   
  Stacks[i][100-9] = 0x11111111;   
  Stacks[i][100-10] = 0x10101010;  
  Stacks[i][100-11] = 0x09090909;  
  Stacks[i][100-12] = 0x08080808;  
  Stacks[i][100-13] = 0x07070707;  
  Stacks[i][100-14] = 0x06060606;  
  Stacks[i][100-15] = 0x05050505;  
  Stacks[i][100-16] = 0x04040404;  
}






int OS_AddThreads(void(*thread0)(void),
                  void(*thread1)(void),
                  void(*thread2)(void),
                  void(*thread3)(void),
                  void(*thread4)(void),
                  void(*thread5)(void)){
  int32_t status; 
  int32_t i;	
  status = StartCritical(); 
	
	
	tcbs[0].next = &tcbs[1];	
	tcbs[1].next = &tcbs[2];	
	tcbs[2].next = &tcbs[3];	
	tcbs[3].next = &tcbs[4];	
	tcbs[4].next = &tcbs[5];	
	tcbs[5].next = &tcbs[0];	
	
	
	for(i=0; i< 6; i++){tcbs[i].blocked = 0;}
	
	
	RunPt = &tcbs[0];

	
	SetInitialStack(0);	
	Stacks[0][100-2] = (int32_t)(thread0);	
	SetInitialStack(1);	
	Stacks[1][100-2] = (int32_t)(thread1);	
	SetInitialStack(2);	
	Stacks[2][100-2] = (int32_t)(thread2);	
	SetInitialStack(3);	
	Stacks[3][100-2] = (int32_t)(thread3);	
	SetInitialStack(4);	
	Stacks[4][100-2] = (int32_t)(thread4);	
	SetInitialStack(5);	
	Stacks[5][100-2] = (int32_t)(thread5);	
	
  EndCritical(status);
  return 1;               
}











int OS_AddPeriodicEventThread(void(*thread)(void), uint32_t period){
	int32_t static event_number = 0;
	PerTask[event_number].task = thread;
	PerTask[event_number].period = period;
	PerTask[event_number].counter = 1;
	event_number++;
  return 1;
}

void static runperiodicevents(void){

	int32_t i;
	for (i=0;i<2;i++){	
		PerTask[i].counter--;
		if(PerTask[i].counter == 0) { 
			PerTask[i].task();
			PerTask[i].counter = PerTask[i].period;	
		}
	}
}

void static runsleep(void){

	int32_t i;
	for (i=0;i<6;i++){ if(tcbs[i].sleep != 0) {	
			tcbs[i].sleep --;	
		}
	}
}







void OS_Launch(uint32_t theTimeSlice){
  (*((volatile uint32_t *)0xE000E010)) = 0;                  
  (*((volatile uint32_t *)0xE000E018)) = 0;               
  (*((volatile uint32_t *)0xE000ED20)) =((*((volatile uint32_t *)0xE000ED20))&0x00FFFFFF)|0xE0000000; 
	
	
  (*((volatile uint32_t *)0xE000E014)) = theTimeSlice - 1; 
  (*((volatile uint32_t *)0xE000E010)) = 0x00000007;         
  StartOS();                   
}





 
void Scheduler(void){ 
	
	RunPt = RunPt->next;  
	
	while((RunPt->blocked != 0)||(RunPt->sleep != 0)){
		RunPt = RunPt->next;
	}
}






void OS_Suspend(void){
  (*((volatile uint32_t *)0xE000E018)) = 0;        
  (*((volatile uint32_t *)0xE000ED04)) = 0x04000000; 

}






void OS_Sleep(uint32_t sleepTime){


	RunPt->sleep = sleepTime;
	OS_Suspend();
}










void OS_InitSemaphore(int32_t *semaPt, int32_t value){
  
	*semaPt = value;
}







void OS_Wait(int32_t *semaPt){
	DisableInterrupts();
	*semaPt = (*semaPt) - 1;
	if(*semaPt < 0){
		RunPt->blocked = semaPt;	
		EnableInterrupts();
		OS_Suspend();	
	}
	EnableInterrupts();
}







void OS_Signal(int32_t *semaPt){
	tcbType	*threadPt;	
	DisableInterrupts();
	(*semaPt) = (*semaPt) + 1;
	if(*semaPt <= 0){
		threadPt = RunPt->next;	
		while((threadPt->blocked) != semaPt) {	threadPt = threadPt->next; }
		threadPt->blocked = 0;	
	}
	EnableInterrupts();
}










void OS_FIFO_Init(fifo_t *fifo){ 
	fifo->PutI = 0;
	fifo->GetI = 0;
	OS_InitSemaphore(&fifo->CurrentSize,0);
	OS_InitSemaphore(&fifo->Mutex, 1);
}







int OS_FIFO_Put(fifo_t *fifo,uint32_t data){
	if(fifo->CurrentSize == 10) { 
		fifo->LostData++;
		return -1; 
	}
	else {
		fifo->Fifo[fifo->PutI] = data;	
		fifo->PutI = (fifo->PutI + 1)%10; 
		OS_Signal(&fifo->CurrentSize);
		return 0;	
	}
}







uint32_t OS_FIFO_Get(fifo_t *fifo){uint32_t data;
	OS_Wait(&fifo->CurrentSize);		
	OS_Wait(&fifo->Mutex);		
	data = fifo->Fifo[fifo->GetI];	
	fifo->GetI = (fifo->GetI + 1) % 10;	
	OS_Signal(&fifo->Mutex);		
  return data;
}


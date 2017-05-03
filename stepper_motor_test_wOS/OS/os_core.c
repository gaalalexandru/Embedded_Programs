// os.c
// Runs on LM4F120/TM4C123 will be ported to MSP432 in next version
// ssOS - stupid simple Operating System
// A very simple real time operating system with minimal features.
// For copyright, configuration and usage read readme.txt
 
// *******************************************************************************************************
// ***************************************** Declaration section *****************************************
// *******************************************************************************************************

#include <stdint.h>
#include "os_core.h"
#include "os_hw.h"
#include "CortexM.h"


// function definitions in osasm.s
void StartOS(void);
// function definitions in os.c
void static runperiodicevents(void);
void static runsleep(void);

// *******************************************************************************************************
// ************************************** Global variables section ***************************************
// *******************************************************************************************************

tcbType tcbs[NUMTHREADS];  //Thread controll block
tcbType *RunPt;  //Current thread Run Pointer
int32_t Stacks[NUMTHREADS][STACKSIZE];  //Thread stacks
ptcbType PerTask[NUMPERIODIC];  //Periodic events
uint8_t Periodic_Event_Nr = 0;	//Added Periodic events

// *******************************************************************************************************
// ******************************************* OS Init section *******************************************
// *******************************************************************************************************

// ******** OS_Init ************
// Initialize operating system, disable interrupts
// Initialize OS controlled I/O: periodic interrupt, bus clock as fast as possible
// Initialize OS global variables
// Inputs:  none
// Outputs: none
void OS_Init(void){
  // perform any initializations needed
  DisableInterrupts();
  BSP_Clock_InitFastest();// set processor clock to fastest speed
  BSP_PeriodicTask_Init(runperiodicevents,1000,INT_PRIO_PERIODIC_EV);	//Start one HW Timer with periodic interrupt at 1000 Hz set to priority 2
  BSP_PeriodicTask_InitB(runsleep,1000,INT_PRIO_SLEEP);	//Start one HW Timer with periodic interrupt at 1000 Hz set to priority 3
	//Periodic tasks / events / interrupts priority number: 
	//0 = highest priority ... 7 = lowest priority
}

void SetInitialStack(int i){
  //first set for each stack the stack pointer
  tcbs[i].sp = &Stacks[i][STACKSIZE-16]; // thread stack pointer
  //fill in bottom positions of the stack with register values, as if thread was already running and interrupted
  Stacks[i][STACKSIZE-1] = 0x01000000;   // thumb bit
  //Stacks[i][STACKSIZE-2] = PC; //The Program Counter will be set later with the address of the function it points to, R15 = PC
  Stacks[i][STACKSIZE-3] = 0x14141414;  //R14 Initial Link Register dummy value, R14 = LR
  Stacks[i][STACKSIZE-4] = 0x12121212;  //R12
  Stacks[i][STACKSIZE-5] = 0x03030303;  //R3
	Stacks[i][STACKSIZE-6] = 0x02020202;  //R2
  Stacks[i][STACKSIZE-7] = 0x01010101;  //R1
  Stacks[i][STACKSIZE-8] = 0x00000000;  //R0
  Stacks[i][STACKSIZE-9] = 0x11111111;  //R11
  Stacks[i][STACKSIZE-10] = 0x10101010;  //R10
  Stacks[i][STACKSIZE-11] = 0x09090909;  //R9
  Stacks[i][STACKSIZE-12] = 0x08080808;  //R8
  Stacks[i][STACKSIZE-13] = 0x07070707;  //R7
  Stacks[i][STACKSIZE-14] = 0x06060606;  //R6
  Stacks[i][STACKSIZE-15] = 0x05050505;  //R5
  Stacks[i][STACKSIZE-16] = 0x04040404;  //R4
}

//******** OS_AddThreads ***************
// Add main threads to the scheduler
// Inputs: function pointers to void/void main threads
// Outputs: 1 if successful, 0 if this thread can not be added
// This function will only be called once, after OS_Init and before OS_Launch
int OS_AddThreads(void(*thread0)(void), uint32_t p0,
                  void(*thread1)(void), uint32_t p1,
                  void(*thread2)(void), uint32_t p2,
                  void(*thread3)(void), uint32_t p3,
                  void(*thread4)(void), uint32_t p4,
                  void(*thread5)(void), uint32_t p5,
                  void(*thread6)(void), uint32_t p6,
                  void(*thread7)(void), uint32_t p7){
  int32_t status; //I bit status
  int32_t i;	//thread index
  status = StartCritical(); //Disable Interrupts
	
	//initialize TCB circular list
	tcbs[0].next = &tcbs[1];	//main thread 0 points to main thread 1
	tcbs[1].next = &tcbs[2];	//main thread 1 points to main thread 2
	tcbs[2].next = &tcbs[3];	//main thread 2 points to main thread 3	
	tcbs[3].next = &tcbs[4];	//main thread 3 points to main thread 4
	tcbs[4].next = &tcbs[5];	//main thread 4 points to main thread 5
	tcbs[5].next = &tcbs[6];	//main thread 5 points to main thread 6
	tcbs[6].next = &tcbs[7];	//main thread 6 points to main thread 7
	tcbs[7].next = &tcbs[0];	//main thread 7 points to main thread 8
	
	//initialize threads as not blocked									
	for(i=0; i< NUMTHREADS; i++){tcbs[i].blocked = 0;}
	
	// initialize RunPt
	RunPt = &tcbs[0];

	// initialize four stacks, including initial PC
	SetInitialStack(0);	//SetInitialStack initial stack of main thread 0
	Stacks[0][STACKSIZE-2] = (int32_t)(thread0);	//Set address of thread0 as PC
	SetInitialStack(1);	//SetInitialStack initial stack of main thread 1
	Stacks[1][STACKSIZE-2] = (int32_t)(thread1);	//Set address of thread1 as PC	
	SetInitialStack(2);	//SetInitialStack initial stack of main thread 2
	Stacks[2][STACKSIZE-2] = (int32_t)(thread2);	//Set address of thread2 as PC
	SetInitialStack(3);	//SetInitialStack initial stack of main thread 3
	Stacks[3][STACKSIZE-2] = (int32_t)(thread3);	//Set address of thread3 as PC
	SetInitialStack(4);	//SetInitialStack initial stack of main thread 4
	Stacks[4][STACKSIZE-2] = (int32_t)(thread4);	//Set address of thread4 as PC
	SetInitialStack(5);	//SetInitialStack initial stack of main thread 5
	Stacks[5][STACKSIZE-2] = (int32_t)(thread5);	//Set address of thread5 as PC	
	SetInitialStack(6);	//SetInitialStack initial stack of main thread 6
	Stacks[6][STACKSIZE-2] = (int32_t)(thread6);	//Set address of thread5 as PC	
	SetInitialStack(7);	//SetInitialStack initial stack of main thread 6
	Stacks[7][STACKSIZE-2] = (int32_t)(thread7);	//Set address of thread5 as PC	
	
	//initialize priority for each thread
	tcbs[0].priority = p0;
	tcbs[1].priority = p1;
	tcbs[2].priority = p2;
	tcbs[3].priority = p3;
	tcbs[4].priority = p4;
	tcbs[5].priority = p5;
	tcbs[6].priority = p6;
	tcbs[7].priority = p7;
	
	EndCritical(status);	//Enable Interrupts
	return 1;         // successful
}

//******** OS_Launch ***************
// Start the scheduler, enable interrupts
// Inputs: number of clock cycles for each time slice
//         (maximum of 24 bits)
// Outputs: none (does not return)
// Errors: theTimeSlice must be less than 16,777,216
void OS_Launch(uint32_t theTimeSlice){
  STCTRL = 0;                  // disable SysTick during setup
  STCURRENT = 0;               // any write to current clears it
  SYSPRI3 =(SYSPRI3&0x00FFFFFF)|0xE0000000; // set priority 7 for systick interrupt
	//do not use higher priority than 7 because systick will switch the main threads 
	//and needs to be interrupted by event threads
  STRELOAD = theTimeSlice - 1; // reload value
  STCTRL = 0x00000007;         // enable, core clock and interrupt arm
  StartOS();                   // start on the first task
}

// *******************************************************************************************************
// ************************************** Thread scheduling section **************************************
// *******************************************************************************************************

/*ssOS - Scheduler*/
void Scheduler(void){  // every time slice
	//1.1 Priority scheduler, run highest priority that is not sleeping or blocked
	//If all are at equal priority round robin will be used
	//1.0 ROUND ROBIN, skip blocked and sleeping threads a
	uint8_t maxprio = 255;
	tcbType *tempPt;
	tcbType *bestPt;
  tempPt = RunPt;         
	// search for highest thread not blocked or sleeping
	do{
		tempPt = tempPt->next;  //skips at least one
		if(((tempPt->priority) < maxprio) && (tempPt->blocked == 0) && (tempPt->sleep == 0)) { 
			//If priority is higher and not blocked and not sleeping
			maxprio = tempPt->priority;
			bestPt = tempPt;
		}
	} while (RunPt != tempPt); //search through all linked list
	RunPt = bestPt; //move to next suitable thread
}

//******** OS_Suspend ***************
// Called by main thread to cooperatively suspend operation
// Inputs: none
// Outputs: none
// Will be run again depending on sleep/block status
void OS_Suspend(void){
  STCURRENT = 0;        // any write to current clears it
  INTCTRL = 0x04000000; // trigger SysTick
// next thread gets a full time slice
}

// ******** OS_Sleep ************
// place this thread into a dormant state
// input:  number of msec to sleep
// output: none
// OS_Sleep(0) implements cooperative multitasking
void OS_Sleep(uint32_t sleepTime){
// set sleep parameter in TCB
// suspend, stops running
	RunPt->sleep = sleepTime;
	OS_Suspend();
}

// *******************************************************************************************************
// ****************************************** Semaphore section ******************************************
// *******************************************************************************************************

// ******** OS_InitSemaphore ************
// Initialize counting semaphore
// Inputs:  pointer to a semaphore
//          initial value of semaphore
// Outputs: none
void OS_InitSemaphore(int32_t *semaPt, int32_t value){
  //Assign initial value to *semaPt
	*semaPt = value;
}

// ******** OS_Wait ************
// Decrement semaphore and block if less than zero
// Lab2 spinlock (does not suspend while spinning)
// Lab3 block if less than zero
// Inputs:  pointer to a counting semaphore
// Outputs: none
void OS_Wait(int32_t *semaPt){
	DisableInterrupts();
	*semaPt = (*semaPt) - 1;
	if(*semaPt < 0){
		RunPt->blocked = semaPt;	//Point to semaphore which is blocked
		EnableInterrupts();
		OS_Suspend();	//Switch threads by generating a systick interrupt
	}
	EnableInterrupts();
}

// ******** OS_Signal ************
// Increment semaphore
// Lab2 spinlock
// Lab3 wakeup blocked thread if appropriate
// Inputs:  pointer to a counting semaphore
// Outputs: none
void OS_Signal(int32_t *semaPt){
	tcbType	*threadPt;	//local thread pointer
	DisableInterrupts();
	(*semaPt) = (*semaPt) + 1;
	if(*semaPt <= 0){
		threadPt = RunPt->next;	//point to next thread
		while((threadPt->blocked) != semaPt) {	threadPt = threadPt->next; }//search for a thread that is blocked on this semaphore
		threadPt->blocked = 0;	//unblock 1st blocked thread found
	}
	EnableInterrupts();
}

// *******************************************************************************************************
// ******************************************** FIFO section *********************************************
// *******************************************************************************************************

// ******** OS_FIFO_Init ************
// Initialize FIFO.  
// One event thread producer, one main thread consumer
// Inputs:  none
// Outputs: none
void OS_FIFO_Init(fifo_t *fifo){ //Init the FIFO with indexes and CurrentSize and LostData set to 0
	fifo->PutI = 0;
	fifo->GetI = 0;
	OS_InitSemaphore(&fifo->CurrentSize,0);
	OS_InitSemaphore(&fifo->Mutex, 1);
}

// ******** OS_FIFO_Put ************
// Put an entry in the FIFO.  
// Exactly one event thread puts,
// do not block or spin if full
// Inputs:  data to be stored
// Outputs: 0 if successful, -1 if the FIFO is full
int OS_FIFO_Put(fifo_t *fifo,uint32_t data){
	if(fifo->CurrentSize == FSIZE) { //FIFO is full
		fifo->LostData++;
		return -1; //Error
	}
	else {
		fifo->Fifo[fifo->PutI] = data;	//store data in FIFO at put index
		fifo->PutI = (fifo->PutI + 1)%FSIZE; //Increment Put index and wrap around if necessary
		OS_Signal(&fifo->CurrentSize);
		return 0;	//Success
	}
}

// ******** OS_FIFO_Get ************
// Get an entry from the FIFO.   
// one or more main thread get,
// do block if empty
// Inputs:  none
// Outputs: data retrieved
uint32_t OS_FIFO_Get(fifo_t *fifo){uint32_t data;
	OS_Wait(&fifo->CurrentSize);		//Wait till there is data in FIFO, block if empty
	OS_Wait(&fifo->Mutex);		//Block access to FIFO for other main threads
	data = fifo->Fifo[fifo->GetI];	//Get stored data from Fifo
	fifo->GetI = (fifo->GetI + 1) % FSIZE;	//Incremet Get index and wrap around
	OS_Signal(&fifo->Mutex);		//Free access to FIFO for other main threads
  return data;
}

// *******************************************************************************************************
// *************************************** Periodic events section ***************************************
// *******************************************************************************************************

// ******** OS_AddPeriodicEventThread ***********
// Initialize periodic timer interrupt to signal
// Must be called NUMPERIODIC times
// Inputs:  semaphore to signal
//          period in ms
// priority level at INT_PRIO_PERIODIC_EV
// Outputs: 1 if OK
//          0 if ERROR
int OS_AddPeriodicEventThread(int32_t *semaPt, uint32_t period){
	//int32_t static event_number = 0;
	if(Periodic_Event_Nr < NUMPERIODIC) {
		OS_InitSemaphore(semaPt,0);
		PerTask[Periodic_Event_Nr].period = period;
		PerTask[Periodic_Event_Nr].counter = STARTUP_DELAY;
		Periodic_Event_Nr++;
	}
	else {
		return 0;	//Number of added is > then nr of defined
	}
  return 1;
}

void static runsleep(void){
// **DECREMENT SLEEP COUNTERS
	uint8_t i;
	for (i=0;i<NUMTHREADS;i++){ if(tcbs[i].sleep != 0) {	//search for sleeping main threads
			tcbs[i].sleep --;	//decrement sleep period by 1ms
		}
	}
}

void static runperiodicevents(void){
// **RUN PERIODIC THREADS
	uint8_t i = 0;
	uint8_t flag = 0;

	for (i=0;i<Periodic_Event_Nr;i++){	//search for periodic tasks
		PerTask[i].counter--;
		if(PerTask[i].counter == 0) { //it's time to signal a semaphore to launch a periodic task		
			OS_Signal(&PerTask[i].semaphore);
			PerTask[i].counter = PerTask[i].period;	//reset
			flag = 1;
		}
	}
	if(flag) {
		OS_Suspend(); // run the scheduler
		flag = 0;
	}
}

//EOF

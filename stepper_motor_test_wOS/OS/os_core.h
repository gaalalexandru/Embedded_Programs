// os_core.h - ssOS Core functions
// ssOS - stupid simple Operating System
// A very simple real time operating system with minimal features.
// For copyright, configuration and usage read readme.txt

#ifndef __OS_CORE_H
#define __OS_CORE_H  1

#include <stdint.h>

// *******************************************************************************************************
// ************************************* ssOS Configuration section **************************************
// *******************************************************************************************************

//Uncomment the target define you are using
//Leave other target defines commented!!!
#define TARGET_TM4C
//#define TARGET_MSP432

#define NUMTHREADS  8  // maximum number of threads
#define NUMPERIODIC 2 // maximum number of periodic threads

#define STACKSIZE   100      // number of 32-bit words in stack per thread
#define FSIZE 10  // general FIFO size

#define STARTUP_DELAY 10
#define INT_PRIO_PERIODIC_EV (1)  //Timer interrupt priority for periodic events
#define INT_PRIO_SLEEP (3)  //Timer interrupt priority for sleep decrementing

// *******************************************************************************************************
// ************************************** Types definition section ***************************************
// *******************************************************************************************************

struct tcb{  //main thread controll block
  int32_t *sp;  // pointer to stack (valid for threads not running
  struct tcb *next;  // linked-list pointer
	int32_t *blocked;  //pointer to blocked semaphore, nonzero if blocked on this semaphore
	int32_t sleep;  //time to sleep, nonzero if this thread is sleeping
  uint8_t priority;  //priority of the thread, 0 - highest priority, 254 - lowest
};
typedef struct tcb tcbType;

struct ptcb{	//periodic trigger controll block
	int32_t semaphore;
	uint32_t period;
	uint32_t counter;
};
typedef struct ptcb ptcbType;
/*
struct etcb{ //edge trigger controll block
	//int32_t *edgeSemaphore;
	int32_t semaphore;
	uint8_t port;
	uint8_t pin;
	uint8_t 
};*/

// *******************************************************************************************************
// ************************************* Function prototypes section *************************************
// *******************************************************************************************************

struct fifo_st{
	uint32_t Fifo[FSIZE];
	uint32_t LostData;	
	int32_t CurrentSize;
	int32_t Mutex;
	uint8_t PutI;
	uint8_t GetI;
};
typedef struct fifo_st fifo_t;

// ******** OS_Init ************
// Initialize operating system, disable interrupts
// Initialize OS controlled I/O: periodic interrupt, bus clock as fast as possible
// Initialize OS global variables
// Inputs:  none
// Outputs: none
void OS_Init(void);

//******** OS_AddThreads ***************
// Add all threads to the scheduler
// Inputs: function pointers to void/void main threads
//         priorites for each main thread (0 highest)
// Outputs: 1 if successful, 0 if this thread can not be added
// This function will only be called once, after OS_Init and before OS_Launch
int OS_AddThreads(void(*thread0)(void), uint32_t p0,
                  void(*thread1)(void), uint32_t p1,
                  void(*thread2)(void), uint32_t p2,
                  void(*thread3)(void), uint32_t p3,
                  void(*thread4)(void), uint32_t p4,
                  void(*thread5)(void), uint32_t p5,
                  void(*thread6)(void), uint32_t p6,
                  void(*thread7)(void), uint32_t p7);

//******** OS_AddPeriodicEventThread ***************
// Add one background periodic event thread
// Typically this function receives the highest priority
// Inputs: pointer to a semaphore that signals periodic task can be launched
//         period given in units of OS_Launch (Lab 3 this will be msec)
// Outputs: 1 if successful, 0 if this thread cannot be added
// It is assumed that the event threads will run to completion and return
// It is assumed the time to run these event threads is short compared to 1 msec
// These threads cannot spin, block, loop, sleep, or kill
// These threads can call OS_Signal
// In Lab 3 this will be called exactly twice
int OS_AddPeriodicEventThread(int32_t *semaPt, uint32_t period);

//******** OS_Launch ***************
// Start the scheduler, enable interrupts
// Inputs: number of clock cycles for each time slice
//         (maximum of 24 bits)
// Outputs: none (does not return)
// Errors: theTimeSlice must be less than 16,777,216
void OS_Launch(uint32_t theTimeSlice);

//******** OS_Suspend ***************
// Called by main thread to cooperatively suspend operation
// Inputs: none
// Outputs: none
// Will be run again depending on sleep/block status
void OS_Suspend(void);

// ******** OS_Sleep ************
// place this thread into a dormant state
// input:  number of msec to sleep
// output: none
// OS_Sleep(0) implements cooperative multitasking
void OS_Sleep(uint32_t sleepTime);

// ******** OS_InitSemaphore ************
// Initialize counting semaphore
// Inputs:  pointer to a semaphore
//          initial value of semaphore
// Outputs: none
void OS_InitSemaphore(int32_t *semaPt, int32_t value);

// ******** OS_Wait ************
// Decrement semaphore and block if less than zero
// Lab2 spinlock (does not suspend while spinning)
// Lab3 block if less than zero
// Inputs:  pointer to a counting semaphore
// Outputs: none
void OS_Wait(int32_t *semaPt);

// ******** OS_Signal ************
// Increment semaphore
// Lab2 spinlock
// Lab3 wakeup blocked thread if appropriate
// Inputs:  pointer to a counting semaphore
// Outputs: none
void OS_Signal(int32_t *semaPt);

// ******** OS_FIFO_Init ************
// Initialize FIFO. 
// One event thread producer, one main thread consumer
// Inputs:  none
// Outputs: none
void OS_FIFO_Init(fifo_t *fifo);

// ******** OS_FIFO_Put ************
// Put an entry in the FIFO.  
// Exactly one event thread puts,
// do not block or spin if full
// Inputs:  data to be stored
// Outputs: 0 if successful, -1 if the FIFO is full
int OS_FIFO_Put(fifo_t *fifo,uint32_t data);

// ******** OS_FIFO_Get ************
// Get an entry from the FIFO.   
// Exactly one main thread get,
// do block if empty
// Inputs:  none
// Outputs: data retrieved
uint32_t OS_FIFO_Get(fifo_t *fifo);

#endif
//EOF

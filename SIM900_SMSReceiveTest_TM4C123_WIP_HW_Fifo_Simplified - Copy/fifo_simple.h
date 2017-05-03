#ifndef __FIFO_H__
#define __FIFO_H__

#include "stdint.h"
#include "stdbool.h"

#define FIFOSIZE   32	// size of the FIFOs (must be power of 2)
#define FIFOSUCCESS 1		// return value on success
#define FIFOFAIL    0		// return value on failure

long StartCritical (void);    // previous I bit, disable interrupts
void EndCritical(long sr);    // restore I bit to previous value

// Two-index implementation of the transmit FIFO
// can hold 0 to TXFIFOSIZE elements

typedef char DataType;

// initialize index FIFO
void GSM_TxFifo_Init(void);
// add element to end of index FIFO
// return TXFIFOSUCCESS if successful
int GSM_TxFifo_Put(DataType data);
// remove element from front of index FIFO
// return TXFIFOSUCCESS if successful
int GSM_TxFifo_Get(DataType *datapt);
// number of elements in index FIFO
// 0 to TXFIFOSIZE-1
uint32_t GSM_TxFifo_Size(void);



void GSM_RxFifo_Init(void);
int GSM_RxFifo_Put(DataType data);
int GSM_RxFifo_Get(DataType *datapt);
uint32_t GSM_RxFifo_Size(void);

#endif

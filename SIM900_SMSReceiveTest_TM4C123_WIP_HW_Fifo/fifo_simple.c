
#include "fifo_simple.h"

// Two-index implementation of the transmit FIFO
// can hold 0 to TXFIFOSIZE elements
uint32_t volatile TxPutI;// put next
uint32_t volatile TxGetI;// get next
DataType static TxFifo[FIFOSIZE];
uint32_t volatile RxPutI;// put next
uint32_t volatile RxGetI;// get next
DataType static RxFifo[FIFOSIZE];


// initialize index FIFO
void GSM_TxFifo_Init(void){ long sr;
  sr = StartCritical(); // make atomic
  TxPutI = TxGetI = 0;  // Empty
  EndCritical(sr);
}
// add element to end of index FIFO
// return TXFIFOSUCCESS if successful
int GSM_TxFifo_Put(DataType data){
  if((TxPutI-TxGetI) & ~(FIFOSIZE-1)){
    return(FIFOFAIL); // Failed, fifo full
  }
  TxFifo[TxPutI&(FIFOSIZE-1)] = data; // put
  TxPutI++;  // Success, update
  return(FIFOSUCCESS);
}
// remove element from front of index FIFO
// return TXFIFOSUCCESS if successful
int GSM_TxFifo_Get(DataType *datapt){
  if(TxPutI == TxGetI ){
    return(FIFOFAIL); // Empty if TxPutI=TxGetI
  }
  *datapt = TxFifo[TxGetI&(FIFOSIZE-1)];
  TxGetI++;  // Success, update
  return(FIFOSUCCESS);
}
// number of elements in index FIFO
// 0 to TXFIFOSIZE-1
uint32_t GSM_TxFifo_Size(void){
 return ((uint32_t)(TxPutI-TxGetI));
}

void GSM_RxFifo_Init(void){ long sr;
  sr = StartCritical(); // make atomic
  RxPutI = RxGetI = 0;  // Empty
  EndCritical(sr);
}
// add element to end of index FIFO
// return RxFIFOSUCCESS if successful
int GSM_RxFifo_Put(DataType data){
  if((RxPutI-RxGetI) & ~(FIFOSIZE-1)){
    return(FIFOFAIL); // Failed, fifo full
  }
  RxFifo[RxPutI&(FIFOSIZE-1)] = data; // put
  RxPutI++;  // Success, update
  return(FIFOSUCCESS);
}
// remove element from front of index FIFO
// return RxFIFOSUCCESS if successful
int GSM_RxFifo_Get(DataType *datapt){
  if(RxPutI == RxGetI ){
    return(FIFOFAIL); // Empty if RxPutI=RxGetI
  }
  *datapt = RxFifo[RxGetI&(FIFOSIZE-1)];
  RxGetI++;  // Success, update
  return(FIFOSUCCESS);
}
// number of elements in index FIFO
// 0 to RxFIFOSIZE-1
uint32_t GSM_RxFifo_Size(void){
 return ((uint32_t)(RxPutI-RxGetI));
}


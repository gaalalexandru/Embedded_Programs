#ifndef GSM_H
#define GSM_H  1

/*-------------------Type Includes-------------------*/
#include "stdbool.h"
#include "stdint.h"

void GSMgetCommand(uint8_t *command,uint8_t msgId);
void PowerOnGSM(void);
void SendSMS(uint8_t message);
uint8_t GSMgetResponse(void);
bool GSMparseMessage(uint8_t lineCount);
void GSMprocessMessage(uint8_t msgNum);
#endif
//EOF


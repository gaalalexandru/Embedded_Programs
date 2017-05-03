//uart_handler.h
#ifndef UART_HDL
#define UART_HDL
#include "stdint.h"
#include "stdbool.h"
/*-------------------Macro Definitions----------------*/
// U0Rx (VCP receive) connected to PA0
// U0Tx (VCP transmit) connected to PA1
// standard ASCII symbols
#define CR   0x0D
#define LF   0x0A
#define BS   0x08
#define ESC  0x1B
#define SP   0x20
#define DEL  0x7F
#define BAUD_RATE (115200)

void UART0_Init(void);
void UART0_SendChar(uint8_t data);
void UART0_SendString(uint8_t *string);
void UART0_SendDecimal(uint32_t decimal);
void UART0_NewLine(void);

#endif
//EOF

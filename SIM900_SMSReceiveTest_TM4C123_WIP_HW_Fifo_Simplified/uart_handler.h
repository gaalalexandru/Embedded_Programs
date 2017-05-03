#ifndef UART_HDL
#define UART_HDL

/*--------------------Type Includes------------------*/
#include "stdbool.h"
#include "stdint.h"
/*-------------------Macro Definitions----------------*/
// standard ASCII symbols
#define CR   0x0D  //Cariege return
#define LF   0x0A  //Line feed
#define BS   0x08  //Backspace
#define ESC  0x1B
#define SP   0x20
#define DEL  0x7F
#define SUB  0x1A //Ctrl+Z

/*-----------External function definisions-----------*/
//UART0 functions
void UART0_Init(void);
void UART0_SendChar(uint8_t data);
void UART0_SendString(uint8_t *pt);
void UART0_SendUDecimal(uint32_t n);
void UART0_SendNewLine(void);

//UART2 functions
void UART2_Init(void);
void UART2_SendChar(uint8_t data);
void UART2_SendString(uint8_t *pt);
void UART2_SendUDecimal(uint32_t n);
void UART2_SendNewLine(void);
char UART2_GetChar(void);
void UART2_GetString(char *bufPt, uint16_t max);
#endif
//EOF

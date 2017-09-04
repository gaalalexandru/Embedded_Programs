// lcd.h
#include "stdint.h"
#include "stdbool.h"

void LCD_Init(void);
void LCD_OutChar(char letter);
void LCD_Clear(void);
void LCD_OutString(char *pt);
void LCD_OutUDec(uint32_t n);
void LCD_OutUHex(uint32_t number);
//EOF

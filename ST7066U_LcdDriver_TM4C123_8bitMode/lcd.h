// lcd.h
#include "stdint.h"
#include "stdbool.h"

/*LCD_GoHome macro*/
/*If parameter is 1, it will go to starting of first line by command 0x02*/
/*If parameter is 2, it will go to starting of second line by command 0x80-adress set | 0x40-2nd line starting adress*/
#define LCD_GoHome(x) (((x) == 1) ? OutCmd(0x02) : OutCmd(0xC0))

void LCD_Init(void);
void LCD_OutChar(uint8_t letter);
void LCD_Clear(void);
void LCD_OutString(uint8_t *pt);
void LCD_OutUDec(uint32_t n);
void LCD_OutUHex(uint32_t number);
void OutCmd(uint8_t command);
//EOF

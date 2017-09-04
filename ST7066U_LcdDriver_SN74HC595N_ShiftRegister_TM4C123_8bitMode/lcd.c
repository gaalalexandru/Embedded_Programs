//lcd.c
#include "lcd.h"
#include "gpio_handler.h"
#include "SysTick.h"
#include "ssi_handler_tw.h"

#define RS	(GPIO_PIN_6)  // 1 for data, 0 for control/status
#define E		(GPIO_PIN_7)  // enable

#define RCLK	(GPIO_PIN_2)  //pin for latch shift rg (rclk)
#define OE 		(GPIO_PIN_3)  //pint for enable shift rg (oe)

#define BusFreq 80            // assuming a 80 MHz bus clock
#define T6us 6*BusFreq        // 6us
#define T37us 37*BusFreq      // 40us
#define T40us 40*BusFreq      // 40us
#define T160us 160*BusFreq    // 160us
#define T1600us 1600*BusFreq  // 1.60ms
#define T5ms 5000*BusFreq     // 5ms
#define T15ms 15000*BusFreq   // 15ms
#define T40ms 40000*BusFreq   // 40ms

/*
  size is 1*16
  if do not need to read busy, then you can tie R/W=ground
  ground = pin 1    Vss
  power  = pin 2    Vdd   +3.3V or +5V depending on the device
  ground = pin 3    Vlc   grounded for highest contrast
  PA6    = pin 4    RS    (1 for data, 0 for control/status)
  ground = pin 5    R/W   (1 for read, 0 for write)
  PA7    = pin 6    E     (enable)
  PB0    = pin 7    DB0   (8-bit data)
  PB1    = pin 8    DB1
  PB2    = pin 9    DB2
  PB3    = pin 10   DB3
  PB4    = pin 11   DB4
  PB5    = pin 12   DB5
  PB6    = pin 13   DB6
  PB7    = pin 14   DB7
16 characters are configured as 1 row of 16
addr  00 01 02 03 04 05 ... 0F
*/
void static SendSerialData(uint8_t data) {
	SetGPIOPin(F,RCLK); //latch rclk
	SSI0_DataOut(data);
  SysTick_Wait(T6us);   // wait 6us
	ClearGPIOPin(F,RCLK); //latch rclk
}

void OutCmd(unsigned char command){
	//GPIOPinWrite(GPIO_PORTB_BASE,0xFF,command);
	
	SendSerialData(command);
	
	GPIOPinWrite(GPIO_PORTA_BASE,E|RS,0);
  SysTick_Wait(T40us);   // wait 6us
	
	GPIOPinWrite(GPIO_PORTA_BASE,E|RS,E);
  SysTick_Wait(T40us);  // wait 6us
	
	GPIOPinWrite(GPIO_PORTA_BASE,E|RS,0);
  SysTick_Wait(T40us);  // wait 40us
}

void LCD_Init(void){
	SetGPIOOutput(A, RS|E);  //Set command lines
	SetGPIOOutput(F,RCLK);
	//SetGPIOOutput(B, (uint32_t)0xFF);  //Set data lines PB0 - PB7
	
	SysTick_Init();
	 
	//SetGPIOOutput(F,OE); 
	
	GPIOPinWrite(GPIO_PORTA_BASE,E|RS,0);
	
  SysTick_Wait(T40ms);	// Wait 40 ms after power is applied
	SysTick_Wait(T40ms);	// Wait 40 ms after power is applied
  OutCmd(0x38);					// Function set: 8-bit / 2-line / 5x8 character resolution */
	
	SysTick_Wait(T40us);	// must wait 37us, busy flag not available
  OutCmd(0x38);					// Function set: 8-bit / 2-line / 5x8 character resolution */
	
	SysTick_Wait(T40us);	// must wait 37us, busy flag not available
	OutCmd(0x0C);					// Display ON; Cursor Off; Blink Off
	
	SysTick_Wait(T40us);	// must wait 37us, busy flag not available
	OutCmd(0x01);					// Display Clear
	
	SysTick_Wait(T1600us);// must wait 1.52 ms, busy flag not available
	OutCmd(0x06);					// Entry mode set
}

// Output a character to the LCD
// Inputs: letter is ASCII character, 0 to 0x7F
// Outputs: none
void LCD_OutChar(char letter){
	static uint8_t address = 0x00;
	//GPIOPinWrite(GPIO_PORTB_BASE,0xFF,letter);
	SendSerialData(letter);
	
	GPIOPinWrite(GPIO_PORTA_BASE,E|RS,RS);
  SysTick_Wait(T40us);   // wait 6us
	
	GPIOPinWrite(GPIO_PORTA_BASE,E|RS,E|RS);
  SysTick_Wait(T40us);   // wait 6us
	
	GPIOPinWrite(GPIO_PORTA_BASE,E|RS,RS);
  SysTick_Wait(T40us);  // wait 40us
	if((address < 0x0F)||((address >= 0x40)&&(address < 0x4F)))  {
			 address ++;
		 }
	else if (address == 0x0F) {
		address = 0x40;
		OutCmd(0x80|address);  //go to 2nd line
	}
	else if (address == 0x4F) {
		address = 0x00;
		OutCmd(0x02);  //return home
	}
}

// Clear the LCD
// Inputs: none
// Outputs: none
void LCD_Clear(void){
  OutCmd(0x01);          // Clear Display
  SysTick_Wait(T1600us); // wait 1.6ms
  OutCmd(0x02);          // Cursor to home
  SysTick_Wait(T1600us); // wait 1.6ms
}

//------------LCD_OutString------------
// Output String (NULL termination)
// Input: pointer to a NULL-terminated string to be transferred
// Output: none
void LCD_OutString(char *pt){
  while(*pt){
    LCD_OutChar(*pt);
    pt++;
  }
}

//-----------------------LCD_OutUDec-----------------------
// Output a 32-bit number in unsigned decimal format
// Input: 32-bit number to be transferred
// Output: none
// Variable format 1-10 digits with no space before or after
void LCD_OutUDec(uint32_t n){
// This function uses recursion to convert decimal number
//   of unspecified length as an ASCII string
  if(n >= 10){
    LCD_OutUDec(n/10);
    n = n%10;
  }
  LCD_OutChar(n+'0'); /* n is between 0 and 9 */
}

//--------------------------LCD_OutUHex----------------------------
// Output a 32-bit number in unsigned hexadecimal format
// Input: 32-bit number to be transferred
// Output: none
// Variable format 1 to 8 digits with no space before or after
void LCD_OutUHex(uint32_t number){
// This function uses recursion to convert the number of
//   unspecified length as an ASCII string
  if(number >= 0x10){
    LCD_OutUHex(number/0x10);
    LCD_OutUHex(number%0x10);
  }
  else{
    if(number < 0xA){
      LCD_OutChar(number+'0');
     }
    else{
      LCD_OutChar((number-0x0A)+'A');
    }
  }
}
//EOF

//lcd.c
#include "lcd.h"
#include "gpio_handler.h"
#include "SysTick.h"
#include "ssi_handler_tw.h"

/*
#define E		(GPIO_PIN_7)  // enable
#define RCLK	(GPIO_PIN_2)  //pin for latch shift rg (rclk)
*/

#define BusFreq 80            // assuming a 80 MHz bus clock
#define T6us 6*BusFreq        // 6us
#define T10us 10*BusFreq      // 10us
#define T37us 37*BusFreq      // 40us
#define T40us 40*BusFreq      // 40us
#define T160us 160*BusFreq    // 160us
#define T1600us 1600*BusFreq  // 1.60ms
#define T5ms 5000*BusFreq     // 5ms
#define T15ms 15000*BusFreq   // 15ms
#define T40ms 40000*BusFreq   // 40ms

#define DB4 0x01  //Output QA of shift register
#define DB5 0x02  //Output QB of shift register
#define DB6 0x04  //Output QC of shift register
#define DB7 0x08  //Output QD of shift register

#define RSBit	0x10	//Output QE of shift register
#define EBit	0x20	//Output QF of shift register

#define InterfaceType		(0)  //0 for 4 bit interface, 1 for 8 bit interface
#define TwoLineDisplay	(1)  //0 for 1 line display, 1 for 2 line display
#define CharacterSize		(0)  //0 for 5x8 character size, 1 for 5x11

#define DisplayOn (1)
#define CursorOn (1)
#define CursorBlink	(0)
#define ShiftDirection (1)  //0 if cursor shifts left, 1 if right
#define DisplayShift (0)  //0 if shift cursor, 1 if shift display
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
	SetGPIOPin(F,GPIO_PIN_1); //latch rclk
	SSI0_DataOut(data);
	SysTick_Wait(T6us);   // wait 6us
	ClearGPIOPin(F,GPIO_PIN_1); //latch rclk
	SysTick_Wait(T40us);
}

void SendCmd(uint8_t command){
	uint8_t serialData = (command & 0x0F);  //Make sure we have data only on lower nimble

	//SendSerialData(serialData);
	
	//Check if this can se sent in previous message
	//Or check if whole command has to be sent again
	serialData &= ~(EBit|RSBit);  //Clear E and RS bits
	SendSerialData(serialData);
	
	serialData |= (EBit);  //Set E Bit
	SendSerialData(serialData);
	
	serialData &= ~(EBit|RSBit);  //Clear E and RS bits
	SendSerialData(serialData);
}

void LCD_Init(void){
	uint8_t initData = 0;
	SysTick_Init();
	SetGPIOOutput(F, GPIO_PIN_1);  //Set command lines
	//GPIOPinWrite(GPIO_PORTA_BASE,E|RS,0);
	SysTick_Wait(T40ms);	// Wait 40 ms after power is applied
	
	/*Init Step 1*/
	SendCmd(DB4|DB5);
	SysTick_Wait(T40us);	// must wait 37us, busy flag not available
	
	/*Init Step 2 - Display & interface config*/
	SendCmd(DB5 | (DB4 &&(InterfaceType)));
	SendCmd((DB7 &&(TwoLineDisplay)) | (DB6 &&(CharacterSize)));	
	SysTick_Wait(T40us);	// must wait 37us, busy flag not available

	/*Init Step 3 - Display & cursor config*/
	SendCmd(0);	//everything 0
	SendCmd(DB7 | (DB6 && DisplayOn) | (DB5 && CursorOn) | (DB4 && CursorBlink));
	SysTick_Wait(T40us);	// must wait 37us, busy flag not available	

	/*Init Step 4 - Display Clear*/
	SendCmd(0);	//everything 0
	SendCmd(DB4);
	SysTick_Wait(T1600us);// must wait 1.52 ms, busy flag not available
	
	/*Init Step 5 - Set entry mode*/
	SendCmd(0);	//everything 0
	SendCmd(DB6 | (DB5 && ShiftDirection) | (DB4 && DisplayShift));
	SysTick_Wait(T40us);	// must wait 37us, busy flag not available	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

// Output a character to the LCD
// Inputs: letter is ASCII character, 0 to 0x7F
// Outputs: none
void LCD_OutChar(char letter){
	static uint8_t address = 0x00;
	uint8_t lsNimble = (letter & 0x0F);  //Least segnificant nimble (bit 3 - 0)
	uint8_t msNimble = (letter >> 4);  //Most segnificant nimble (bit 7 - 4)
	
	SendSerialData(RSBit | msNimble);
	SendSerialData(RSBit | msNimble | EBit);
	SendSerialData(RSBit | msNimble);
	
	SendSerialData(RSBit | lsNimble);
	SendSerialData(RSBit | lsNimble | EBit);
	SendSerialData(RSBit | lsNimble);
	
	if((address < 0x0F)||((address >= 0x40)&&(address < 0x4F)))  {
			 address ++;
	}
	else if (address == 0x0F) {
		address = 0x40;
		lsNimble = (address & 0x0F);
		msNimble = (address >> 4);
		SendCmd(DB7 | msNimble);  //go to 2nd line
		SendCmd(lsNimble);  //go to 2nd line
	}
	else if (address == 0x4F) {
		address = 0x00;
		SendCmd(0);
		SendCmd(DB5);  //return home
	}
}

// Clear the LCD
// Inputs: none
// Outputs: none
void LCD_Clear(void){
	SendCmd(0);
	SendCmd(DB4);  // Clear Display
	SysTick_Wait(T1600us); // wait 1.6ms

	SendCmd(0);
	SendCmd(DB5);  //return home
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

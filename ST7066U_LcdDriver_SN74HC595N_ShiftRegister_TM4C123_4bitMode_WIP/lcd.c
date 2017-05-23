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
#define T10us 10*BusFreq      // 10us
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
	SSI0_DataOut(data);
	SetGPIOPin(F,GPIO_PIN_2); //latch rclk
  SysTick_Wait(T10us);   // wait 6us
	ClearGPIOPin(F,GPIO_PIN_2); //latch rclk
}

void static OutCmd(unsigned char command){
int i = 0;
int value1 = 0;
int control = 0; // stores DI and RW

	ClearGPIOPin(F,GPIO_PIN_2); //latch rclk
	
  control = command >> 8; // get the control signals DI and RW
  control <<= 5; // shift the control signals to the left
  value1 = command;
  value1 >>= 4; //send the first 4 databits (from 8) 
  value1 |= control; // set the control values
  value1 &= 239; // set Enable LOW
  SendSerialData(value1);
	
  value1 |= 16; // Set Enable HIGH
  SendSerialData(value1);
  value1 &= 239; // set Enable LOW
  SendSerialData(value1);

  delay(1);

  command &= 15; // set HByte to zero 
  command |= control; // set the control values
  command &= 239; // set Enable LOW
  SendSerialData(command);
  command |= 16; // Set Enable HIGH
  SendSerialData(command);
  command &= 239; // set Enable LOW
  SendSerialData(command);
}

void LCD_Init(void){
	SetGPIOOutput(A, RS|E);  //Set command lines
	//SetGPIOOutput(B, (uint32_t)0xFF);  //Set data lines PB0 - PB7
	SysTick_Init();
	
	SetGPIOOutput(F,RCLK); 
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
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	 delay(100);
  // initialize LCD after a short pause
  // needed by the LCD's controller

  /////////// 4 pin initialization
  OutCmd(0x28); // function set:
  // 4 pin initialization
  delay(64);
  OutCmd(0x28); // function set:
  // 4 pin initialization
  delay(50);
  OutCmd(0x28); // function set:
  // 4 pin initialization
  delay(50);
  OutCmd(0x28); // function set:
  // 4 pin initialization
  delay(50);
  LcdCommandWrite(0x2C); // function set:
  // 4-bit interface, 1 display lines, 5x7 font
  /////////// end of 4 pin initialization 

  delay(20);
  LcdCommandWrite(0x06); // entry mode set:
  // increment automatically, no display shift
  delay(20);
  LcdCommandWrite(0x0E); // display control:
  // turn display on, cursor on, no blinking
  delay(20);
  // clear display, set cursor position to zero
  LcdCommandWrite(0x01); 
  delay(100);

  LcdCommandWrite(0x80); // display control:
  delay(20);
	
	
	
	
	
	
	
	
	
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
	
	  int i = 0;
  int value1 = 0;
  ClearGPIOPin(F,GPIO_PIN_2); //latch rclk
  value1 =letter;
  value1 >>= 4; //send the first 4 databits (from 8) 
  value1 |= 64; // set DI HIGH
  value1 &= 223; // set RW LOW
  value1 &= 239; // set Enable LOW
  SendSerialData(value1);
  value1 |= 16; // Set Enable HIGH
  SendSerialData(value1);
  value1 &= 239; // set Enable LOW
  SendSerialData(value1);

  delay(1);

  letter &= 15; // set HByte to zero 
  letter |= 64; // set DI HIGH
  letter &= 223; // set RW LOW
  letter &= 239; // set Enable LOW
  SendSerialData(letter);
  letter |= 16; // Set Enable HIGH
  SendSerialData(letter);
  letter &= 239; // set Enable LOW
  SendSerialData(letter);
	
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

//lcd.c
#include "lcd.h"
#include "gpio_handler.h"
#include "SysTick.h"
#include "ssi_handler_tw.h"
#include "driverlib/ssi.h"

#define RS	(GPIO_PIN_6)  // 1 for data, 0 for control/status
#define E		(GPIO_PIN_7)  // enable

#define RCLK	(GPIO_PIN_2)  //pin for latch shift rg (rclk)
#define OE 		(GPIO_PIN_3)  //pint for enable shift rg (oe)
#define CLEAR	(GPIO_PIN_3) 

#define BusFreq 80            // assuming a 80 MHz bus clock
#define T02us (BusFreq/5)        // 6us
#define T1us 1*BusFreq        // 6us
#define T6us 6*BusFreq        // 6us
#define T37us 37*BusFreq      // 40us
#define T40us 40*BusFreq      // 40us
#define T160us 160*BusFreq    // 160us
#define T1600us 1600*BusFreq  // 1.60ms
#define T5ms 5000*BusFreq     // 5ms
#define T15ms 15000*BusFreq   // 15ms
#define T40ms 40000*BusFreq   // 40ms

#define SerialInterface	(0)		//True if we use serial interface through shift register
#define HalfByteInterface	(1)	//True if we use 4 data bits

/*
  LCD size is 2*16
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
32 characters are configured as 2 row of 16
addr  00 01 02 03 04 05 ... 0F
addr  40 41 42 43 44 45 ... 4F

Contrast addjustment: V0 = 0.455 V
*/

void static SendSerialData(uint8_t data) {
	SSIDataPut(SSI0_BASE,data);
  SysTick_Wait(T40us);
	
	SetGPIOPin(F,RCLK); //latch rclk
  SysTick_Wait(T1us);   // wait 1us - tw = 20 ns
	ClearGPIOPin(F,RCLK); //latch rclk

}

void OutData(unsigned char data){
#if SerialInterface
	SendSerialData(data);
#else
	#if (HalfByteInterface == 0)
		GPIOPinWrite(GPIO_PORTB_BASE,0xFF,data);
	#else
		GPIOPinWrite(GPIO_PORTB_BASE,0xF0,(data & 0xF0));  //Write upper 4 bits
	#endif
#endif

	GPIOPinWrite(GPIO_PORTA_BASE,RS,RS);
	SysTick_Wait(T1us);	//No wait is required - tAS

	GPIOPinWrite(GPIO_PORTA_BASE,E,E);
	SysTick_Wait(T40us);  // wait 0.2us - tPW min 140ns if Vcc = 5V
	GPIOPinWrite(GPIO_PORTA_BASE,E,0);
	SysTick_Wait(T1us);  // wait 1us - tAH min 10 ns if Vcc = 5v

#if (HalfByteInterface)
	GPIOPinWrite(GPIO_PORTB_BASE,0xF0,(data << 4));  //Write lower 4 bits
	GPIOPinWrite(GPIO_PORTA_BASE,E,E);
	SysTick_Wait(T40us);  // wait 0.2us - tPW min 140ns if Vcc = 5V
	GPIOPinWrite(GPIO_PORTA_BASE,E,0);
	SysTick_Wait(T1us);  // wait 1us - tAH min 10 ns if Vcc = 5v
#endif

	GPIOPinWrite(GPIO_PORTA_BASE,RS,0);
#if SerialInterface
	//SendSerialData(0);
#else
	//GPIOPinWrite(GPIO_PORTB_BASE,0xFF,0);
#endif
}

void OutCmd(unsigned char command){
	GPIOPinWrite(GPIO_PORTA_BASE,RS,0);
	//No wait is required - tAS

#if SerialInterface
	SendSerialData(command);
#else
	#if (HalfByteInterface == 0)	
		GPIOPinWrite(GPIO_PORTB_BASE,0xFF,command);
	#else
		GPIOPinWrite(GPIO_PORTB_BASE,0xF0,(command & 0xF0));  //Write upper 4 bits
	#endif
#endif
	
	GPIOPinWrite(GPIO_PORTA_BASE,E,E);
	SysTick_Wait(T40us);  // wait 0.2us - tPW min 140ns if Vcc = 5V
	GPIOPinWrite(GPIO_PORTA_BASE,E,0);
  SysTick_Wait(T1us);  // wait 1us - tAH min 10 ns if Vcc = 5v

#if (HalfByteInterface)
	GPIOPinWrite(GPIO_PORTB_BASE,0xF0,(command << 4));  //Write lower 4 bits
	GPIOPinWrite(GPIO_PORTA_BASE,E,E);
	SysTick_Wait(T40us);  // wait 0.2us - tPW min 140ns if Vcc = 5V
	GPIOPinWrite(GPIO_PORTA_BASE,E,0);
	SysTick_Wait(T1us);  // wait 1us - tAH min 10 ns if Vcc = 5v
#endif
	

#if SerialInterface
	//SendSerialData(0);
#else
	//GPIOPinWrite(GPIO_PORTB_BASE,0xFF,0);
#endif
}

void LCD_Init(void){
	SetGPIOOutput(A, (uint32_t)RS|E);  //Set command lines
	
#if SerialInterface
	SetGPIOOutput(F, (uint32_t)RCLK);
	SSI0_Init();  //Init SPI to shift register, needed to control LCD
#else
	#if (HalfByteInterface == 0)
		SetGPIOOutput(B, (uint32_t)0xFF);  //Set data lines PB0 - PB7
	#else
		SetGPIOOutput(B, (uint32_t)0xF0);  //Set data lines PB4 - PB7	
	#endif
#endif

	SysTick_Init();
	
	GPIOPinWrite(GPIO_PORTA_BASE,RS,0x00);
	GPIOPinWrite(GPIO_PORTA_BASE,E,0x00);

#if SerialInterface
	SendSerialData(0);
#else
	#if (HalfByteInterface == 0)
		GPIOPinWrite(GPIO_PORTB_BASE,0xFF,0x00);
	#else
		GPIOPinWrite(GPIO_PORTB_BASE,0xF0,0x00);
	#endif
#endif
	SysTick_Wait(T40ms);	// Wait 40 ms after power is applied
  SysTick_Wait(T40ms);	// Wait 40 ms after power is applied

#if (HalfByteInterface == 0)
	OutCmd(0x38); // Function set: 8-bit / 2-line / 5x8 character resolution */
#else
	//OutCmd(0x30); // Function set
	//SysTick_Wait(T40us);

	//OutCmd(0x30); // Function set
	//SysTick_Wait(T40us);
	
	OutCmd(0x28); // Function set: 4-bit / 2-line / 5x8 character resolution */
	SysTick_Wait(T40us);
	
	//OutCmd(0x28); // Function set: 4-bit / 2-line / 5x8 character resolution */
	//SysTick_Wait(T40us);	
#endif

//AleGaa: Check if a 2nd function set command is necessary both in 8bit and 4bit interface mode

	SysTick_Wait(T40us);	// must wait 37us, busy flag not available

	OutCmd(0x0C);					// Display ON; Cursor Off; Blink Off
	SysTick_Wait(T40us);	// must wait 37us, busy flag not available

	OutCmd(0x01);					// Display Clear
	SysTick_Wait(T1600us);// must wait 1.52 ms, busy flag not available

	OutCmd(0x06);					// Entry mode set
	SysTick_Wait(T40us);

#if SerialInterface
	SendSerialData(0);
#else	
	#if (HalfByteInterface == 0)	
		GPIOPinWrite(GPIO_PORTB_BASE,0xFF,0x00);
	#else
		GPIOPinWrite(GPIO_PORTB_BASE,0xF0,0x00);
	#endif
#endif

	SysTick_Wait(T40us);
}

// Output a character to the LCD
// Inputs: letter is ASCII character, 0 to 0x7F
// Outputs: none
void LCD_OutChar(uint8_t letter){
	static uint8_t address = 0x00;
	OutData(letter);
	if((address < 0x0F)||((address >= 0x40)&&(address < 0x4F))) {
			 address ++;
	}
	else if (address == 0x0F) {
		address = 0x40;
		//Send command 0xC0 that is from 0x80|address
		LCD_GoHome(2);  //return home of 2nd line
	}
	else if (address == 0x4F) {
		address = 0x00;
		LCD_GoHome(1);  //return home of 1st line
	}
}

// Clear the LCD
// Inputs: none
// Outputs: none
void LCD_Clear(void){
  OutCmd(0x01);          // Clear Display
  SysTick_Wait(T1600us); // wait 1.6ms
  LCD_GoHome(1);
  SysTick_Wait(T1600us); // wait 1.6ms
}

//------------LCD_OutString------------
// Output String (NULL termination)
// Input: pointer to a NULL-terminated string to be transferred
// Output: none
void LCD_OutString(uint8_t *pt){
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

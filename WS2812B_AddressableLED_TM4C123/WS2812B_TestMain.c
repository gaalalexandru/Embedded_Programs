// Nokia5110TestMain.c
// Runs on LM4F120/TM4C123
// Test the functions in Nokia5110.c by printing various
// things to the LCD.
// Daniel Valvano
// September 16, 2013

#include <stdint.h>
#include "SSI_handler.h"
#include "PLL.h"

// delay function for testing from sysctl.c
// which delays 3*ulCount cycles
#ifdef __TI_COMPILER_VERSION__
	//Code Composer Studio Code
	void Delay(uint32_t ulCount){
	__asm (	"loop    subs    r0, #1\n"
			"    bne     loop\n");
}

#else
	//Keil uVision Code
	__asm void
	Delay(uint32_t ulCount)
	{
    subs    r0, #1
    bne     Delay
    bx      lr
	}
#endif
	
#define NR_OF_LEDS (5)
#define HighBit (0xF8)
#define LowBit	(0xE0)
	
/*#define GREEN		{.Red = 0x00, .Green = POWER, .Blue = 0x00}
#define RED			{.Red = POWER, .Green = 0x00, .Blue = 0x00};
#define BLUE		{0x00,0x00,POWER}
#define WHITE		{POWER,POWER,POWER}
#define YELLOW	{POWER,POWER,0x00}
#define LED_OFF {0x00,0x00,0x00}*/

#define POWER 0x01
	
#define SET_RED		LedColor.Green = 0x00; LedColor.Red = POWER; LedColor.Blue = 0x00; //Red Color
#define SET_GREEN	LedColor.Green = POWER; LedColor.Red = 0x00; LedColor.Blue = 0x00; //Green Color
#define SET_BLUE	LedColor.Green = 0x00; LedColor.Red = 0x00; LedColor.Blue = POWER; //Blue Color
#define SET_OFF		LedColor.Green = 0x00; LedColor.Red = 0x00; LedColor.Blue = 0x00; //Off
#define SET_WHITE	LedColor.Green = POWER; LedColor.Red = POWER; LedColor.Blue = POWER; //White Color
#define SET_YELLOW LedColor.Green = POWER; LedColor.Red = POWER; LedColor.Blue = 0x00; //Yellow Color

	
struct stRGB {
	uint8_t Red;
	uint8_t Green;
	uint8_t Blue;
};

typedef struct stRGB tstRGB;

tstRGB data[NR_OF_LEDS];

//uint8_t Set_RGB(uint8 led_nr, tstRGB color);

static uint8_t Set_RGB(uint8_t led_nr, tstRGB color) {
	if(led_nr < NR_OF_LEDS) {
		data[led_nr].Green = color.Green;
		data[led_nr].Red = color.Red;
		data[led_nr].Blue = color.Blue;
		return 1; //Ok
	}
	else {
		return 0; //Error
	}
}

int main(void){
	uint8_t mask = POWER;
	tstRGB LedColor = {0x00,0x00,0x00};
	uint8_t stat = 0;
		//Green Red Blue 
	//uint8_t	data[15] = {0xE1 ,0xa5 ,0x0F,0xB9 ,0x0F ,0xE0,0x00 ,0x11 ,0x00,POWER ,0x0F ,0xA1,0x20 ,POWER ,0x07};
	uint8_t i = 0;
	uint8_t j = 0;
  PLL_Init(Bus80MHz);
  SSI0_Init();
	
	//LedColor.Green = POWER; LedColor.Red = POWER; LedColor.Blue = POWER; //White Color
	SET_OFF
	Set_RGB(0,LedColor);
	SET_RED
	Set_RGB(1,LedColor);
	SET_YELLOW
	Set_RGB(2,LedColor);
	SET_BLUE
	Set_RGB(3,LedColor);
	SET_OFF
	Set_RGB(4,LedColor);	
	
  while(1){

		for (i=0;i<NR_OF_LEDS;i++){
			for (j=0;j<8;j++){ //Process Green
				if (((data[i].Green) & (mask>>j)) != 0){
					SSI0_DataOut(HighBit);
				}
				else{
					SSI0_DataOut(LowBit);
				}
			}
			for (j=0;j<8;j++){ //Process Red
				if (((data[i].Red) & (mask>>j)) != 0){
					SSI0_DataOut(HighBit);
				}
				else{
					SSI0_DataOut(LowBit);
				}
			}
			for (j=0;j<8;j++){ //Process Blue
				if (((data[i].Blue) & (mask>>j)) != 0){
					SSI0_DataOut(HighBit);
				}
				else{
					SSI0_DataOut(LowBit);
				}
			}
		}
		Delay(33333333);
		stat ^= 1;
		if(stat) {
			SET_OFF
			Set_RGB(0,LedColor);
			SET_RED
			Set_RGB(1,LedColor);
			SET_WHITE
			Set_RGB(2,LedColor);
			SET_GREEN
			Set_RGB(3,LedColor);
			SET_OFF
			Set_RGB(4,LedColor);
		}
		else {
			SET_OFF
			Set_RGB(0,LedColor);
			SET_RED
			Set_RGB(1,LedColor);
			SET_YELLOW
			Set_RGB(2,LedColor);
			SET_BLUE
			Set_RGB(3,LedColor);
			SET_OFF
			Set_RGB(4,LedColor);	
		}

  }
}

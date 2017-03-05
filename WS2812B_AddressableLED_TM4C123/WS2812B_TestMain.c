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
#define LowBit (0xE0)
#define FullPower (0x0F)
#define BitMask (0x80)
#define BargraphResolutionMultiplier (2)
	
#define SET_RED		LedColor.Green = 0x00; LedColor.Red = FullPower; LedColor.Blue = 0x00; //Red Color
#define SET_GREEN	LedColor.Green = FullPower; LedColor.Red = 0x00; LedColor.Blue = 0x00; //Green Color
#define SET_BLUE	LedColor.Green = 0x00; LedColor.Red = 0x00; LedColor.Blue = FullPower; //Blue Color
#define SET_OFF		LedColor.Green = 0x00; LedColor.Red = 0x00; LedColor.Blue = 0x00; //Off
#define SET_WHITE	LedColor.Green = FullPower; LedColor.Red = FullPower; LedColor.Blue = FullPower; //White Color
#define SET_YELLOW LedColor.Green = FullPower; LedColor.Red = FullPower; LedColor.Blue = 0x00; //Yellow Color

	
typedef struct stRGB {
	uint8_t Red;
	uint8_t Green;
	uint8_t Blue;
} tstRGB;

tstRGB data[NR_OF_LEDS];

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

static void Send_RGB_Data(void) {
	uint8_t i = 0; //index of LEDs on PCB
	uint8_t j = 0; //index of bits in HighBit and LowBit frames
	for (i=0;i<NR_OF_LEDS;i++){
			for (j=0;j<8;j++){ //Process Green
				if (((data[i].Green) & (BitMask>>j)) != 0){
					SSI0_DataOut(HighBit);
				}
				else{ 
					SSI0_DataOut(LowBit);
				}
			}
			for (j=0;j<8;j++){ //Process Red
				if (((data[i].Red) & (BitMask>>j)) != 0){
					SSI0_DataOut(HighBit);
				}
				else{
					SSI0_DataOut(LowBit);
				}
			}
			for (j=0;j<8;j++){ //Process Blue
				if (((data[i].Blue) & (BitMask>>j)) != 0){
					SSI0_DataOut(HighBit);
				}
				else{
					SSI0_DataOut(LowBit);
				}
			}
		}
}

static uint8_t Set_Bargraph(uint8_t percentage, tstRGB color) {
	//NR_OF_LEDS
	//FullPower
	uint8_t NrOfDataPoints = BargraphResolutionMultiplier * (NR_OF_LEDS * percentage) / 100;  //Nr of data points (LEDs and half powered LEDs)
	uint8_t NrOfLEDsOn = NrOfDataPoints / BargraphResolutionMultiplier;  //Number of LEDs at full power
	uint8_t i = 0;
	tstRGB LedColor = {0x00,0x00,0x00};
	if(percentage > 100) {
		return 0;  //Error
	}
	else {
		for (i=0;i<NrOfLEDsOn;i++) {
			SET_RED
			Set_RGB(i, color);
		}
		if (BargraphResolutionMultiplier%
		return 1;  //Ok
	}
	
}

int main(void){
	tstRGB LedColor = {0x00,0x00,0x00};
	uint8_t stat = 0;

  PLL_Init(Bus80MHz);
  SSI0_Init();

  while(1){
		stat ^= 1;
		if(stat) {
			SET_RED
			Set_RGB(0,LedColor);
			SET_BLUE
			Set_RGB(1,LedColor);
			SET_RED
			Set_RGB(2,LedColor);
			SET_BLUE
			Set_RGB(3,LedColor);
			SET_RED
			Set_RGB(4,LedColor);
		}
		else {
			SET_WHITE
			Set_RGB(0,LedColor);
			SET_GREEN
			Set_RGB(1,LedColor);
			SET_WHITE
			Set_RGB(2,LedColor);
			SET_GREEN
			Set_RGB(3,LedColor);
			SET_WHITE
			Set_RGB(4,LedColor);	
		}
		Delay(5333333); //Replace with actual timer
	}
}

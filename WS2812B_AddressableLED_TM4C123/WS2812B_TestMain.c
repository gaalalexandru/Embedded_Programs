// Nokia5110TestMain.c
// Runs on LM4F120/TM4C123
// Test the functions in Nokia5110.c by printing various
// things to the LCD.
// Daniel Valvano
// September 16, 2013

#include <stdint.h>
#include "SSI_handler.h"
#include "UART_handler.h"
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
#define HighBit  /*(0xFC)*/  (0xF8)
#define LowBit /*(0xC0)*/  (0xE0)
#define FullPower (0x80)
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
/*---------Function prototype declarations---------*/
static void Clear_Data(void);
static void Set_Off(void);
static uint8_t Set_RGB(uint8_t led_nr, tstRGB color);
static uint8_t Set_Bargraph(uint8_t percentage, tstRGB color);
static void Send_RGB_Data(void);
static void Set_Moving_Point(tstRGB color);
/*---------Function prototype definitions---------*/
static void Clear_Data(void){
	uint8_t i = 0;
	for (i=0;i<NR_OF_LEDS;i++){
		data[i].Red = 0;
		data[i].Green = 0;
		data[i].Blue = 0;
	}
}

static void Set_Off(void){
	Clear_Data();
	Send_RGB_Data();
}

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
static void Set_Moving_Point(tstRGB color){
	static uint8_t ix = 0;
	tstRGB LedColor_Off = {0x00,0x00,0x00};
	if(ix != 0) { //Previous LED was any except the 1st
		Set_RGB((ix-1),LedColor_Off);	 //Clear previous LED
	}
	else {  //Previous LED was the first
		Set_RGB((NR_OF_LEDS-1),LedColor_Off);	 //Clear previous LED
	}
	Set_RGB(ix,color);  //Set current LED
	ix = ((ix + 1) % NR_OF_LEDS);  //increment and reset current LED index
}

static uint8_t Set_Bargraph(uint8_t percentage, tstRGB color) {
	uint8_t NrOfDataPoints = BargraphResolutionMultiplier * (NR_OF_LEDS * percentage) / 100;  //Nr of data points (LEDs and half powered LEDs)
	uint8_t NrOfLEDsOn = NrOfDataPoints / BargraphResolutionMultiplier;  //Number of LEDs at full power
	uint8_t i = 0;
	tstRGB LedColor = {0x00,0x00,0x00};
	if(percentage > 100) {
		return 0;  //Error
	}
	else {
		//Set_Off();
		Clear_Data();
		for (i=0;i<NrOfLEDsOn;i++) {
			Set_RGB(i, color); //Turn on LEDs at full Brightness
		}
		if (NrOfDataPoints % BargraphResolutionMultiplier != 0) {
			//Turn on last LED at partial brightness
			if(color.Green > 1) { LedColor.Green = color.Green>>1; }
			if(color.Red > 1) { LedColor.Red = color.Red>>1; }
			if(color.Blue > 1) { LedColor.Blue = color.Blue>>1; }
			Set_RGB(NrOfLEDsOn, LedColor); //Turn on LEDs at full Brightness
		}
		return 1;  //Ok
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

int main(void){
	tstRGB LedColor = {0x00,0x00,0x00};
	uint8_t stat = 0;

  PLL_Init(Bus80MHz);
  UART_Init();              // initialize UART
  SSI0_Init();
	//SET_RED
	SET_GREEN
  while(1){
		//UART_OutChar('1');
		//UART_OutUDec(121);
		//UART_OutString("asda33rsdf3");
		Set_Moving_Point(LedColor);

		/*
		Set_Bargraph(10*stat,LedColor);
		stat = ((stat + 1) % 10);
		*/
		
		/*
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
		}*/
		
		Send_RGB_Data();
	  Delay(5000000); //AleGaa Todo: Replace with actual timer
	}
}

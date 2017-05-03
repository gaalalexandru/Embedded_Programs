/*-------------------Driver Includes-----------------*/
/*-------------------Configuration Includes-----------*/
#include "SecSys_Config.h"
/*------Export interface---Self header Includes------*/
#include "pc_display.h"
/*-------------------Service Includes-----------------*/
#include "uart_handler.h"

/*-------------Global Variable Definitions------------*/

/*-------------Local Variable Definitions-------------*/

/*-------------------Function Definitions-------------*/
void PC_Display_Message( char *string1, uint32_t value, char *string2){
	UART0_SendString((uint8_t*)string1);  //TODO check if casting is made OK
	UART0_SendUDecimal(value);
	UART0_SendString((uint8_t*)string2);
	UART0_SendNewLine();
}
//EOF

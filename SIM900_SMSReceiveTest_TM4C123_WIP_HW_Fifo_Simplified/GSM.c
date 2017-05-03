/*-------------------Configuration Includes-----------*/
#include "SecSys_Config.h"
/*------Export interface---Self header Includes------*/
#include "GSM.h"
/*-------------------Driver Includes-----------------*/
#include "driverlib/sysctl.h"
#include "driverlib/uart.h"
#include "inc/hw_memmap.h"
/*-----------------Application Includes---------------*/
#include "pc_display.h"

/*-------------------Service Includes-----------------*/
//#include "gpio_handler.h"
#include "uart_handler.h"
#include "utils\uartstdio.h"
#include "string.h"
#include "stdio.h"

/*-------------------Macro Definitions----------------*/
#define DELETE_ALL_SMS (0)  //Delete all SMS on startup (Disable for testing)

/*-------------Global Variable Definitions------------*/
extern uint32_t Count0_PIRA;  // number of times Task0 loops
extern uint32_t Count1_PIRB;  // number of times Task1 loops
extern uint32_t Count8_Blank; //increments every minute
extern uint32_t PIR_A_Alarm_Nr;
extern uint32_t PIR_B_Alarm_Nr;

bool testDelete = 1;  // Delete messages during processing

// Data from most recent incoming message stored here
char responseLine[10][160];  // Use to store UART inputs
static char *msgContent =  NULL;  // Message content holder
static char *msgSender =   NULL;  // Message sender
static char *msgDate =     NULL;  // Message date
static char *msgTime =     NULL;  // Message time

/*-------------Local Variable Definitions-------------*/

/*-------------------Function Definitions-------------*/
/*
void SendCommandValue(uint8_t *str, uint32_t value){
	UART2_SendString(str);
	UART2_SendUDecimal(value);
	UART2_SendChar(CR);
}

void SendCommandString(uint8_t *str1, uint8_t *str2){
	UART2_SendString(str1);
	UART2_SendString(str2);
	UART2_SendChar(CR);
}
*/

void PowerOnGSM(void){
	uint8_t lineCount = 0;
	uint16_t i = 0;
	uint8_t uart2_dump[1024] = "";
	
	//SendCommandValue("AT+CMGF=",1);  //message format text
	//UART2_SendString("AT+CMGF=1");  //message format text
	//UART2_SendChar(CR);
	UARTprintf("AT+CMGF=%u\r\n",1);
	SysCtlDelay(Millis2Ticks(100)); //Interrupts are NOT disabled and OS is NOT stoped during delay!	
	lineCount = GSMgetResponse();
	
	//UART2_SendString("AT+CSDH=0");  //do not show complete message header
	//UART2_SendChar(CR);
	UARTprintf("AT+CSDH=%u\r\n",0);
	SysCtlDelay(Millis2Ticks(100));
	lineCount = GSMgetResponse();
		
	//UART2_SendString("AT+CNMI=0,0,0,0,1");  //set new message indication mode
	UARTprintf("AT+CNMI=%u%u%u%u%u\r\n",0,0,0,0,1);
	//Messages are stored on GSM module, no indication is provided
	//AT+CMGR=1 will read the messages when user triggers GSMprocessMessage(msgNum)
	//UART2_SendChar(CR);
	//SysCtlDelay(Millis2Ticks(100));
	lineCount = GSMgetResponse();
	UART0_SendString((uint8_t*)"GSM init done...");		
	/*for(i = 0; i< 1024; i++){  //Dump everything on UART2
		uart2_dump[i] = UARTCharGetNonBlocking(UART2_BASE);
		SysCtlDelay(5);
	}*/
}

//*****************************************************************************
//
// PROCESS SMS FOR ENVELOPE AND CONTENT 
//
//*****************************************************************************
void GSMprocessMessage(uint8_t msgNum) {	
	bool msgPresent = 0;  // Flag to ignore deleted messages
	int lineCount=0;  // Hold the number of lines

	// Start message retrieval/parsing/error checking (runs simultaneously to
	// reduce calls to the SIM module).
	// Request the message and get the lines of the response (includes envelope, nulls, SIM responses)
	//SendCommandValue("AT+CMGR=",msgNum);
	UARTprintf("AT+CMGR=%u\r\n",msgNum);
	SysCtlDelay(Millis2Ticks(10));
	
	lineCount = GSMgetResponse();

	// Make sure there's message content, process for envelope and content
	msgPresent = GSMparseMessage(lineCount);

	// Show the user what we found
	PC_Display_Message("\n\r>>> MESSAGE :",msgNum," ");
	if (msgPresent) {
		PC_Display_Message("> FROM :",0,msgSender);  //TODO: Try to send a BS to delete the 0
		PC_Display_Message("> AT :",0,msgDate);			
		PC_Display_Message("> ON :",0,msgTime);
		PC_Display_Message("> TEXT :",0,msgContent);			
	}
	else PC_Display_Message("> NOT PRESENT!",0," ");
}

//*****************************************************************************
//
// STORE A GSM RESPONSE TO ARRAY responseLine[]
//
//*****************************************************************************
uint8_t GSMgetResponse(void) {
bool readResponse = true;       // Keeps the loop open while getting message
int readLine = 1;               // Counts the lines of the message
char *GSMresponse = NULL;       // Use to grab input
char g_cInput[128];      // String input to a UART
	
	PC_Display_Message("> Started message reading", 0," ");
	//readLine = 0;
	while(readResponse&&(readLine<10)) {  //TODO, do not hardcode, use macro
		// Grab a line
		//UART2_GetString(g_cInput,sizeof(g_cInput));  //grabs string untill character != CR or LF
		if(UARTRxBytesAvail() > 2) UARTgets(g_cInput,sizeof(g_cInput));
		// Stop after newline
		//PC_Display_Message(">>> Line nr: ", readLine, g_cInput);
		//GSMresponse = strtok(g_cInput,"\n");
		strcpy(responseLine[readLine],g_cInput/*GSMresponse*/);
		//PC_Display_Message(">>> Line nr: ", readLine, g_cInput);
		PC_Display_Message(">>> Line nr: ", readLine, responseLine[readLine]);
		// If this line says OK we've got the whole message
		if((strncmp(responseLine[readLine],"OK",2)==0)||
			 (strncmp(responseLine[readLine],"ERROR",5)==0)){
			readResponse = false;
		}
		else readLine++;
	}
	return (readLine+1);
}

//*****************************************************************************
//
// PARSE GSM MESSAGE FOR ENVELOPE AND MESSAGE CONTENT
// Stores message envelope and constant to global variables, OR returns true
// for message present, false for no message
//
//*****************************************************************************
bool GSMparseMessage(uint8_t lineCount) {
uint8_t activeLine = 0;  // Counter for line being processed
char *msgEnvelope = NULL;  // Message envelope holder

	msgContent = NULL; // Clear out the old message
	// Parse the new message
	while (activeLine < lineCount) //lineCount is larger by 1 than responseLine [index]
	{
		// CASE FOR ENVELOPE (which will look like:)
		// +CMGR: "REC READ","+40758438903","","17/04/12,22:53:48+12"
		if ( strstr(responseLine[activeLine],"+CMGR:") != '\0' )  //if message received
		{
			// Start parsing
			msgEnvelope = responseLine[activeLine];
			PC_Display_Message("> Envelope is: ",0,msgEnvelope);
				
			msgSender = strtok(msgEnvelope,",");  // Go to first comma, skipping status
			msgSender = strtok(NULL,",");  // Grab the number	
			msgSender += 3;  // Skip the prefix from the phone number and qautation marks
			msgSender[10] = '\0';  // Store the number (with null terminator)
			PC_Display_Message(">>> Sender is: ",0,msgSender);
			
			msgDate = strtok(NULL,",");  // Go to next comma, skipping phonebook entry
			msgDate = strtok(NULL,",");  // Grab the date
			msgDate += 1;  //remove qautation marks
			msgDate[8] = '\0';  // Store the date (with null terminator)
			PC_Display_Message(">>> Date is: ",0,msgDate);
			
			msgTime = strtok(NULL,",");  // Grab the time
			msgTime[8] = '\0';  // Store the time (with null terminator)
			PC_Display_Message(">>> Time is: ",0,msgTime);
		}

		// CASE FOR MESSAGE CONTENT
		// If we already found the envelope, and the line's not blank...
		else if ( msgEnvelope != NULL && responseLine[activeLine] != NULL )
		{
			if((responseLine[activeLine] != "\n")&&
				 (responseLine[activeLine] != "\0")&&
				 (responseLine[activeLine] != " ")) {
				// ... and we haven't found any content, this is the first line.
				if (msgContent == NULL) msgContent = responseLine[activeLine];

				// ... otherwise, add a space and append this line.
				else if ( activeLine + 2 <= lineCount ) {  //+2 because of emply line before OK and last line with OK.
					strcat(msgContent, " ");
					strcat(msgContent, responseLine[activeLine]);
				}
			}
		}
		activeLine++; // Proceed to next line
	}
	PC_Display_Message(">>> Content is: ",0,msgContent);
	if (msgEnvelope == NULL) { // If we didn't find an envelope, there's no message
		return false;
	}
	else { 	// Otherwise, return true.
		return true;
	}
}
//EOF

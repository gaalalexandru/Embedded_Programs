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

//*****************************************************************************
//
// SETUP GSM MODULE
//
//*****************************************************************************
void PowerOnGSM(void){
	uint8_t lineCount = 0;
	uint16_t i = 0;
	uint8_t uart2_dump[1024] = "";
	
	UARTprintf("AT+CMGF=%u\r\n",1);  //message format text
	SysCtlDelay(Millis2Ticks(100)); //Interrupts are NOT disabled and OS is NOT stoped during delay!	
	lineCount = GSMgetResponse();

	UARTprintf("AT+CSDH=%u\r\n",0);  //do not show complete message header
	SysCtlDelay(Millis2Ticks(100));
	lineCount = GSMgetResponse();
		
	UARTprintf("AT+CNMI=%u%u%u%u%u\r\n",0,0,0,0,1);  //set new message indication mode
	//Messages are stored on GSM module, no indication is provided
	//AT+CMGR=msgNum will read the messages when user triggers GSMprocessMessage(msgNum)
	SysCtlDelay(Millis2Ticks(100));
	lineCount = GSMgetResponse();
}

//*****************************************************************************
//
// PROCESS SMS FOR ENVELOPE AND CONTENT 
//
//*****************************************************************************
void GSMprocessMessage(uint8_t msgNum) {	
	bool msgPresent = 0;  // Flag to ignore deleted messages
	int lineCount=0;  // Hold the number of lines

	
	// Request the message and get the lines of the response (includes envelope, nulls, SIM responses)
	UARTprintf("AT+CMGR=%u\r\n",msgNum);  //read request for msgNum
	SysCtlDelay(Millis2Ticks(10));
	
	// Start message retrieval
	lineCount = GSMgetResponse();

	// Make sure there's message content, process for envelope and content
	msgPresent = GSMparseMessage(lineCount);

	// Show the user what we found
	PC_Display_Message("\n\r>>> MESSAGE :",msgNum," ");
	if (msgPresent) {
		PC_Display_Message("> FROM: ",0,msgSender);  //TODO: Try to send a BS to delete the 0
		PC_Display_Message("> AT:",0,msgDate);			
		PC_Display_Message("> ON: ",0,msgTime);
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
int readLine = 0;               // Counts the lines of the message
char *GSMresponse = NULL;       // Use to grab input
char g_cInput[128];      // String input to a UART
	
	PC_Display_Message("> Started message reading", 0," ");
	while(readResponse&&(readLine<10)) {  //TODO, do not hardcode, use macro
		// Grab a line
		//UART2_GetString(g_cInput,sizeof(g_cInput));  //grabs string untill character != CR or LF
		if(UARTRxBytesAvail() > 2) UARTgets(g_cInput,sizeof(g_cInput));
		// Stop after newline
		strcpy(responseLine[readLine],g_cInput/*GSMresponse*/);
		//PC_Display_Message(">>> Line nr: ", readLine, g_cInput);
		//PC_Display_Message(">>> Line nr: ", readLine, responseLine[readLine]);
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
		PC_Display_Message("Processed line: ",activeLine,responseLine[activeLine]);
		// CASE FOR ENVELOPE (which will look like:)
		// +CMGR: "REC READ","+40712334501","","17/04/12,22:53:48+12"
		if ( strstr(responseLine[activeLine],"+CMGR:") != '\0' )  //if message received
		{
			// Start parsing
			msgEnvelope = responseLine[activeLine];
			PC_Display_Message("> Envelope is: ",0,msgEnvelope);
				
			msgSender = strtok(msgEnvelope,",");  // Go to first comma, skipping status
			msgSender = strtok(NULL,",");  // Grab the number	
			msgSender += 3;  // Skip the prefix from the phone number and qautation marks
			msgSender[10] = '\0';  // Store the number (with null terminator)
			
			msgDate = strtok(NULL,",");  // Go to next comma, skipping phonebook entry
			msgDate = strtok(NULL,",");  // Grab the date
			msgDate += 1;  //remove qautation marks
			msgDate[8] = '\0';  // Store the date (with null terminator)
			
			msgTime = strtok(NULL,",");  // Grab the time
			msgTime[8] = '\0';  // Store the time (with null terminator)
		}

		// CASE FOR MESSAGE CONTENT
		// If we already found the envelope, and the line's not blank...
		else if (( msgEnvelope != NULL) && (responseLine[activeLine] != NULL))
		{
			// ... and we haven't found any content, this is the first line.
			if (msgContent == NULL) {msgContent = responseLine[activeLine];}

			// ... otherwise, add a space and append this line.
			else if ( activeLine+2 <= lineCount ) {  //+2 because of emply line before OK and last line with OK.
				strcat(msgContent, " ");
				strcat(msgContent, responseLine[activeLine]);
			}
		}
		activeLine++; // Proceed to next line
	}
	if (msgEnvelope == NULL) { // If we didn't find an envelope, there's no message
		return false;
	}
	else { 	// Otherwise, return true.
		return true;
	}
}
//EOF

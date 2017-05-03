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
int msgCount = 0;  // Hold the int value w/count of new messages
//TODO  // (Set by UART interrupt handler)

// Data from most recent incoming message stored here
char responseLine[10][160];  // Use to store UART inputs
static char *msgContent =  NULL;  // Message content holder
static char *msgSender =   NULL;  // Message sender
static char *msgDate =     NULL;  // Message date
static char *msgTime =     NULL;  // Message time

/*-------------Local Variable Definitions-------------*/

/*-------------------Function Definitions-------------*/
void SendCommandValue(uint8_t *str, uint32_t value){
	UART2_SendString(str);
	UART2_SendUDecimal(value);
	//TODO: Try also 	UART2_SendChar(LF);
	UART2_SendChar(CR);
}

void SendCommandString(uint8_t *str1, uint8_t *str2){
	UART2_SendString(str1);
	UART2_SendString(str2);
	//TODO: Try also 	UART2_SendChar(LF);
	UART2_SendChar(CR);
}

void PowerOnGSM(void){
//  TODO: Keep GSM module reset pin in the following states to reset it.
//  digitalWrite(GSM_Power_Pin, HIGH);
//  delay(1000);
//  digitalWrite(GSM_Power_Pin, LOW);
//  delay(7000);
char uart2_dump[512] = "";
uint16_t i = 0;
uint8_t lineCount = 0;
	
	//SendCommandValue("AT+CMGF=",1);  //message format text
	UART2_SendString("AT+CMGF=1");  //message format text
	UART2_SendChar(CR);
	SysCtlDelay(Millis2Ticks(100)); //Interrupts are NOT disabled and OS is NOT stoped during delay!	
	lineCount = GSMgetResponse();
	
#if DELETE_ALL_SMS
	UART2_SendString("AT+CMGD=1,4");  //delete all messages
	UART2_SendChar(CR);
	SysCtlDelay(Millis2Ticks(100));
#endif
	
	UART2_SendString("AT+CSDH=0");  //do not show complete message header
	UART2_SendChar(CR);
	SysCtlDelay(Millis2Ticks(100));
	lineCount = GSMgetResponse();
		
	UART2_SendString("AT+CNMI=0,0,0,0,1");  //set new message indication mode
	//Messages are stored on GSM module, no indication is provided
	//AT+CMGR=1,0 will read the messages in a cyclic manner
	UART2_SendChar(CR);
	SysCtlDelay(Millis2Ticks(100));
	lineCount = GSMgetResponse();
		
/*	for(i = 0; i< 512; i++){  //Dump everything on UART2
		uart2_dump[i] = UARTCharGetNonBlocking(UART2_BASE);
		SysCtlDelay(5);
	}*/
	
	//Enable UART Interrupts
	//UART2_Init_Interrupts();
}

//*****************************************************************************
//
// PROCESS SMS FOR ENVELOPE AND CONTENT 
//
//*****************************************************************************
void GSMprocessMessage(uint8_t msgNum) {	
	bool msgPresent[4] = {0000};  // Flag to ignore deleted messages
	bool msgVerify = false;  // Flag for message error checking
	char msgErrorCheck[4][300];  // Holder for message error checking
	int lineCount=0;  // Hold the number of lines
	int oLoop;  // Counter for outside error checking loop
	int iLoop;  // Counter for inside error checking loop

	// Start message retrieval/parsing/error checking (runs simultaneously to
	// reduce calls to the SIM module).
	for ( oLoop=0; oLoop<3; oLoop++ ) {
		// Request the message and get the lines of the response (includes envelope, nulls, SIM responses)
		SendCommandValue("AT+CMGR=",msgNum);
		//SysCtlDelay(Millis2Ticks(1));
		lineCount = GSMgetResponse();
		// TODO Delay for a bit, needed when processing multiple messages (maybe?)
		//SysCtlDelay(Millis2Ticks(1));;

		// Make sure there's message content, process for envelope and content
		msgPresent[oLoop] = GSMparseMessage(lineCount);

		// If there is a message, store it, see if it matches previous retrieval loop
		if (msgPresent[oLoop])
		{
			// Store the message to one big string
			sprintf(msgErrorCheck[oLoop], "%s%s%s%s", msgSender, msgDate, msgTime, msgContent);

			// Check that string against previous copies from outer loop
			for ( iLoop = 0; iLoop < oLoop; iLoop++ ) 
			{
				if (strstr(msgErrorCheck[oLoop],msgErrorCheck[iLoop]) != NULL){

					// Set a flag to use for exiting outer loop
					msgVerify = true;

					// Exit inner loop
					break;
				}
			}
		}
		else { break; }  // If there's no message, exit retrieval loop

			if (msgVerify) { break; }  // If we verified the message, exit retrieval loop
	}

	// Show the user what we found
	PC_Display_Message("\n\r>>> MESSAGE :",msgNum," ");
	if ( msgPresent[oLoop] && msgVerify ) {
		PC_Display_Message("> FROM :",0,msgSender);  //TODO: Try to send a BS to delete the 0
		PC_Display_Message("> AT :",0,msgDate);			
		PC_Display_Message("> ON :",0,msgTime);
		PC_Display_Message("> TEXT :",0,msgContent);			
	}
	else if (!msgPresent[oLoop]) { PC_Display_Message("> NOT PRESENT!",0,"");}
	else { PC_Display_Message("> COULD NOT VERIFY! ",0," ");}

	// Delete the message
	if ( testDelete && (*msgPresent) ){  //TODO see which msgPresent is being tested
		#if DELETE_ALL_SMS
		//SendCommandValue("AT+CMGD=",msgNum);
			UART2_SendString("AT+CMGD=1,4");  //delete all messages
		#endif
		GSMgetResponse();
		PC_Display_Message(">>> MESSAGE ",msgNum," SHOULD BE DELETED");
	}
}

//*****************************************************************************
//
// STORE A GSM RESPONSE TO ARRAY responseLine[]
//
//*****************************************************************************
uint8_t GSMgetResponse(void) {
bool readResponse = true;  // Keeps the loop open while getting message
uint8_t readLine = 0;  // Counts the lines of the message
char *GSMresponse = NULL;  // Use to grab input TODO, allocate statically memory
static char g_cInput[160];  // String input to a UART
	
	PC_Display_Message("> Started message reading", 0," ");
	while(readResponse&&(readLine<10)) {  //TODO, do not hardcode, use macro
		// Grab a line
		UART2_GetString(g_cInput,sizeof(g_cInput));  //grabs string untill character != CR or LF
		// Stop after newline
		GSMresponse = strtok(g_cInput,"\n");  //TODO test what is the output of this line
		strcpy(responseLine[readLine],/*g_cInput*/ GSMresponse);
		PC_Display_Message(">>> Line nr: ", readLine, responseLine[readLine]);
		// If this line says OK we've got the whole message
		if ( strncmp(responseLine[readLine],"OK",2) == 0 ){readResponse = false;}
		else { readLine++; }
	}
	return (readLine+1);  //because [0] is first line #LOL
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
			// ... and we haven't found any content, this is the first line.
			if (msgContent == NULL) { msgContent = responseLine[activeLine]; }

			// ... otherwise, add a space and append this line.
			else if ( activeLine + 2 <= lineCount ) {  //TODO see why +2 ???
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

void GSMprocessMessageNew(uint8_t msgNum){
/*	char message[5000] = "";
	uint16_t i = 0;
	UART2_SendString("AT+CMGR=1,0");
	for(i = 0; i< 5000; i++){
		message[i] = UARTCharGetNonBlocking(UART2_BASE);
				SysCtlDelay(4);
	}
	UART0_SendString(message);
	for(i = 0; i< 5000; i++){
		message[i] = UARTCharGetNonBlocking(UART2_BASE);
				SysCtlDelay(4);
	}
	UART0_SendString(message);
	for(i = 0; i< 5000; i++){
		message[i] = UARTCharGetNonBlocking(UART2_BASE);
				SysCtlDelay(4);
	}
	UART0_SendString(message);
	for(i = 0; i< 5000; i++){
		message[i] = UARTCharGetNonBlocking(UART2_BASE);
				SysCtlDelay(4);
	}
	UART0_SendString(message);*/
}
//EOF

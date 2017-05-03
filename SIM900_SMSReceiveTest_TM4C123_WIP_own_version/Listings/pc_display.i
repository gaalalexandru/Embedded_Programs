#line 1 "pc_display.c"
 
 
#line 1 "SecSys_Config.h"




















#line 27 "SecSys_Config.h"










#line 4 "pc_display.c"
 
#line 1 "pc_display.h"



 
#line 1 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"
 






 





#line 25 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"



#line 6 "pc_display.h"
#line 1 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 7 "pc_display.h"

void PC_Display_Message(char *string1, uint32_t value, char *string2);


#line 6 "pc_display.c"
 
#line 1 "uart_handler.h"



 
#line 6 "uart_handler.h"
#line 7 "uart_handler.h"

 



#line 19 "uart_handler.h"






 

void UART0_Init(void);
void UART0_SendChar(uint8_t data);
void UART0_SendString(uint8_t *pt);
void UART0_SendUDecimal(uint32_t n);
void UART0_SendDecimal(int32_t n);
void UART0_SendFloat2(int32_t n);
void UART0_SendFloat3(int32_t n);
void UART0_SendUHex(uint32_t number);
void UART0_SendNewLine(void);
uint8_t UART0_GetChar(void);
void UART0_GetString(uint8_t *bufPt, uint16_t max);
uint32_t UART0_GetUDecimal(void);
uint32_t UART0_GetUHex(void);


void UART2_Init(void);
void UART2_SendChar(uint8_t data);
void UART2_SendString(uint8_t *pt);
void UART2_SendUDecimal(uint32_t n);
void UART2_SendDecimal(int32_t n);
void UART2_SendUHex(uint32_t number);
void UART2_SendNewLine(void);
char UART2_GetChar(void);
void UART2_GetString(char *bufPt, uint16_t max);
uint32_t UART2_GetUDecimal(void);
uint32_t UART2_GetUHex(void);


#line 8 "pc_display.c"

 

 

 
void PC_Display_Message( char *string1, uint32_t value, char *string2){
	UART0_SendString((uint8_t*)string1);  
	UART0_SendUDecimal(value);
	UART0_SendString((uint8_t*)string2);
	UART0_SendNewLine();
}


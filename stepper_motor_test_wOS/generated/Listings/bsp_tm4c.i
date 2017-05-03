#line 1 "3rd_party\\BSP_TM4C.c"




























 



























































































































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






 
#line 154 "3rd_party\\BSP_TM4C.c"
#line 1 "3rd_party\\BSP_TM4C.h"
































 




























































































































#line 170 "3rd_party\\BSP_TM4C.h"






void BSP_Button1_Init(void);








uint8_t BSP_Button1_Input(void);






void BSP_Button2_Init(void);








uint8_t BSP_Button2_Input(void);








void BSP_Joystick_Init(void);












void BSP_Joystick_Input(uint16_t *x, uint16_t *y, uint8_t *select);













void BSP_RGB_Init(uint16_t red, uint16_t green, uint16_t blue);










void BSP_RGB_Set(uint16_t red, uint16_t green, uint16_t blue);













void BSP_RGB_D_Init(int red, int green, int blue);










void BSP_RGB_D_Set(int red, int green, int blue);










void BSP_RGB_D_Toggle(int red, int green, int blue);








void BSP_Buzzer_Init(uint16_t duty);








void BSP_Buzzer_Set(uint16_t duty);







void BSP_Accelerometer_Init(void);











void BSP_Accelerometer_Input(uint16_t *x, uint16_t *y, uint16_t *z);






void BSP_Microphone_Init(void);









void BSP_Microphone_Input(uint16_t *mic);








void BSP_LCD_Init(void);













void BSP_LCD_DrawPixel(int16_t x, int16_t y, uint16_t color);











void BSP_LCD_DrawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color);











void BSP_LCD_DrawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color);







void BSP_LCD_FillScreen(uint16_t color);











void BSP_LCD_FillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);








uint16_t BSP_LCD_Color565(uint8_t r, uint8_t g, uint8_t b);







uint16_t BSP_LCD_SwapColor(uint16_t x);





















void BSP_LCD_DrawBitmap(int16_t x, int16_t y, const uint16_t *image, int16_t w, int16_t h);

















void BSP_LCD_DrawCharS(int16_t x, int16_t y, char c, int16_t textColor, int16_t bgColor, uint8_t size);















void BSP_LCD_DrawChar(int16_t x, int16_t y, char c, int16_t textColor, int16_t bgColor, uint8_t size);












uint32_t BSP_LCD_DrawString(uint16_t x, uint16_t y, char *pt, int16_t textColor);










void BSP_LCD_SetCursor(uint32_t newX, uint32_t newY);








void BSP_LCD_OutUDec(uint32_t n, int16_t textColor);








void BSP_LCD_OutUDec4(uint32_t n, int16_t textColor);








void BSP_LCD_OutUDec5(uint32_t n, int16_t textColor);









void BSP_LCD_OutUFix2_1(uint32_t n, int16_t textColor);









void BSP_LCD_OutUHex2(uint32_t n, int16_t textColor);


















void BSP_LCD_Drawaxes(uint16_t axisColor, uint16_t bgColor, char *xLabel,
  char *yLabel1, uint16_t label1Color, char *yLabel2, uint16_t label2Color,
  int32_t ymax, int32_t ymin);












void BSP_LCD_PlotPoint(int32_t data1, uint16_t color1);









void BSP_LCD_PlotIncrement(void);










void BSP_Clock_InitFastest(void);






uint32_t BSP_Clock_GetFreq(void);











void BSP_PeriodicTask_Init(void(*task)(void), uint32_t freq, uint8_t priority);









void BSP_PeriodicTask_Stop(void);





void BSP_PeriodicTask_Restart(void);











void BSP_PeriodicTask_InitB(void(*task)(void), uint32_t freq, uint8_t priority);
 





void BSP_PeriodicTask_StopB(void);











void BSP_PeriodicTask_InitC(void(*task)(void), uint32_t freq, uint8_t priority);






void BSP_PeriodicTask_StopC(void);







void BSP_Time_Init(void);









uint32_t BSP_Time_Get(void);






void BSP_Delay1ms(uint32_t n);








void BSP_LightSensor_Init(void);








uint32_t BSP_LightSensor_Input(void);








void BSP_LightSensor_Start(void);












int BSP_LightSensor_End(uint32_t *light);









void BSP_TempSensor_Init(void);









void BSP_TempSensor_Input(int32_t *sensorV, int32_t *localT);








void BSP_TempSensor_Start(void);














int BSP_TempSensor_End(int32_t *sensorV, int32_t *localT);
#line 155 "3rd_party\\BSP_TM4C.c"
#line 1 "3rd_party\\../inc/tm4c123gh6pm.h"















































#line 77 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            
#line 127 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 141 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 155 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 186 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 217 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 248 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 279 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 296 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 313 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 330 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 347 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 372 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 397 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 422 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 447 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 472 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 497 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 522 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 547 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 576 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 605 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 634 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 663 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 694 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 725 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 817 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 909 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 926 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 943 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 976 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1009 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1042 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1075 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1108 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1141 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1174 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1207 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1271 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1335 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1350 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1393 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1436 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1469 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1502 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1535 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1568 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1755 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1787 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1819 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1851 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1883 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1915 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1947 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 1969 "3rd_party\\../inc/tm4c123gh6pm.h"
















#line 1996 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 2028 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 2175 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 2204 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

                                            







#line 2320 "3rd_party\\../inc/tm4c123gh6pm.h"









































































































                                            

                                            








#line 2456 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 2495 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 2537 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 2592 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 2623 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 2664 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 2692 "3rd_party\\../inc/tm4c123gh6pm.h"









                                            





































                                            

                                            







                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            







                                            

                                            
















                                            







#line 2810 "3rd_party\\../inc/tm4c123gh6pm.h"
























#line 2840 "3rd_party\\../inc/tm4c123gh6pm.h"






























#line 2881 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 2899 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            
#line 2913 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            













                                            



                                            

                                            



                                            








                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            






#line 3000 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            












































                                            
















#line 3075 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

























                                            








                                            









































#line 3168 "3rd_party\\../inc/tm4c123gh6pm.h"











































                                            

                                            








                                            

                                            



































































#line 3300 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 3314 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 3328 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 3340 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 3352 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 3364 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 3386 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 3424 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 3459 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            


                                            




                                            

                                            

                                            

                                            









                                            


                                            









#line 3509 "3rd_party\\../inc/tm4c123gh6pm.h"






































#line 3585 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 3629 "3rd_party\\../inc/tm4c123gh6pm.h"







































#line 3676 "3rd_party\\../inc/tm4c123gh6pm.h"















#line 3720 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            


                                            




                                            

                                            

                                            

                                            









                                            


                                            









#line 3770 "3rd_party\\../inc/tm4c123gh6pm.h"






































#line 3846 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 3890 "3rd_party\\../inc/tm4c123gh6pm.h"











































#line 3941 "3rd_party\\../inc/tm4c123gh6pm.h"















#line 3985 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            


                                            




                                            

                                            

                                            

                                            









                                            


                                            









#line 4035 "3rd_party\\../inc/tm4c123gh6pm.h"






































#line 4111 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 4155 "3rd_party\\../inc/tm4c123gh6pm.h"











































#line 4206 "3rd_party\\../inc/tm4c123gh6pm.h"















#line 4250 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            


                                            




                                            

                                            

                                            

                                            









                                            


                                            









#line 4300 "3rd_party\\../inc/tm4c123gh6pm.h"






































#line 4376 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 4420 "3rd_party\\../inc/tm4c123gh6pm.h"











































#line 4471 "3rd_party\\../inc/tm4c123gh6pm.h"

































#line 4512 "3rd_party\\../inc/tm4c123gh6pm.h"
























#line 4544 "3rd_party\\../inc/tm4c123gh6pm.h"
















#line 4568 "3rd_party\\../inc/tm4c123gh6pm.h"
















#line 4592 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 4605 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 4633 "3rd_party\\../inc/tm4c123gh6pm.h"















                                            








                                            









































                                            


                                            




























                                            
                                            

                                            
                                            
                                            

                                            
                                            







                                            

                                            

                                            




                                            


                                            












                                            

                                            

                                            




                                            


                                            













                                            
#line 4807 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            
#line 4815 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            

                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            

                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            

                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            

                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            

                                            

                                            
                                            

                                            
                                            

                                            
                                            



                                            

                                            

                                            
                                            



                                            

                                            

                                            
                                            



                                            

                                            

                                            
                                            



                                            

                                            

                                            
                                            



                                            

                                            

                                            
                                            



                                            

                                            

                                            
                                            







                                            

                                            

                                            

                                            

                                            

                                            


                                            

                                            

                                            







                                            


                                            

                                            

                                            



                                            

                                            

                                            







                                            

                                            

                                            

                                            

                                            

                                            


                                            

                                            

                                            







                                            

                                            

                                            

                                            

                                            

                                            


                                            

                                            

                                            







                                            








                                            














































                                            










                                            



















































































                                            
                                            

                                            
                                            


















                                            











                                            

                                            

                                            

                                            











                                            

                                            

                                            

                                            




















#line 5333 "3rd_party\\../inc/tm4c123gh6pm.h"

















                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            
















#line 5406 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 5418 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 5432 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            









                                            






#line 5486 "3rd_party\\../inc/tm4c123gh6pm.h"










                                            




                                            




                                            




                                            




                                            




                                            




                                            




                                            














#line 5552 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            
#line 5603 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 5617 "3rd_party\\../inc/tm4c123gh6pm.h"










                                            




                                            




                                            




                                            














#line 5663 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            









#line 5708 "3rd_party\\../inc/tm4c123gh6pm.h"










                                            




                                            




                                            




                                            














#line 5754 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            



































#line 5823 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            







                                            






#line 5861 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 5887 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 5913 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 5939 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 5965 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 5991 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 6017 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 6043 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 6069 "3rd_party\\../inc/tm4c123gh6pm.h"






















































































#line 6169 "3rd_party\\../inc/tm4c123gh6pm.h"



























                                            

                                            








































#line 6257 "3rd_party\\../inc/tm4c123gh6pm.h"













#line 6288 "3rd_party\\../inc/tm4c123gh6pm.h"
















#line 6311 "3rd_party\\../inc/tm4c123gh6pm.h"











                                            
#line 6332 "3rd_party\\../inc/tm4c123gh6pm.h"

















#line 6357 "3rd_party\\../inc/tm4c123gh6pm.h"















#line 6381 "3rd_party\\../inc/tm4c123gh6pm.h"























#line 6413 "3rd_party\\../inc/tm4c123gh6pm.h"











































#line 6467 "3rd_party\\../inc/tm4c123gh6pm.h"















































#line 6523 "3rd_party\\../inc/tm4c123gh6pm.h"











































#line 6577 "3rd_party\\../inc/tm4c123gh6pm.h"














































































































#line 6693 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 6707 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 6720 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 6734 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            






#line 6748 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 6763 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

                                            
#line 6780 "3rd_party\\../inc/tm4c123gh6pm.h"































































































#line 6886 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 6903 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 6920 "3rd_party\\../inc/tm4c123gh6pm.h"















































































































































































































































































































































































































































































#line 7396 "3rd_party\\../inc/tm4c123gh6pm.h"
















































#line 7454 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7468 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7493 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7508 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7533 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 7548 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7565 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 7580 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7604 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7618 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7643 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7658 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7683 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 7698 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7715 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 7730 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7754 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7768 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7793 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7808 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7833 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 7848 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7865 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 7880 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7904 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7918 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7943 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 7958 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 7983 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 7998 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8015 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 8030 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 8054 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8068 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 8093 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8108 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 8133 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 8148 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8165 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 8180 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 8204 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8218 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 8243 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8258 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 8283 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 8298 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8315 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 8330 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 8354 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8368 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 8393 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8408 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 8433 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 8448 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8465 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 8480 "3rd_party\\../inc/tm4c123gh6pm.h"







































































                                            

                                            

                                            

                                            

                                            

                                            

                                            








                                            

                                            

                                            

                                            

                                            

                                            

                                            






#line 8601 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            



                                            

                                            





















                                            





















                                            




































                                            







                                            














                                            






#line 8730 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 8744 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            















































                                            








































                                            
                                            
                                            

                                            
                                            


                                            






























































                                            

                                            

                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            

                                            

                                            







                                            

                                            
                                            

                                            
                                            

                                            

                                            
                                            

                                            
                                            







                                            

                                            

                                            

                                            

                                            

                                            


































                                            
#line 9021 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            


                                            








                                            

                                            

                                            








                                            

                                            

                                            

                                            







                                            


                                            

                                            




























































                                            

                                            

                                            

                                            









#line 9156 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

                                            

                                            

                                            

                                            

                                            

                                            

























































#line 9257 "3rd_party\\../inc/tm4c123gh6pm.h"








































                                            



                                            



                                            

                                            


                                            








#line 9336 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            
                                            
                                            
#line 9347 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9372 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9387 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            

                                            

                                            

                                            

                                            

                                            
#line 9416 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9442 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9479 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9502 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9522 "3rd_party\\../inc/tm4c123gh6pm.h"

















#line 9570 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9608 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 9630 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9651 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9665 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

                                            

                                            

                                            


                                            

                                            






#line 9696 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            








                                            

                                            

                                            

                                            


                                            

                                            






#line 9730 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9778 "3rd_party\\../inc/tm4c123gh6pm.h"








                                            

                                            

                                            

                                            

                                            

                                            








                                            
#line 9818 "3rd_party\\../inc/tm4c123gh6pm.h"















#line 9857 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9878 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9892 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9906 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9927 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9941 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9955 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9976 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 9990 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 10006 "3rd_party\\../inc/tm4c123gh6pm.h"





























                                            

                                            

                                            







































#line 10093 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 10114 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 10136 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            







#line 10167 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 10190 "3rd_party\\../inc/tm4c123gh6pm.h"















                                            

                                            

                                            

                                            

                                            

                                            






#line 10237 "3rd_party\\../inc/tm4c123gh6pm.h"




















#line 10265 "3rd_party\\../inc/tm4c123gh6pm.h"
















#line 10287 "3rd_party\\../inc/tm4c123gh6pm.h"






























































                                            

                                            

                                            

                                            

                                            

                                            















                                            

                                            

                                            

                                            

                                            

                                            






#line 10398 "3rd_party\\../inc/tm4c123gh6pm.h"














                                            






#line 10427 "3rd_party\\../inc/tm4c123gh6pm.h"


















































                                            
































                                            

                                            

                                            

                                            

                                            

                                            







                                            

                                            








                                            

                                            

                                            

                                            

                                            

                                            








                                            

                                            

                                            

                                            

                                            

                                            







                                            







                                            








                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            







                                            







                                            

                                            







                                            

                                            








                                            







                                            

                                            







                                            

                                            








                                            








                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            







                                            

                                            








                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            








                                            

                                            

                                            

                                            

                                            

                                            







                                            







                                            








                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            







                                            







                                            

                                            







                                            

                                            








                                            







                                            

                                            







                                            

                                            








                                            








                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            







                                            

                                            








                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            








                                            

                                            

                                            

                                            

                                            

                                            







                                            







                                            








                                            

                                            

                                            

                                            

                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            







                                            

                                            

                                            

                                            







                                            







                                            

                                            







                                            

                                            








                                            
                                            







                                            

                                            







                                            

                                            








                                            








                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            

                                            
                                            







                                            

                                            







                                            

                                            

                                            

                                            

                                            

                                            






#line 11192 "3rd_party\\../inc/tm4c123gh6pm.h"














                                            






#line 11221 "3rd_party\\../inc/tm4c123gh6pm.h"


















































                                            
































                                            

                                            

                                            

                                            

                                            

                                            






#line 11334 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            
#line 11341 "3rd_party\\../inc/tm4c123gh6pm.h"






















                                            








































































































                                            

                                            













#line 11500 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11522 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11544 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11566 "3rd_party\\../inc/tm4c123gh6pm.h"






















#line 11637 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            








                                            




                                            
















































































































































































































#line 11868 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11882 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11896 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11910 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11924 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11938 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11952 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11966 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11980 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 11994 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12008 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12022 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12036 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12050 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12064 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12078 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12092 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12106 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12120 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12134 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12148 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12162 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12176 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12190 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12204 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12218 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12232 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12246 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12260 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12274 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12288 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12302 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12316 "3rd_party\\../inc/tm4c123gh6pm.h"







                                            

                                            

                                            

                                            











                                            

                                            

                                            

                                            










#line 12365 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12398 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 12427 "3rd_party\\../inc/tm4c123gh6pm.h"
















                                            

                                            










#line 12462 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 12482 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 12504 "3rd_party\\../inc/tm4c123gh6pm.h"







#line 12517 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            


                                            
#line 12527 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            

                                            
                                            


















































                                            




                                            

















































#line 12645 "3rd_party\\../inc/tm4c123gh6pm.h"

















#line 12674 "3rd_party\\../inc/tm4c123gh6pm.h"

















#line 12703 "3rd_party\\../inc/tm4c123gh6pm.h"

















#line 12732 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12744 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            
#line 12755 "3rd_party\\../inc/tm4c123gh6pm.h"






#line 12784 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 12809 "3rd_party\\../inc/tm4c123gh6pm.h"















                                            
#line 12833 "3rd_party\\../inc/tm4c123gh6pm.h"














#line 12853 "3rd_party\\../inc/tm4c123gh6pm.h"
                                            

                                            










                                            



#line 156 "3rd_party\\BSP_TM4C.c"

void DisableInterrupts(void); 
void EnableInterrupts(void);  
long StartCritical (void);    
void EndCritical(long sr);    
void WaitForInterrupt(void);  

static uint32_t ClockFrequency = 16000000; 






void BSP_Button1_Init(void){
  (*((volatile uint32_t *)0x400FE608)) |= 0x00000008; 
  while(((*((volatile uint32_t *)0x400FEA08))&0x08) == 0){};
                                   
  (*((volatile uint32_t *)0x40007528)) &= ~0x40;     
                                   
  (*((volatile uint32_t *)0x4000752C)) = ((*((volatile uint32_t *)0x4000752C))&0xF0FFFFFF)+0x00000000;
  (*((volatile uint32_t *)0x40007400)) &= ~0x40;       
  (*((volatile uint32_t *)0x40007420)) &= ~0x40;     
  (*((volatile uint32_t *)0x40007510)) &= ~0x40;       
  (*((volatile uint32_t *)0x4000751C)) |= 0x40;        
}









uint8_t BSP_Button1_Input(void){
  return (*((volatile uint32_t *)0x40007100));                  
}






void BSP_Button2_Init(void){
  (*((volatile uint32_t *)0x400FE608)) |= 0x00000008; 
  while(((*((volatile uint32_t *)0x400FEA08))&0x08) == 0){};
  (*((volatile uint32_t *)0x40007520)) = 0x4C4F434B;  
  (*((volatile uint32_t *)0x40007524)) = 0xFF;          
  (*((volatile uint32_t *)0x40007528)) &= ~0x80;     
                                   
  (*((volatile uint32_t *)0x4000752C)) = ((*((volatile uint32_t *)0x4000752C))&0x0FFFFFFF)+0x00000000;
  (*((volatile uint32_t *)0x40007400)) &= ~0x80;       
  (*((volatile uint32_t *)0x40007420)) &= ~0x80;     
  (*((volatile uint32_t *)0x40007510)) &= ~0x80;       
  (*((volatile uint32_t *)0x4000751C)) |= 0x80;        
}









uint8_t BSP_Button2_Input(void){
  return (*((volatile uint32_t *)0x40007200));                  
}









void static adcinit(void){
  (*((volatile uint32_t *)0x400FE638)) |= 0x00000001;  
  while(((*((volatile uint32_t *)0x400FEA38))&0x01) == 0){};
                                   
  (*((volatile uint32_t *)0x40038FC4)) &= ~0xF;               
  (*((volatile uint32_t *)0x40038FC4)) |= 0x1;                
  (*((volatile uint32_t *)0x40038020)) = 0x3210;           
                                   
}








void BSP_Joystick_Init(void){
  (*((volatile uint32_t *)0x400FE608)) |= 0x0000001A; 
  while(((*((volatile uint32_t *)0x400FEA08))&0x1A) != 0x1A){};
                                   
  (*((volatile uint32_t *)0x40024528)) &= ~0x10;     
  (*((volatile uint32_t *)0x40007528)) |= 0x08;      
  (*((volatile uint32_t *)0x40005528)) |= 0x20;      
                                   
  (*((volatile uint32_t *)0x4002452C)) = ((*((volatile uint32_t *)0x4002452C))&0xFFF0FFFF)+0x00000000;
  (*((volatile uint32_t *)0x40024400)) &= ~0x10;       
  (*((volatile uint32_t *)0x40007400)) &= ~0x08;       
  (*((volatile uint32_t *)0x40005400)) &= ~0x20;       
  (*((volatile uint32_t *)0x40024420)) &= ~0x10;     
  (*((volatile uint32_t *)0x40007420)) |= 0x08;      
  (*((volatile uint32_t *)0x40005420)) |= 0x20;      
  (*((volatile uint32_t *)0x4002451C)) |= 0x10;        
  (*((volatile uint32_t *)0x4000751C)) &= ~0x08;       
  (*((volatile uint32_t *)0x4000551C)) &= ~0x20;       
  adcinit();                       
  (*((volatile uint32_t *)0x40038000)) &= ~0x0002;         
  (*((volatile uint32_t *)0x40038014)) &= ~0x00F0;          
  (*((volatile uint32_t *)0x40038060)) = 0x004B;          
  (*((volatile uint32_t *)0x40038064)) = 0x0060;          
  (*((volatile uint32_t *)0x40038008)) &= ~0x0002;            
  (*((volatile uint32_t *)0x40038000)) |= 0x0002;          
}













void BSP_Joystick_Input(uint16_t *x, uint16_t *y, uint8_t *select){
  (*((volatile uint32_t *)0x40038028)) = 0x0002;            
  while(((*((volatile uint32_t *)0x40038004))&0x02)==0){};   
  *x = (*((volatile uint32_t *)0x40038068))>>2;          
  *y = (*((volatile uint32_t *)0x40038068))>>2;          
  *select = (*((volatile uint32_t *)0x40024040));                
  (*((volatile uint32_t *)0x4003800C)) = 0x0002;             
}













static uint16_t PWMCycles;         
void BSP_RGB_Init(uint16_t red, uint16_t green, uint16_t blue){
  if((red > 1023) || (green > 1023) || (blue > 1023)){
    return;                        
  }
  
  (*((volatile uint32_t *)0x400FE604)) |= 0x02;      
  (*((volatile uint32_t *)0x400FE608)) |= 0x0020;     
  while(((*((volatile uint32_t *)0x400FEA08))&0x20) == 0){};
  (*((volatile uint32_t *)0x40025420)) |= 0x08;      
  (*((volatile uint32_t *)0x4002551C)) |= 0x08;        
                                   
  (*((volatile uint32_t *)0x4002552C)) = ((*((volatile uint32_t *)0x4002552C))&0xFFFF0FFF)+0x00007000;
  (*((volatile uint32_t *)0x40025528)) &= ~0x08;     
  while(((*((volatile uint32_t *)0x400FEA04))&0x02) == 0){};
  (*((volatile uint32_t *)0x4003100C)) &= ~0x00000100; 
  (*((volatile uint32_t *)0x40031000)) = 0x00000004; 
                                   
  (*((volatile uint32_t *)0x40031008)) = (0x00000008|0x00000002);
  PWMCycles = ClockFrequency/2048;
  (*((volatile uint32_t *)0x4003102C)) = PWMCycles - 1;  
  (*((volatile uint32_t *)0x40031034)) = (red*PWMCycles)>>10;
                                   
  (*((volatile uint32_t *)0x4003100C)) |= (0x00004000|0x00000100);
  
  (*((volatile uint32_t *)0x400FE604)) |= 0x08;      
  (*((volatile uint32_t *)0x400FE608)) |= 0x0002;     
  while(((*((volatile uint32_t *)0x400FEA08))&0x02) == 0){};
  (*((volatile uint32_t *)0x40005420)) |= 0x08;      
  (*((volatile uint32_t *)0x4000551C)) |= 0x08;        
                                   
  (*((volatile uint32_t *)0x4000552C)) = ((*((volatile uint32_t *)0x4000552C))&0xFFFF0FFF)+0x00007000;
  (*((volatile uint32_t *)0x40005528)) &= ~0x08;     
  while(((*((volatile uint32_t *)0x400FEA04))&0x08) == 0){};
  (*((volatile uint32_t *)0x4003300C)) &= ~0x00000100; 
  (*((volatile uint32_t *)0x40033000)) = 0x00000004; 
                                   
  (*((volatile uint32_t *)0x40033008)) = (0x00000008|0x00000002);
  (*((volatile uint32_t *)0x4003302C)) = PWMCycles - 1;  
  (*((volatile uint32_t *)0x40033034)) = (green*PWMCycles)>>10;
                                   
  (*((volatile uint32_t *)0x4003300C)) |= (0x00004000|0x00000100);
  
  (*((volatile uint32_t *)0x400FE65C)) |= 0x01;     
  (*((volatile uint32_t *)0x400FE608)) |= 0x0004;     
  while(((*((volatile uint32_t *)0x400FEA08))&0x04) == 0){};
  (*((volatile uint32_t *)0x40006420)) |= 0x10;      
  (*((volatile uint32_t *)0x4000651C)) |= 0x10;        
                                   
  (*((volatile uint32_t *)0x4000652C)) = ((*((volatile uint32_t *)0x4000652C))&0xFFF0FFFF)+0x00070000;
  (*((volatile uint32_t *)0x40006528)) &= ~0x10;     
  while(((*((volatile uint32_t *)0x400FEA5C))&0x01) == 0){};
  (*((volatile uint32_t *)0x4003600C)) &= ~0x00000001;
  (*((volatile uint32_t *)0x40036000)) = 0x00000004;
                                   
  (*((volatile uint32_t *)0x40036004)) = (0x00000008|0x00000002);
  (*((volatile uint32_t *)0x40036028)) = PWMCycles - 1; 
  (*((volatile uint32_t *)0x40036030)) = (blue*PWMCycles)>>10;
                                   
  (*((volatile uint32_t *)0x4003600C)) |= (0x00000040|0x00000001);
}










void BSP_RGB_Set(uint16_t red, uint16_t green, uint16_t blue){
  if((red > 1023) || (green > 1023) || (blue > 1023)){
    return;                        
  }
  (*((volatile uint32_t *)0x40031034)) = (red*PWMCycles)>>10;
  (*((volatile uint32_t *)0x40033034)) = (green*PWMCycles)>>10;
  (*((volatile uint32_t *)0x40036030)) = (blue*PWMCycles)>>10;
}
















void BSP_RGB_D_Init(int red, int green, int blue){
  (*((volatile uint32_t *)0x400FE608)) |= 0x00000026; 
  while(((*((volatile uint32_t *)0x400FEA08))&0x26) != 0x26){};
                                   
  (*((volatile uint32_t *)0x40025528)) &= ~0x08;     
  (*((volatile uint32_t *)0x40006528)) &= ~0x10;     
  (*((volatile uint32_t *)0x40005528)) &= ~0x08;     
                                   
  (*((volatile uint32_t *)0x4002552C)) = ((*((volatile uint32_t *)0x4002552C))&0xFFFF0FFF)+0x00000000;
                                   
  (*((volatile uint32_t *)0x4000652C)) = ((*((volatile uint32_t *)0x4000652C))&0xFFF0FFFF)+0x00000000;
                                   
  (*((volatile uint32_t *)0x4000552C)) = ((*((volatile uint32_t *)0x4000552C))&0xFFFF0FFF)+0x00000000;
  (*((volatile uint32_t *)0x40025400)) |= 0x08;        
  (*((volatile uint32_t *)0x40006400)) |= 0x10;        
  (*((volatile uint32_t *)0x40005400)) |= 0x08;        
  (*((volatile uint32_t *)0x40025420)) &= ~0x08;     
  (*((volatile uint32_t *)0x40006420)) &= ~0x10;     
  (*((volatile uint32_t *)0x40005420)) &= ~0x08;     
  (*((volatile uint32_t *)0x40025510)) &= ~0x08;       
  (*((volatile uint32_t *)0x40006510)) &= ~0x10;       
  (*((volatile uint32_t *)0x40005510)) &= ~0x08;       
  (*((volatile uint32_t *)0x4002551C)) |= 0x08;        
  (*((volatile uint32_t *)0x4000651C)) |= 0x10;        
  (*((volatile uint32_t *)0x4000551C)) |= 0x08;        
  BSP_RGB_D_Set(red, green, blue);
}










void BSP_RGB_D_Set(int red, int green, int blue){
  if(red){
    (*((volatile uint32_t *)0x40025020)) = 0x08;
  } else{
    (*((volatile uint32_t *)0x40025020)) = 0x00;
  }
  if(green){
    (*((volatile uint32_t *)0x40005020)) = 0x08;
  } else{
    (*((volatile uint32_t *)0x40005020)) = 0x00;
  }
  if(blue){
    (*((volatile uint32_t *)0x40006040)) = 0x10;
  } else{
    (*((volatile uint32_t *)0x40006040)) = 0x00;
  }
}










void BSP_RGB_D_Toggle(int red, int green, int blue){
  if(red){
    (*((volatile uint32_t *)0x40025020)) = (*((volatile uint32_t *)0x40025020))^0x08;
  }
  if(green){
    (*((volatile uint32_t *)0x40005020)) = (*((volatile uint32_t *)0x40005020))^0x08;
  }
  if(blue){
    (*((volatile uint32_t *)0x40006040)) = (*((volatile uint32_t *)0x40006040))^0x10;
  }
}








void BSP_Buzzer_Init(uint16_t duty){
  if(duty > 1023){
    return;                        
  }
  
  (*((volatile uint32_t *)0x400FE604)) |= 0x02;      
  (*((volatile uint32_t *)0x400FE608)) |= 0x0020;     
  while(((*((volatile uint32_t *)0x400FEA08))&0x20) == 0){};
  (*((volatile uint32_t *)0x40025420)) |= 0x04;      
  (*((volatile uint32_t *)0x4002551C)) |= 0x04;        
                                   
  (*((volatile uint32_t *)0x4002552C)) = ((*((volatile uint32_t *)0x4002552C))&0xFFFFF0FF)+0x00000700;
  (*((volatile uint32_t *)0x40025528)) &= ~0x04;     
  while(((*((volatile uint32_t *)0x400FEA04))&0x02) == 0){};
  (*((volatile uint32_t *)0x4003100C)) &= ~0x00000001; 
  (*((volatile uint32_t *)0x40031000)) = 0x00000004; 
                                   
  (*((volatile uint32_t *)0x40031004)) = (0x00000008|0x00000002);
  PWMCycles = ClockFrequency/2048;
  (*((volatile uint32_t *)0x40031028)) = PWMCycles - 1;  
  (*((volatile uint32_t *)0x40031030)) = (duty*PWMCycles)>>10;
                                   
  (*((volatile uint32_t *)0x4003100C)) |= (0x00000040|0x00000001);
}








void BSP_Buzzer_Set(uint16_t duty){
  if(duty > 1023){
    return;                        
  }
  (*((volatile uint32_t *)0x40031030)) = (duty*PWMCycles)>>10;
}







void BSP_Accelerometer_Init(void){
  adcinit();
  (*((volatile uint32_t *)0x400FE608)) |= 0x00000008; 
  while(((*((volatile uint32_t *)0x400FEA08))&0x08) == 0){};
                                   
  (*((volatile uint32_t *)0x40007528)) |= 0x07;      
                                   
  (*((volatile uint32_t *)0x40007400)) &= ~0x07;       
  (*((volatile uint32_t *)0x40007420)) |= 0x07;      
  (*((volatile uint32_t *)0x4000751C)) &= ~0x07;       
  adcinit();                       
  (*((volatile uint32_t *)0x40038000)) &= ~0x0004;         
  (*((volatile uint32_t *)0x40038014)) &= ~0x0F00;          
  (*((volatile uint32_t *)0x40038080)) = 0x0567;          
  (*((volatile uint32_t *)0x40038084)) = 0x0600;          
  (*((volatile uint32_t *)0x40038008)) &= ~0x0004;            
  (*((volatile uint32_t *)0x40038000)) |= 0x0004;          
}











void BSP_Accelerometer_Input(uint16_t *x, uint16_t *y, uint16_t *z){
  (*((volatile uint32_t *)0x40038028)) = 0x0004;            
  while(((*((volatile uint32_t *)0x40038004))&0x04)==0){};   
  *x = (*((volatile uint32_t *)0x40038088))>>2;          
  *y = (*((volatile uint32_t *)0x40038088))>>2;          
  *z = (*((volatile uint32_t *)0x40038088))>>2;          
  (*((volatile uint32_t *)0x4003800C)) = 0x0004;             
}






void BSP_Microphone_Init(void){
  adcinit();
  (*((volatile uint32_t *)0x400FE608)) |= 0x00000010; 
  while(((*((volatile uint32_t *)0x400FEA08))&0x10) == 0){};
                                   
  (*((volatile uint32_t *)0x40024528)) |= 0x20;      
                                   
  (*((volatile uint32_t *)0x40024400)) &= ~0x20;       
  (*((volatile uint32_t *)0x40024420)) |= 0x20;      
  (*((volatile uint32_t *)0x4002451C)) &= ~0x20;       
  adcinit();                       
  (*((volatile uint32_t *)0x40038000)) &= ~0x0008;         
  (*((volatile uint32_t *)0x40038014)) &= ~0xF000;          
  (*((volatile uint32_t *)0x400380A0)) = 0x0008;          
  (*((volatile uint32_t *)0x400380A4)) = 0x0006;          
  (*((volatile uint32_t *)0x40038008)) &= ~0x0008;            
  (*((volatile uint32_t *)0x40038000)) |= 0x0008;          
}









void BSP_Microphone_Input(uint16_t *mic){
  (*((volatile uint32_t *)0x40038028)) = 0x0008;            
  while(((*((volatile uint32_t *)0x40038004))&0x08)==0){};   
  *mic = (*((volatile uint32_t *)0x400380A8))>>2;        
  (*((volatile uint32_t *)0x4003800C)) = 0x0008;             
}

 
 
 





















 

enum initRFlags{
  none,
  INITR_GREENTAB,
  INITR_REDTAB,
  INITR_BLACKTAB
};






#line 657 "3rd_party\\BSP_TM4C.c"




uint32_t StX=0; 
uint32_t StY=0; 
uint16_t StTextColor = 0xFFE0;











#line 683 "3rd_party\\BSP_TM4C.c"











#line 700 "3rd_party\\BSP_TM4C.c"











#line 720 "3rd_party\\BSP_TM4C.c"



static const uint8_t Font[] = {
  0x00, 0x00, 0x00, 0x00, 0x00,
  0x3E, 0x5B, 0x4F, 0x5B, 0x3E,
  0x3E, 0x6B, 0x4F, 0x6B, 0x3E,
  0x1C, 0x3E, 0x7C, 0x3E, 0x1C,
  0x18, 0x3C, 0x7E, 0x3C, 0x18,
  0x1C, 0x57, 0x7D, 0x57, 0x1C,
  0x1C, 0x5E, 0x7F, 0x5E, 0x1C,
  0x00, 0x18, 0x3C, 0x18, 0x00,
  0xFF, 0xE7, 0xC3, 0xE7, 0xFF,
  0x00, 0x18, 0x24, 0x18, 0x00,
  0xFF, 0xE7, 0xDB, 0xE7, 0xFF,
  0x30, 0x48, 0x3A, 0x06, 0x0E,
  0x26, 0x29, 0x79, 0x29, 0x26,
  0x40, 0x7F, 0x05, 0x05, 0x07,
  0x40, 0x7F, 0x05, 0x25, 0x3F,
  0x5A, 0x3C, 0xE7, 0x3C, 0x5A,
  0x7F, 0x3E, 0x1C, 0x1C, 0x08,
  0x08, 0x1C, 0x1C, 0x3E, 0x7F,
  0x14, 0x22, 0x7F, 0x22, 0x14,
  0x5F, 0x5F, 0x00, 0x5F, 0x5F,
  0x06, 0x09, 0x7F, 0x01, 0x7F,
  0x00, 0x66, 0x89, 0x95, 0x6A,
  0x60, 0x60, 0x60, 0x60, 0x60,
  0x94, 0xA2, 0xFF, 0xA2, 0x94,
  0x08, 0x04, 0x7E, 0x04, 0x08,
  0x10, 0x20, 0x7E, 0x20, 0x10,
  0x08, 0x08, 0x2A, 0x1C, 0x08,
  0x08, 0x1C, 0x2A, 0x08, 0x08,
  0x1E, 0x10, 0x10, 0x10, 0x10,
  0x0C, 0x1E, 0x0C, 0x1E, 0x0C,
  0x30, 0x38, 0x3E, 0x38, 0x30,
  0x06, 0x0E, 0x3E, 0x0E, 0x06,
  0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x5F, 0x00, 0x00,
  0x00, 0x07, 0x00, 0x07, 0x00,
  0x14, 0x7F, 0x14, 0x7F, 0x14,
  0x24, 0x2A, 0x7F, 0x2A, 0x12,
  0x23, 0x13, 0x08, 0x64, 0x62,
  0x36, 0x49, 0x56, 0x20, 0x50,
  0x00, 0x08, 0x07, 0x03, 0x00,
  0x00, 0x1C, 0x22, 0x41, 0x00,
  0x00, 0x41, 0x22, 0x1C, 0x00,
  0x2A, 0x1C, 0x7F, 0x1C, 0x2A,
  0x08, 0x08, 0x3E, 0x08, 0x08,
  0x00, 0x80, 0x70, 0x30, 0x00,
  0x08, 0x08, 0x08, 0x08, 0x08,
  0x00, 0x00, 0x60, 0x60, 0x00,
  0x20, 0x10, 0x08, 0x04, 0x02,
  0x3E, 0x51, 0x49, 0x45, 0x3E, 
  0x00, 0x42, 0x7F, 0x40, 0x00, 
  0x72, 0x49, 0x49, 0x49, 0x46, 
  0x21, 0x41, 0x49, 0x4D, 0x33, 
  0x18, 0x14, 0x12, 0x7F, 0x10, 
  0x27, 0x45, 0x45, 0x45, 0x39, 
  0x3C, 0x4A, 0x49, 0x49, 0x31, 
  0x41, 0x21, 0x11, 0x09, 0x07, 
  0x36, 0x49, 0x49, 0x49, 0x36, 
  0x46, 0x49, 0x49, 0x29, 0x1E, 
  0x00, 0x00, 0x14, 0x00, 0x00,
  0x00, 0x40, 0x34, 0x00, 0x00,
  0x00, 0x08, 0x14, 0x22, 0x41,
  0x14, 0x14, 0x14, 0x14, 0x14,
  0x00, 0x41, 0x22, 0x14, 0x08,
  0x02, 0x01, 0x59, 0x09, 0x06,
  0x3E, 0x41, 0x5D, 0x59, 0x4E,
  0x7C, 0x12, 0x11, 0x12, 0x7C, 
  0x7F, 0x49, 0x49, 0x49, 0x36, 
  0x3E, 0x41, 0x41, 0x41, 0x22, 
  0x7F, 0x41, 0x41, 0x41, 0x3E, 
  0x7F, 0x49, 0x49, 0x49, 0x41, 
  0x7F, 0x09, 0x09, 0x09, 0x01, 
  0x3E, 0x41, 0x41, 0x51, 0x73, 
  0x7F, 0x08, 0x08, 0x08, 0x7F, 
  0x00, 0x41, 0x7F, 0x41, 0x00, 
  0x20, 0x40, 0x41, 0x3F, 0x01, 
  0x7F, 0x08, 0x14, 0x22, 0x41, 
  0x7F, 0x40, 0x40, 0x40, 0x40, 
  0x7F, 0x02, 0x1C, 0x02, 0x7F, 
  0x7F, 0x04, 0x08, 0x10, 0x7F, 
  0x3E, 0x41, 0x41, 0x41, 0x3E, 
  0x7F, 0x09, 0x09, 0x09, 0x06, 
  0x3E, 0x41, 0x51, 0x21, 0x5E, 
  0x7F, 0x09, 0x19, 0x29, 0x46, 
  0x26, 0x49, 0x49, 0x49, 0x32, 
  0x03, 0x01, 0x7F, 0x01, 0x03, 
  0x3F, 0x40, 0x40, 0x40, 0x3F, 
  0x1F, 0x20, 0x40, 0x20, 0x1F, 
  0x3F, 0x40, 0x38, 0x40, 0x3F, 
  0x63, 0x14, 0x08, 0x14, 0x63, 
  0x03, 0x04, 0x78, 0x04, 0x03, 
  0x61, 0x59, 0x49, 0x4D, 0x43, 
  0x00, 0x7F, 0x41, 0x41, 0x41,
  0x02, 0x04, 0x08, 0x10, 0x20,
  0x00, 0x41, 0x41, 0x41, 0x7F,
  0x04, 0x02, 0x01, 0x02, 0x04,
  0x40, 0x40, 0x40, 0x40, 0x40,
  0x00, 0x03, 0x07, 0x08, 0x00,
  0x20, 0x54, 0x54, 0x78, 0x40, 
  0x7F, 0x28, 0x44, 0x44, 0x38, 
  0x38, 0x44, 0x44, 0x44, 0x28, 
  0x38, 0x44, 0x44, 0x28, 0x7F, 
  0x38, 0x54, 0x54, 0x54, 0x18, 
  0x00, 0x08, 0x7E, 0x09, 0x02, 
  0x18, 0xA4, 0xA4, 0x9C, 0x78, 
  0x7F, 0x08, 0x04, 0x04, 0x78, 
  0x00, 0x44, 0x7D, 0x40, 0x00, 
  0x20, 0x40, 0x40, 0x3D, 0x00, 
  0x7F, 0x10, 0x28, 0x44, 0x00, 
  0x00, 0x41, 0x7F, 0x40, 0x00, 
  0x7C, 0x04, 0x78, 0x04, 0x78, 
  0x7C, 0x08, 0x04, 0x04, 0x78, 
  0x38, 0x44, 0x44, 0x44, 0x38, 
  0xFC, 0x18, 0x24, 0x24, 0x18, 
  0x18, 0x24, 0x24, 0x18, 0xFC, 
  0x7C, 0x08, 0x04, 0x04, 0x08, 
  0x48, 0x54, 0x54, 0x54, 0x24, 
  0x04, 0x04, 0x3F, 0x44, 0x24, 
  0x3C, 0x40, 0x40, 0x20, 0x7C, 
  0x1C, 0x20, 0x40, 0x20, 0x1C, 
  0x3C, 0x40, 0x30, 0x40, 0x3C, 
  0x44, 0x28, 0x10, 0x28, 0x44, 
  0x4C, 0x90, 0x90, 0x90, 0x7C, 
  0x44, 0x64, 0x54, 0x4C, 0x44, 
  0x00, 0x08, 0x36, 0x41, 0x00,
  0x00, 0x00, 0x77, 0x00, 0x00,
  0x00, 0x41, 0x36, 0x08, 0x00,
  0x02, 0x01, 0x02, 0x04, 0x02,
  0x3C, 0x26, 0x23, 0x26, 0x3C,
  0x1E, 0xA1, 0xA1, 0x61, 0x12,
  0x3A, 0x40, 0x40, 0x20, 0x7A,
  0x38, 0x54, 0x54, 0x55, 0x59,
  0x21, 0x55, 0x55, 0x79, 0x41,
  0x21, 0x54, 0x54, 0x78, 0x41,
  0x21, 0x55, 0x54, 0x78, 0x40,
  0x20, 0x54, 0x55, 0x79, 0x40,
  0x0C, 0x1E, 0x52, 0x72, 0x12,
  0x39, 0x55, 0x55, 0x55, 0x59,
  0x39, 0x54, 0x54, 0x54, 0x59,
  0x39, 0x55, 0x54, 0x54, 0x58,
  0x00, 0x00, 0x45, 0x7C, 0x41,
  0x00, 0x02, 0x45, 0x7D, 0x42,
  0x00, 0x01, 0x45, 0x7C, 0x40,
  0xF0, 0x29, 0x24, 0x29, 0xF0,
  0xF0, 0x28, 0x25, 0x28, 0xF0,
  0x7C, 0x54, 0x55, 0x45, 0x00,
  0x20, 0x54, 0x54, 0x7C, 0x54,
  0x7C, 0x0A, 0x09, 0x7F, 0x49,
  0x32, 0x49, 0x49, 0x49, 0x32,
  0x32, 0x48, 0x48, 0x48, 0x32,
  0x32, 0x4A, 0x48, 0x48, 0x30,
  0x3A, 0x41, 0x41, 0x21, 0x7A,
  0x3A, 0x42, 0x40, 0x20, 0x78,
  0x00, 0x9D, 0xA0, 0xA0, 0x7D,
  0x39, 0x44, 0x44, 0x44, 0x39,
  0x3D, 0x40, 0x40, 0x40, 0x3D,
  0x3C, 0x24, 0xFF, 0x24, 0x24,
  0x48, 0x7E, 0x49, 0x43, 0x66,
  0x2B, 0x2F, 0xFC, 0x2F, 0x2B,
  0xFF, 0x09, 0x29, 0xF6, 0x20,
  0xC0, 0x88, 0x7E, 0x09, 0x03,
  0x20, 0x54, 0x54, 0x79, 0x41,
  0x00, 0x00, 0x44, 0x7D, 0x41,
  0x30, 0x48, 0x48, 0x4A, 0x32,
  0x38, 0x40, 0x40, 0x22, 0x7A,
  0x00, 0x7A, 0x0A, 0x0A, 0x72,
  0x7D, 0x0D, 0x19, 0x31, 0x7D,
  0x26, 0x29, 0x29, 0x2F, 0x28,
  0x26, 0x29, 0x29, 0x29, 0x26,
  0x30, 0x48, 0x4D, 0x40, 0x20,
  0x38, 0x08, 0x08, 0x08, 0x08,
  0x08, 0x08, 0x08, 0x08, 0x38,
  0x2F, 0x10, 0xC8, 0xAC, 0xBA,
  0x2F, 0x10, 0x28, 0x34, 0xFA,
  0x00, 0x00, 0x7B, 0x00, 0x00,
  0x08, 0x14, 0x2A, 0x14, 0x22,
  0x22, 0x14, 0x2A, 0x14, 0x08,
  0xAA, 0x00, 0x55, 0x00, 0xAA,
  0xAA, 0x55, 0xAA, 0x55, 0xAA,
  0x00, 0x00, 0x00, 0xFF, 0x00,
  0x10, 0x10, 0x10, 0xFF, 0x00,
  0x14, 0x14, 0x14, 0xFF, 0x00,
  0x10, 0x10, 0xFF, 0x00, 0xFF,
  0x10, 0x10, 0xF0, 0x10, 0xF0,
  0x14, 0x14, 0x14, 0xFC, 0x00,
  0x14, 0x14, 0xF7, 0x00, 0xFF,
  0x00, 0x00, 0xFF, 0x00, 0xFF,
  0x14, 0x14, 0xF4, 0x04, 0xFC,
  0x14, 0x14, 0x17, 0x10, 0x1F,
  0x10, 0x10, 0x1F, 0x10, 0x1F,
  0x14, 0x14, 0x14, 0x1F, 0x00,
  0x10, 0x10, 0x10, 0xF0, 0x00,
  0x00, 0x00, 0x00, 0x1F, 0x10,
  0x10, 0x10, 0x10, 0x1F, 0x10,
  0x10, 0x10, 0x10, 0xF0, 0x10,
  0x00, 0x00, 0x00, 0xFF, 0x10,
  0x10, 0x10, 0x10, 0x10, 0x10,
  0x10, 0x10, 0x10, 0xFF, 0x10,
  0x00, 0x00, 0x00, 0xFF, 0x14,
  0x00, 0x00, 0xFF, 0x00, 0xFF,
  0x00, 0x00, 0x1F, 0x10, 0x17,
  0x00, 0x00, 0xFC, 0x04, 0xF4,
  0x14, 0x14, 0x17, 0x10, 0x17,
  0x14, 0x14, 0xF4, 0x04, 0xF4,
  0x00, 0x00, 0xFF, 0x00, 0xF7,
  0x14, 0x14, 0x14, 0x14, 0x14,
  0x14, 0x14, 0xF7, 0x00, 0xF7,
  0x14, 0x14, 0x14, 0x17, 0x14,
  0x10, 0x10, 0x1F, 0x10, 0x1F,
  0x14, 0x14, 0x14, 0xF4, 0x14,
  0x10, 0x10, 0xF0, 0x10, 0xF0,
  0x00, 0x00, 0x1F, 0x10, 0x1F,
  0x00, 0x00, 0x00, 0x1F, 0x14,
  0x00, 0x00, 0x00, 0xFC, 0x14,
  0x00, 0x00, 0xF0, 0x10, 0xF0,
  0x10, 0x10, 0xFF, 0x10, 0xFF,
  0x14, 0x14, 0x14, 0xFF, 0x14,
  0x10, 0x10, 0x10, 0x1F, 0x00,
  0x00, 0x00, 0x00, 0xF0, 0x10,
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xF0, 0xF0, 0xF0, 0xF0, 0xF0,
  0xFF, 0xFF, 0xFF, 0x00, 0x00,
  0x00, 0x00, 0x00, 0xFF, 0xFF,
  0x0F, 0x0F, 0x0F, 0x0F, 0x0F,
  0x38, 0x44, 0x44, 0x38, 0x44,
  0x7C, 0x2A, 0x2A, 0x3E, 0x14,
  0x7E, 0x02, 0x02, 0x06, 0x06,
  0x02, 0x7E, 0x02, 0x7E, 0x02,
  0x63, 0x55, 0x49, 0x41, 0x63,
  0x38, 0x44, 0x44, 0x3C, 0x04,
  0x40, 0x7E, 0x20, 0x1E, 0x20,
  0x06, 0x02, 0x7E, 0x02, 0x02,
  0x99, 0xA5, 0xE7, 0xA5, 0x99,
  0x1C, 0x2A, 0x49, 0x2A, 0x1C,
  0x4C, 0x72, 0x01, 0x72, 0x4C,
  0x30, 0x4A, 0x4D, 0x4D, 0x30,
  0x30, 0x48, 0x78, 0x48, 0x30,
  0xBC, 0x62, 0x5A, 0x46, 0x3D,
  0x3E, 0x49, 0x49, 0x49, 0x00,
  0x7E, 0x01, 0x01, 0x01, 0x7E,
  0x2A, 0x2A, 0x2A, 0x2A, 0x2A,
  0x44, 0x44, 0x5F, 0x44, 0x44,
  0x40, 0x51, 0x4A, 0x44, 0x40,
  0x40, 0x44, 0x4A, 0x51, 0x40,
  0x00, 0x00, 0xFF, 0x01, 0x03,
  0xE0, 0x80, 0xFF, 0x00, 0x00,
  0x08, 0x08, 0x6B, 0x6B, 0x08,
  0x36, 0x12, 0x36, 0x24, 0x36,
  0x06, 0x0F, 0x09, 0x0F, 0x06,
  0x00, 0x00, 0x18, 0x18, 0x00,
  0x00, 0x00, 0x10, 0x10, 0x00,
  0x30, 0x40, 0xFF, 0x01, 0x01,
  0x00, 0x1F, 0x01, 0x01, 0x1E,
  0x00, 0x19, 0x1D, 0x17, 0x12,
  0x00, 0x3C, 0x3C, 0x3C, 0x3C,
  0x00, 0x00, 0x00, 0x00, 0x00,
};


static uint8_t ColStart, RowStart; 


static int16_t _width = 128;   
static int16_t _height = 128;
























uint8_t static writecommand(uint8_t c) {
                                        
  while(((*((volatile uint32_t *)0x4000A00C))&0x00000010)==0x00000010){};
  (*((volatile uint32_t *)0x40004040)) = 0x00;
  (*((volatile uint32_t *)0x40025040)) = 0x00;
  (*((volatile uint32_t *)0x4000A008)) = c;                        
  while(((*((volatile uint32_t *)0x4000A00C))&0x00000004)==0){};   
  (*((volatile uint32_t *)0x40004040)) = 0x10;
  return (uint8_t)(*((volatile uint32_t *)0x4000A008));            
}






uint8_t static writedata(uint8_t c) {
                                        
  while(((*((volatile uint32_t *)0x4000A00C))&0x00000010)==0x00000010){};
  (*((volatile uint32_t *)0x40004040)) = 0x00;
  (*((volatile uint32_t *)0x40025040)) = 0x10;
  (*((volatile uint32_t *)0x4000A008)) = c;                        
  while(((*((volatile uint32_t *)0x4000A00C))&0x00000004)==0){};   
  (*((volatile uint32_t *)0x40004040)) = 0x10;
  return (uint8_t)(*((volatile uint32_t *)0x4000A008));            
}





#line 1051 "3rd_party\\BSP_TM4C.c"
  
  __asm void
  parrotdelay(uint32_t ulCount)
  {
    subs    r0, #1
    bne     parrotdelay
    bx      lr
  }





































































static const uint8_t
  Rcmd1[] = {                 
    15,                       
    0x01,   0x80,  
      150,                    
    0x11 ,   0x80,  
      255,                    
    0xB1, 3      ,  
      0x01, 0x2C, 0x2D,       
    0xB2, 3      ,  
      0x01, 0x2C, 0x2D,       
    0xB3, 6      ,  
      0x01, 0x2C, 0x2D,       
      0x01, 0x2C, 0x2D,       
    0xB4 , 1      ,  
      0x07,                   
    0xC0 , 3      ,  
      0xA2,
      0x02,                   
      0x84,                   
    0xC1 , 1      ,  
      0xC5,                   
    0xC2 , 2      ,  
      0x0A,                   
      0x00,                   
    0xC3 , 2      ,  
      0x8A,                   
      0x2A,
    0xC4 , 2      ,  
      0x8A, 0xEE,
    0xC5 , 1      ,  
      0x0E,
    0x20 , 0      ,  
    0x36 , 1      ,  
      0xC8,                   
    0x3A , 1      ,  
      0x05 };                 
static const uint8_t
  Rcmd2green[] = {            
    2,                        
    0x2A  , 4      ,  
      0x00, 0x02,             
      0x00, 0x7F+0x02,        
    0x2B  , 4      ,  
      0x00, 0x01,             
      0x00, 0x7F+0x01 };      
static const uint8_t
  Rcmd2red[] = {              
    2,                        
    0x2A  , 4      ,  
      0x00, 0x00,             
      0x00, 0x7F,             
    0x2B  , 4      ,  
      0x00, 0x00,             
      0x00, 0x7F };           
static const uint8_t
  Rcmd3[] = {                 
    4,                        
    0xE0, 16      , 
      0x02, 0x1c, 0x07, 0x12,
      0x37, 0x32, 0x29, 0x2d,
      0x29, 0x25, 0x2B, 0x39,
      0x00, 0x01, 0x03, 0x10,
    0xE1, 16      , 
      0x03, 0x1d, 0x07, 0x06,
      0x2E, 0x2C, 0x29, 0x2D,
      0x2E, 0x2E, 0x37, 0x3F,
      0x00, 0x00, 0x02, 0x10,
    0x13  ,    0x80, 
      10,                     
    0x29 ,    0x80, 
      100 };                  




void static commandList(const uint8_t *addr) {

  uint8_t numCommands, numArgs;
  uint16_t ms;

  numCommands = *(addr++);               
  while(numCommands--) {                 
    writecommand(*(addr++));             
    numArgs  = *(addr++);                
    ms       = numArgs & 0x80;          
    numArgs &= ~0x80;                   
    while(numArgs--) {                   
      writedata(*(addr++));              
    }

    if(ms) {
      ms = *(addr++);             
      if(ms == 255) ms = 500;     
      BSP_Delay1ms(ms);
    }
  }
}



void static commonInit(const uint8_t *cmdList) {
  ColStart  = RowStart = 0; 

  
  
  (*((volatile uint32_t *)0x400FE608)) |= 0x00000023; 
  while(((*((volatile uint32_t *)0x400FEA08))&0x23) != 0x23){};
  (*((volatile uint32_t *)0x40025520)) = 0x4C4F434B;  
  (*((volatile uint32_t *)0x40025524)) = 0x1F;          
                                   
  (*((volatile uint32_t *)0x40025528)) &= ~0x11;     
  (*((volatile uint32_t *)0x40005528)) &= ~0x90;     
  (*((volatile uint32_t *)0x40004528)) &= ~0x10;     
                                   
  (*((volatile uint32_t *)0x4002552C)) = ((*((volatile uint32_t *)0x4002552C))&0xFFF0FFF0)+0x00000000;
                                   
  (*((volatile uint32_t *)0x4000552C)) = ((*((volatile uint32_t *)0x4000552C))&0x0FF0FFFF)+0x20020000;
                                   
  (*((volatile uint32_t *)0x4000452C)) = ((*((volatile uint32_t *)0x4000452C))&0xFFF0FFFF)+0x00000000;
  (*((volatile uint32_t *)0x40025400)) |= 0x11;        
  (*((volatile uint32_t *)0x40004400)) |= 0x10;        
  (*((volatile uint32_t *)0x40025420)) &= ~0x11;     
  (*((volatile uint32_t *)0x40005420)) |= 0x90;      
  (*((volatile uint32_t *)0x40004420)) &= ~0x10;     
  (*((volatile uint32_t *)0x4002551C)) |= 0x11;        
  (*((volatile uint32_t *)0x4000551C)) |= 0x90;        
  (*((volatile uint32_t *)0x4000451C)) |= 0x10;        
  (*((volatile uint32_t *)0x40004040)) = 0x00;
  (*((volatile uint32_t *)0x40025004)) = 0x01;
  BSP_Delay1ms(500);
  (*((volatile uint32_t *)0x40025004)) = 0x00;
  BSP_Delay1ms(500);
  (*((volatile uint32_t *)0x40025004)) = 0x01;
  BSP_Delay1ms(500);
  (*((volatile uint32_t *)0x40004040)) = 0x10;

  
                                        
  (*((volatile uint32_t *)0x400FE61C)) |= 0x00000004;
                                        
  while(((*((volatile uint32_t *)0x400FEA1C))&0x00000004) == 0){};
  (*((volatile uint32_t *)0x4000A004)) &= ~0x00000002;           
  (*((volatile uint32_t *)0x4000A004)) &= ~0x00000004;            
                                        
  (*((volatile uint32_t *)0x4000AFC8)) = ((*((volatile uint32_t *)0x4000AFC8))&~0x0000000F)+0x00000005;
                                        
                                        
                                        
  (*((volatile uint32_t *)0x4000A010)) = ((*((volatile uint32_t *)0x4000A010))&~0x000000FF)+4; 
  (*((volatile uint32_t *)0x4000A000)) &= ~(0x0000FF00 |       
                  0x00000080 |         
                  0x00000040);         
                                        
  (*((volatile uint32_t *)0x4000A000)) = ((*((volatile uint32_t *)0x4000A000))&~0x00000030)+0x00000000;
                                        
  (*((volatile uint32_t *)0x4000A000)) = ((*((volatile uint32_t *)0x4000A000))&~0x0000000F)+0x00000007;
  (*((volatile uint32_t *)0x4000A004)) |= 0x00000002;            

  if(cmdList) commandList(cmdList);
}


















void static ST7735_InitR(enum initRFlags option) {
  commonInit(Rcmd1);
  if(option == INITR_GREENTAB) {
    commandList(Rcmd2green);
    ColStart = 2;
    RowStart = 3;
  } else {
    
    commandList(Rcmd2red);
  }
  commandList(Rcmd3);

  
  if (option == INITR_BLACKTAB) {
    writecommand(0x36);
    writedata(0xC0);
  }

  BSP_LCD_SetCursor(0,0);
  StTextColor = 0xFFE0;
  BSP_LCD_FillScreen(0);                
}








void BSP_LCD_Init(void){
  ST7735_InitR(INITR_GREENTAB);
}






void static setAddrWindow(uint8_t x0, uint8_t y0, uint8_t x1, uint8_t y1) {

  writecommand(0x2A); 
  writedata(0x00);
  writedata(x0+ColStart);     
  writedata(0x00);
  writedata(x1+ColStart);     

  writecommand(0x2B); 
  writedata(0x00);
  writedata(y0+RowStart);     
  writedata(0x00);
  writedata(y1+RowStart);     

  writecommand(0x2C); 
}




void static pushColor(uint16_t color) {
  writedata((uint8_t)(color >> 8));
  writedata((uint8_t)color);
}













void BSP_LCD_DrawPixel(int16_t x, int16_t y, uint16_t color) {

  if((x < 0) || (x >= _width) || (y < 0) || (y >= _height)) return;


  setAddrWindow(x,y,x,y);

  pushColor(color);
}











void BSP_LCD_DrawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color) {
  uint8_t hi = color >> 8, lo = color;

  
  if((x >= _width) || (y >= _height)) return;
  if((y+h-1) >= _height) h = _height-y;
  setAddrWindow(x, y, x, y+h-1);

  while (h--) {
    writedata(hi);
    writedata(lo);
  }
}











void BSP_LCD_DrawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color) {
  uint8_t hi = color >> 8, lo = color;

  
  if((x >= _width) || (y >= _height)) return;
  if((x+w-1) >= _width)  w = _width-x;
  setAddrWindow(x, y, x+w-1, y);

  while (w--) {
    writedata(hi);
    writedata(lo);
  }
}







void BSP_LCD_FillScreen(uint16_t color) {
  BSP_LCD_FillRect(0, 0, _width, _height, color);  

}











void BSP_LCD_FillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) {
  uint8_t hi = color >> 8, lo = color;

  
  if((x >= _width) || (y >= _height)) return;
  if((x + w - 1) >= _width)  w = _width  - x;
  if((y + h - 1) >= _height) h = _height - y;

  setAddrWindow(x, y, x+w-1, y+h-1);

  for(y=h; y>0; y--) {
    for(x=w; x>0; x--) {
      writedata(hi);
      writedata(lo);
    }
  }
}








uint16_t BSP_LCD_Color565(uint8_t r, uint8_t g, uint8_t b) {
  return ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3);
}







uint16_t BSP_LCD_SwapColor(uint16_t x) {
  return (x << 11) | (x & 0x07E0) | (x >> 11);
}





















void BSP_LCD_DrawBitmap(int16_t x, int16_t y, const uint16_t *image, int16_t w, int16_t h){
  int16_t skipC = 0;                      
  int16_t originalWidth = w;              
  int i = w*(h - 1);

  if((x >= _width) || ((y - h + 1) >= _height) || ((x + w) <= 0) || (y < 0)){
    return;                             
  }
  if((w > _width) || (h > _height)){    
    
    
    
    
    return;
  }
  if((x + w - 1) >= _width){            
    skipC = (x + w) - _width;           
    w = _width - x;
  }
  if((y - h + 1) < 0){                  
    i = i - (h - y - 1)*originalWidth;  
    h = y + 1;
  }
  if(x < 0){                            
    w = w + x;
    skipC = -1*x;                       
    i = i - x;                          
    x = 0;
  }
  if(y >= _height){                     
    h = h - (y - _height + 1);
    y = _height - 1;
  }

  setAddrWindow(x, y-h+1, x+w-1, y);

  for(y=0; y<h; y=y+1){
    for(x=0; x<w; x=x+1){
                                        
      writedata((uint8_t)(image[i] >> 8));
                                        
      writedata((uint8_t)image[i]);
      i = i + 1;                        
    }
    i = i + skipC;
    i = i - 2*originalWidth;
  }
}

















void BSP_LCD_DrawCharS(int16_t x, int16_t y, char c, int16_t textColor, int16_t bgColor, uint8_t size){
  uint8_t line; 
  int32_t i, j;
  if((x >= _width)            || 
     (y >= _height)           || 
     ((x + 6 * size - 1) < 0) || 
     ((y + 8 * size - 1) < 0))   
    return;

  for (i=0; i<6; i++ ) {
    if (i == 5)
      line = 0x0;
    else
      line = Font[(c*5)+i];
    for (j = 0; j<8; j++) {
      if (line & 0x1) {
        if (size == 1) 
          BSP_LCD_DrawPixel(x+i, y+j, textColor);
        else {  
          BSP_LCD_FillRect(x+(i*size), y+(j*size), size, size, textColor);
        }
      } else if (bgColor != textColor) {
        if (size == 1) 
          BSP_LCD_DrawPixel(x+i, y+j, bgColor);
        else {  
          BSP_LCD_FillRect(x+i*size, y+j*size, size, size, bgColor);
        }
      }
      line >>= 1;
    }
  }
}















void BSP_LCD_DrawChar(int16_t x, int16_t y, char c, int16_t textColor, int16_t bgColor, uint8_t size){
  uint8_t line; 
  int32_t col, row, i, j;
  if(((x + 6*size - 1) >= _width)  || 
     ((y + 8*size - 1) >= _height) || 
     ((x + 6*size - 1) < 0)        || 
     ((y + 8*size - 1) < 0)){         
    return;
  }

  setAddrWindow(x, y, x+6*size-1, y+8*size-1);

  line = 0x01;        
  
  for(row=0; row<8; row=row+1){
    for(i=0; i<size; i=i+1){
      
      for(col=0; col<5; col=col+1){
        if(Font[(c*5)+col]&line){
          
          for(j=0; j<size; j=j+1){
            pushColor(textColor);
          }
        } else{
          
          for(j=0; j<size; j=j+1){
            pushColor(bgColor);
          }
        }
      }
      
      for(j=0; j<size; j=j+1){
        pushColor(bgColor);
      }
    }
    line = line<<1;   
  }
}












uint32_t BSP_LCD_DrawString(uint16_t x, uint16_t y, char *pt, int16_t textColor){
  uint32_t count = 0;
  if(y>12) return 0;
  while(*pt){
    BSP_LCD_DrawChar(x*6, y*10, *pt, textColor, 0x0000, 1);
    pt++;
    x = x+1;
    if(x>20) return count;  
    count++;
  }
  return count;  
}







char Message[12];
uint32_t Messageindex;

void static fillmessage(uint32_t n){


  if(n >= 10){
    fillmessage(n/10);
    n = n%10;
  }
  Message[Messageindex] = (n+'0');  
  if(Messageindex<11)Messageindex++;
}
void static fillmessage4(uint32_t n){
  if(n>9999)n=9999;
  if(n>=1000){  
    Messageindex = 0;
  } else if(n>=100){  
    Message[0] = ' ';
    Messageindex = 1;
  }else if(n>=10){ 
    Message[0] = ' ';  
    Message[1] = ' ';
    Messageindex = 2;
  }else{
    Message[0] = ' ';  
    Message[1] = ' ';
    Message[2] = ' ';
    Messageindex = 3;
  }
  fillmessage(n);
}
void static fillmessage5(uint32_t n){
  if(n>99999)n=99999;
  if(n>=10000){  
    Messageindex = 0;
  } else if(n>=1000){  
    Message[0] = ' ';
    Messageindex = 1;
  }else if(n>=100){  
    Message[0] = ' ';
    Message[1] = ' ';
    Messageindex = 2;
  }else if(n>=10){ 
    Message[0] = ' ';  
    Message[1] = ' ';
    Message[2] = ' ';
    Messageindex = 3;
  }else{
    Message[0] = ' ';  
    Message[1] = ' ';
    Message[2] = ' ';
    Message[3] = ' ';
    Messageindex = 4;
  }
  fillmessage(n);
}
void static fillmessage2_1(uint32_t n){
  if(n>999)n=999;
  if(n>=100){  
    Message[0] = (n/100+'0');  
    n = n%100; 
  }else { 
    Message[0] = ' ';  
  }
  Message[1] = (n/10+'0');  
  n = n%10; 
  Message[2] = '.';
  Message[3] = (n+'0');  
  Message[4] = 0;
}
void static fillmessage2_Hex(uint32_t n){ char digit;
  if(n>255){
    Message[0] = '*';
    Message[1] = '*';
  }else{
    digit = n/16;
    if(digit<10){
      digit = digit+'0';
    }else{
      digit = digit+'A'-10;
    }
    Message[0] = digit;  
    digit = n%16;
    if(digit<10){
      digit = digit+'0';
    }else{
      digit = digit+'A'-10;
    }
    Message[1] = digit;  
  }
  Message[2] = ',';
  Message[3] = 0;
}








void BSP_LCD_SetCursor(uint32_t newX, uint32_t newY){
  if((newX > 20) || (newY > 12)){       
    return;                             
  }
  StX = newX;
  StY = newY;
}









void BSP_LCD_OutUDec(uint32_t n, int16_t textColor){
  StTextColor = textColor;
  Messageindex = 0;
  fillmessage(n);
  Message[Messageindex] = 0; 
  BSP_LCD_DrawString(StX,StY,Message,textColor);
  StX = StX+Messageindex;
  if(StX>20){
    StX = 20;
    BSP_LCD_DrawChar(StX*6,StY*10,'*',0xF800,0x0000, 1);
  }
}









void BSP_LCD_OutUDec4(uint32_t n, int16_t textColor){
  Messageindex = 0;
  fillmessage4(n);
  Message[Messageindex] = 0; 
  BSP_LCD_DrawString(StX,StY,Message,textColor);
  StX = StX+Messageindex;
  if(StX>20){
    StX = 20;
    BSP_LCD_DrawChar(StX*6,StY*10,'*',0xF800,0x0000, 1);
  }
}









void BSP_LCD_OutUDec5(uint32_t n, int16_t textColor){
  Messageindex = 0;
  fillmessage5(n);
  Message[Messageindex] = 0; 
  BSP_LCD_DrawString(StX,StY,Message,textColor);
  StX = StX+Messageindex;
  if(StX>20){
    StX = 20;
    BSP_LCD_DrawChar(StX*6,StY*10,'*',0xF800,0x0000, 1);
  }
}










void BSP_LCD_OutUFix2_1(uint32_t n, int16_t textColor){
  fillmessage2_1(n);
  BSP_LCD_DrawString(StX,StY,Message,textColor);
  StX = StX+4;
  if(StX>20){
    StX = 20;
    BSP_LCD_DrawChar(StX*6,StY*10,'*',0xF800,0x0000, 1);
  }
}








void BSP_LCD_OutUHex2(uint32_t n, int16_t textColor){
  fillmessage2_Hex(n);
  BSP_LCD_DrawString(StX,StY,Message,textColor);
  StX = StX+3;
  if(StX>20){
    StX = 20;
    BSP_LCD_DrawChar(StX*6,StY*10,'*',0xF800,0x0000, 1);
  }
}

int TimeIndex;               
int32_t Ymax, Ymin, Yrange;  
uint16_t PlotBGColor;        


















void BSP_LCD_Drawaxes(uint16_t axisColor, uint16_t bgColor, char *xLabel,
  char *yLabel1, uint16_t label1Color, char *yLabel2, uint16_t label2Color,
  int32_t ymax, int32_t ymin){
  int i;
  
  Ymax = ymax;
  Ymin = ymin;
  Yrange = Ymax - Ymin;
  TimeIndex = 0;
  PlotBGColor = bgColor;
  BSP_LCD_FillRect(0, 17, 111, 111, bgColor);
  BSP_LCD_DrawFastHLine(10, 117, 101, axisColor);
  BSP_LCD_DrawFastVLine(10, 17, 101, axisColor);
  for(i=20; i<=110; i=i+10){
    BSP_LCD_DrawPixel(i, 118, axisColor);
  }
  for(i=17; i<117; i=i+10){
    BSP_LCD_DrawPixel(9, i, axisColor);
  }
  i = 50;
  while((*xLabel) && (i < 100)){
    BSP_LCD_DrawChar(i, 120, *xLabel, axisColor, bgColor, 1);
    i = i + 6;
    xLabel++;
  }
  if(*yLabel2){ 
    i = 26;
    while((*yLabel2) && (i < 50)){
      BSP_LCD_DrawChar(0, i, *yLabel2, label2Color, bgColor, 1);
      i = i + 8;
      yLabel2++;
    }
    i = 82;
  }else{ 
    i = 42;
  }
  while((*yLabel1) && (i < 120)){
    BSP_LCD_DrawChar(0, i, *yLabel1, label1Color, bgColor, 1);
    i = i + 8;
    yLabel1++;
  }
}












void BSP_LCD_PlotPoint(int32_t data1, uint16_t color1){
  data1 = ((data1 - Ymin)*100)/Yrange;
  if(data1 > 98){
    data1 = 98;
    color1 = 0xF800;
  }
  if(data1 < 0){
    data1 = 0;
    color1 = 0xF800;
  }
  BSP_LCD_DrawPixel(TimeIndex + 11, 116 - data1, color1);
  BSP_LCD_DrawPixel(TimeIndex + 11, 115 - data1, color1);
}









void BSP_LCD_PlotIncrement(void){
  TimeIndex = TimeIndex + 1;
  if(TimeIndex > 99){
    TimeIndex = 0;
  }
  BSP_LCD_DrawFastVLine(TimeIndex + 11, 17, 100, PlotBGColor);
}
 
 
 









void BSP_Clock_InitFastest(void){
  
  
  (*((volatile uint32_t *)0x400FE070)) |= 0x80000000;
  
  (*((volatile uint32_t *)0x400FE070)) |= 0x00000800;
  
  (*((volatile uint32_t *)0x400FE060)) &= ~0x000007C0;   
  (*((volatile uint32_t *)0x400FE060)) += 0x00000540;
  (*((volatile uint32_t *)0x400FE070)) &= ~0x00000070;
  (*((volatile uint32_t *)0x400FE070)) += 0x00000000;
  
  (*((volatile uint32_t *)0x400FE070)) &= ~0x00002000;
  
  (*((volatile uint32_t *)0x400FE070)) |= 0x40000000;  
  (*((volatile uint32_t *)0x400FE070)) = ((*((volatile uint32_t *)0x400FE070))&~0x1FC00000) 
                  + (4<<22);      
  
  while(((*((volatile uint32_t *)0x400FE050))&0x00000040)==0){};
  
  (*((volatile uint32_t *)0x400FE070)) &= ~0x00000800;
  ClockFrequency = 80000000;
}






uint32_t BSP_Clock_GetFreq(void){
  return ClockFrequency;
}











void (*PeriodicTask)(void);   
void BSP_PeriodicTask_Init(void(*task)(void), uint32_t freq, uint8_t priority){long sr;
  if((freq == 0) || (freq > 10000)){
    return;                        
  }
  if(priority > 6){
    priority = 6;
  }
  sr = StartCritical();
  PeriodicTask = task;             
  
  (*((volatile uint32_t *)0x400FE65C)) |= 0x20;     
  while(((*((volatile uint32_t *)0x400FEA5C))&0x20) == 0){};
  (*((volatile uint32_t *)0x4004F00C)) &= ~0x00000001;
  (*((volatile uint32_t *)0x4004F000)) = 0x00000004;
                                   
  (*((volatile uint32_t *)0x4004F004)) = 0x00000002;
  (*((volatile uint32_t *)0x4004F028)) = (ClockFrequency/freq - 1); 
  (*((volatile uint32_t *)0x4004F038)) = 0;              
  (*((volatile uint32_t *)0x4004F024)) = 0x00000001;
  (*((volatile uint32_t *)0x4004F018)) |= 0x00000001;





  (*((volatile uint32_t *)0xE000E468)) = ((*((volatile uint32_t *)0xE000E468))&0xFFFFFF00)|(priority<<5); 



  (*((volatile uint32_t *)0xE000E10C)) = 1<<8;               
  (*((volatile uint32_t *)0x4004F00C)) |= 0x00000001; 
  EndCritical(sr);
}

void WideTimer5A_Handler(void){
  (*((volatile uint32_t *)0x4004F024)) = 0x00000001;
  (*PeriodicTask)();               
}






void BSP_PeriodicTask_Stop(void){
  (*((volatile uint32_t *)0x4004F024)) = 0x00000001;
  (*((volatile uint32_t *)0xE000E18C)) = 1<<8;              
}




void BSP_PeriodicTask_Restart(void){
  (*((volatile uint32_t *)0x4004F024)) = 0x00000001;
  (*((volatile uint32_t *)0xE000E10C)) = 1<<8;              
}











void (*PeriodicTaskB)(void);   
void BSP_PeriodicTask_InitB(void(*task)(void), uint32_t freq, uint8_t priority){long sr;
  if((freq == 0) || (freq > 10000)){
    return;                        
  }
  if(priority > 6){
    priority = 6;
  }
  sr = StartCritical();
  PeriodicTaskB = task;             
  
  (*((volatile uint32_t *)0x400FE65C)) |= 0x10;     
  while(((*((volatile uint32_t *)0x400FEA5C))&0x10) == 0){};
  (*((volatile uint32_t *)0x4004E00C)) &= ~0x00000001;
  (*((volatile uint32_t *)0x4004E000)) = 0x00000004;
                                   
  (*((volatile uint32_t *)0x4004E004)) = 0x00000002;
  (*((volatile uint32_t *)0x4004E028)) = (ClockFrequency/freq - 1); 
  (*((volatile uint32_t *)0x4004E038)) = 0;              
  (*((volatile uint32_t *)0x4004E024)) = 0x00000001;
  (*((volatile uint32_t *)0x4004E018)) |= 0x00000001;





  (*((volatile uint32_t *)0xE000E464)) = ((*((volatile uint32_t *)0xE000E464))&0xFF00FFFF)|(priority<<21); 



  (*((volatile uint32_t *)0xE000E10C)) = 1<<6;               
  (*((volatile uint32_t *)0x4004E00C)) |= 0x00000001; 
  EndCritical(sr);
}

void WideTimer4A_Handler(void){
  (*((volatile uint32_t *)0x4004E024)) = 0x00000001;
  (*PeriodicTaskB)();               
}






void BSP_PeriodicTask_StopB(void){
  (*((volatile uint32_t *)0x4004E024)) = 0x00000001;
  (*((volatile uint32_t *)0xE000E18C)) = 1<<6;              
}












void (*PeriodicTaskC)(void);   
void BSP_PeriodicTask_InitC(void(*task)(void), uint32_t freq, uint8_t priority){long sr;
  if((freq == 0) || (freq > 10000)){
    return;                        
  }
  if(priority > 6){
    priority = 6;
  }
  sr = StartCritical();
  PeriodicTaskC = task;             
  
  (*((volatile uint32_t *)0x400FE65C)) |= 0x08;     
  while(((*((volatile uint32_t *)0x400FEA5C))&0x08) == 0){};
  (*((volatile uint32_t *)0x4004D00C)) &= ~0x00000001;
  (*((volatile uint32_t *)0x4004D000)) = 0x00000004;
                                   
  (*((volatile uint32_t *)0x4004D004)) = 0x00000002;
  (*((volatile uint32_t *)0x4004D028)) = (ClockFrequency/freq - 1); 
  (*((volatile uint32_t *)0x4004D038)) = 0;              
  (*((volatile uint32_t *)0x4004D024)) = 0x00000001;
  (*((volatile uint32_t *)0x4004D018)) |= 0x00000001;





  (*((volatile uint32_t *)0xE000E464)) = ((*((volatile uint32_t *)0xE000E464))&0xFFFFFF00)|(priority<<5); 



  (*((volatile uint32_t *)0xE000E10C)) = 1<<4;               
  (*((volatile uint32_t *)0x4004D00C)) |= 0x00000001; 
  EndCritical(sr);
}

void WideTimer3A_Handler(void){
  (*((volatile uint32_t *)0x4004D024)) = 0x00000001;
  (*PeriodicTaskC)();               
}






void BSP_PeriodicTask_StopC(void){
  (*((volatile uint32_t *)0x4004D024)) = 0x00000001;
  (*((volatile uint32_t *)0xE000E18C)) = 1<<4;              
}








void BSP_Time_Init(void){long sr;
  
  (*((volatile uint32_t *)0x400FE65C)) |= 0x20;     
  while(((*((volatile uint32_t *)0x400FEA5C))&0x20) == 0){};
  (*((volatile uint32_t *)0x4004F00C)) &= ~0x00000100;
  (*((volatile uint32_t *)0x4004F000)) = 0x00000004;
                                   
  (*((volatile uint32_t *)0x4004F008)) = 0x00000002;
  (*((volatile uint32_t *)0x4004F02C)) = 0xFFFFFFFF;    
  (*((volatile uint32_t *)0x4004F03C)) = 79;             
  (*((volatile uint32_t *)0x4004F024)) = 0x00000100;
  (*((volatile uint32_t *)0x4004F018)) &= ~0x00000100;
  (*((volatile uint32_t *)0x4004F00C)) |= 0x00000100; 
  EndCritical(sr);
}









uint32_t BSP_Time_Get(void){
  
  return (0xFFFFFFFF - (*((volatile uint32_t *)0x4004F054)));
}






void BSP_Delay1ms(uint32_t n){
  while(n){
    parrotdelay(23746);    
    n--;
  }
}







void static i2cinit(void){
  (*((volatile uint32_t *)0x400FE620)) |= 0x0002;      
  (*((volatile uint32_t *)0x400FE608)) |= 0x0001;     
  while(((*((volatile uint32_t *)0x400FEA08))&0x01) == 0){};
                                   
  (*((volatile uint32_t *)0x40004528)) &= ~0xC0;     
                                   
  (*((volatile uint32_t *)0x4000452C)) = ((*((volatile uint32_t *)0x4000452C))&0x00FFFFFF)+0x33000000;
  (*((volatile uint32_t *)0x4000450C)) |= 0x80;        
  (*((volatile uint32_t *)0x40004420)) |= 0xC0;      
  (*((volatile uint32_t *)0x4000451C)) |= 0xC0;        
  (*((volatile uint32_t *)0x40021020)) = 0x00000010;        
  (*((volatile uint32_t *)0x4002100C)) = 39;                
  
}






























uint16_t static I2C_Recv2(int8_t slave){
  uint8_t data1,data2;
  int retryCounter = 1;
  do{
    while((*((volatile uint32_t *)0x40021004))&0x00000001){};
    (*((volatile uint32_t *)0x40021000)) = (slave<<1)&0xFE;    
    (*((volatile uint32_t *)0x40021000)) |= 0x01;              
    (*((volatile uint32_t *)0x40021004)) = (0
                         | 0x00000008      

                         | 0x00000002    
                         | 0x00000001);    
    while((*((volatile uint32_t *)0x40021004))&0x00000001){};
    data1 = ((*((volatile uint32_t *)0x40021008))&0xFF);       
    (*((volatile uint32_t *)0x40021004)) = (0

                         | 0x00000004     

                         | 0x00000001);    
    while((*((volatile uint32_t *)0x40021004))&0x00000001){};
    data2 = ((*((volatile uint32_t *)0x40021008))&0xFF);       
    retryCounter = retryCounter + 1;        
  }                                         
  while((((*((volatile uint32_t *)0x40021004))&(0x00000004|0x00000002)) != 0) && (retryCounter <= 5));
  return (data1<<8)+data2;                  
}








uint16_t static I2C_Send1(int8_t slave, uint8_t data1){
  while((*((volatile uint32_t *)0x40021004))&0x00000001){};
  (*((volatile uint32_t *)0x40021000)) = (slave<<1)&0xFE;    
  (*((volatile uint32_t *)0x40021000)) &= ~0x01;             
  (*((volatile uint32_t *)0x40021008)) = data1&0xFF;         
  (*((volatile uint32_t *)0x40021004)) = (0

                       | 0x00000004     
                       | 0x00000002    
                       | 0x00000001);    
  while((*((volatile uint32_t *)0x40021004))&0x00000001){};
                                          
  return ((*((volatile uint32_t *)0x40021004))&(0x00000008|0x00000004|0x00000002));
}
















































uint16_t static I2C_Send3(int8_t slave, uint8_t data1, uint8_t data2, uint8_t data3){
  while((*((volatile uint32_t *)0x40021004))&0x00000001){};
  (*((volatile uint32_t *)0x40021000)) = (slave<<1)&0xFE;    
  (*((volatile uint32_t *)0x40021000)) &= ~0x01;             
  (*((volatile uint32_t *)0x40021008)) = data1&0xFF;         
  (*((volatile uint32_t *)0x40021004)) = (0


                       | 0x00000002    
                       | 0x00000001);    
  while((*((volatile uint32_t *)0x40021004))&0x00000001){};
                                          
  if(((*((volatile uint32_t *)0x40021004))&(0x00000008|0x00000004|0x00000002)) != 0){
    (*((volatile uint32_t *)0x40021004)) = (0                

                       | 0x00000004     


                       );
                                          
    return ((*((volatile uint32_t *)0x40021004))&(0x00000008|0x00000004|0x00000002));
  }
  (*((volatile uint32_t *)0x40021008)) = data2&0xFF;         
  (*((volatile uint32_t *)0x40021004)) = (0



                       | 0x00000001);    
  while((*((volatile uint32_t *)0x40021004))&0x00000001){};
                                          
  if(((*((volatile uint32_t *)0x40021004))&(0x00000008|0x00000004|0x00000002)) != 0){
    (*((volatile uint32_t *)0x40021004)) = (0                

                       | 0x00000004     


                        );
                                          
    return ((*((volatile uint32_t *)0x40021004))&(0x00000008|0x00000004|0x00000002));
  }
  (*((volatile uint32_t *)0x40021008)) = data3&0xFF;         
  (*((volatile uint32_t *)0x40021004)) = (0

                       | 0x00000004     

                       | 0x00000001);    
  while((*((volatile uint32_t *)0x40021004))&0x00000001){};
                                          
  return ((*((volatile uint32_t *)0x40021004))&(0x00000008|0x00000004|0x00000002));
}








void BSP_LightSensor_Init(void){
  i2cinit();
                                   
                                   
                                   
  (*((volatile uint32_t *)0x40004528)) &= ~0x20;     
                                   
  (*((volatile uint32_t *)0x4000452C)) = ((*((volatile uint32_t *)0x4000452C))&0xFF0FFFFF)+0x00000000;
  (*((volatile uint32_t *)0x40004400)) &= ~0x20;       
  (*((volatile uint32_t *)0x40004420)) &= ~0x20;     
  (*((volatile uint32_t *)0x4000451C)) |= 0x20;        
}





void static lightsensorstart(uint8_t slaveAddress){
  
  
  I2C_Send3(slaveAddress, 0x02, 0xC0, 0x00);
  
  
  
  
  
  
  
  
  
  
  
  
  I2C_Send3(slaveAddress, 0x01, 0xCA, 0x10);
  I2C_Recv2(slaveAddress);         
}





int32_t static lightsensorend(uint8_t slaveAddress){
  uint16_t raw, config;
  I2C_Send1(slaveAddress, 0x00);   
  raw = I2C_Recv2(slaveAddress);
  
  I2C_Send1(slaveAddress, 0x01);   
  config = I2C_Recv2(slaveAddress);
  I2C_Send3(slaveAddress, 0x01, (config&0xFF00)>>8, (config&0x00FF)&~0x0010);
  I2C_Send3(slaveAddress, 0x01, (config&0xFF00)>>8, (config&0x00FF)|0x0010);
  return (1<<(raw>>12))*(raw&0x0FFF);
}









int LightBusy = 0;                 
uint32_t BSP_LightSensor_Input(void){
  uint32_t light;
  LightBusy = 1;
  lightsensorstart(0x44);
  while((*((volatile uint32_t *)0x40004080)) == 0x20){};       
  light = lightsensorend(0x44);
  LightBusy = 0;
  return light;
}








void BSP_LightSensor_Start(void){
  if(LightBusy == 0){
    
    LightBusy = 1;
    lightsensorstart(0x44);
  }
}












int BSP_LightSensor_End(uint32_t *light){
  uint32_t lightLocal;
  if(LightBusy == 0){
    
    LightBusy = 1;
    lightsensorstart(0x44);
    return 0;                      
  } else{
    
    if((*((volatile uint32_t *)0x40004080)) == 0x20){
      return 0;                    
    } else{
      lightLocal = lightsensorend(0x44);
      *light = lightLocal;
      LightBusy = 0;
      return 1;                    
    }
  }
}









void BSP_TempSensor_Init(void){
  i2cinit();
                                   
                                   
                                   
  (*((volatile uint32_t *)0x40004528)) &= ~0x04;     
                                   
  (*((volatile uint32_t *)0x4000452C)) = ((*((volatile uint32_t *)0x4000452C))&0xFFFFF0FF)+0x00000000;
  (*((volatile uint32_t *)0x40004400)) &= ~0x04;       
  (*((volatile uint32_t *)0x40004420)) &= ~0x04;     
  (*((volatile uint32_t *)0x4000451C)) |= 0x04;        
}





void static tempsensorstart(uint8_t slaveAddress){
  
  
  
  
  
  
  
  I2C_Send3(slaveAddress, 0x02, 0x75, 0x00);
}






void static tempsensorend(uint8_t slaveAddress, int32_t *sensorV, int32_t *localT){
  int16_t raw;
  I2C_Send1(slaveAddress, 0x00);   
  raw = I2C_Recv2(slaveAddress);
  *sensorV = raw*15625;            
  I2C_Send1(slaveAddress, 0x01);   
  raw = I2C_Recv2(slaveAddress);
  *localT = (raw>>2)*3125;         
}










int TempBusy = 0;                  
void BSP_TempSensor_Input(int32_t *sensorV, int32_t *localT){
  int32_t volt, temp;
  TempBusy = 1;
  tempsensorstart(0x40);
  while((*((volatile uint32_t *)0x40004010)) == 0x04){};        
  tempsensorend(0x40, &volt, &temp);
  *sensorV = volt;
  *localT = temp;
  TempBusy = 0;
}








void BSP_TempSensor_Start(void){
  if(TempBusy == 0){
    
    TempBusy = 1;
    tempsensorstart(0x40);
  }
}














int BSP_TempSensor_End(int32_t *sensorV, int32_t *localT){
  int32_t volt, temp;
  if(TempBusy == 0){
    
    TempBusy = 1;
    tempsensorstart(0x40);
    return 0;                      
  } else{
    
    if((*((volatile uint32_t *)0x40004010)) == 0x04){
      return 0;                    
    } else{
      tempsensorend(0x40, &volt, &temp);
      *sensorV = volt;
      *localT = temp;
      TempBusy = 0;
      return 1;                    
    }
  }
}

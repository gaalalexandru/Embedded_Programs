#line 1 "src\\GSM3MobileServerProvider.cpp"
































 
 
#line 1 ".\\src\\GSM3MobileServerProvider.h"
































 




#line 1 ".\\src\\GSM3MobileAccessProvider.h"
































 



enum GSM3_NetworkStatus_t { ERROR, IDLE, CONNECTING, GSM_READY, GPRS_READY, TRANSPARENT_CONNECTED, OFF};

class GSM3MobileAccessProvider
{
	public:
		
		
		




 
		virtual inline GSM3_NetworkStatus_t begin(char* pin=0,bool restart=true, bool synchronous=true)=0;
		
		

 
		virtual inline int isAccessAlive()=0;
		
		

 
		virtual inline bool shutdown()=0;
		
		

 
		virtual inline bool secureShutdown()=0;
		
		

 
		virtual int ready()=0;
};

#line 39 ".\\src\\GSM3MobileServerProvider.h"
#line 1 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\inttypes.h"
 
 





 

 








#line 1 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     












      namespace std {

          extern "C" {








 

     

     
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


#line 247 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

#line 266 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"


         }   
      }   





      using ::std::int8_t;
      using ::std::int16_t;
      using ::std::int32_t;
      using ::std::int64_t;
      using ::std::uint8_t;
      using ::std::uint16_t;
      using ::std::uint32_t;
      using ::std::uint64_t;
      using ::std::int_least8_t;
      using ::std::int_least16_t;
      using ::std::int_least32_t;
      using ::std::int_least64_t;
      using ::std::uint_least8_t;
      using ::std::uint_least16_t;
      using ::std::uint_least32_t;
      using ::std::uint_least64_t;
      using ::std::int_fast8_t;
      using ::std::int_fast16_t;
      using ::std::int_fast32_t;
      using ::std::int_fast64_t;
      using ::std::uint_fast8_t;
      using ::std::uint_fast16_t;
      using ::std::uint_fast32_t;
      using ::std::uint_fast64_t;
      using ::std::intptr_t;
      using ::std::uintptr_t;
      using ::std::intmax_t;
      using ::std::uintmax_t;








 
#line 20 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\inttypes.h"

#line 203 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\inttypes.h"

#line 221 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\inttypes.h"

typedef struct imaxdiv_t { intmax_t quot, rem; } imaxdiv_t;
    


extern "C" {


__declspec(__nothrow) intmax_t strtoimax(const char * __restrict  ,
                   char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
     
__declspec(__nothrow) uintmax_t strtoumax(const char * __restrict  ,
                    char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
     

__declspec(__nothrow) intmax_t wcstoimax(const wchar_t * __restrict  ,
                   wchar_t ** __restrict  , int  ) __attribute__((__nonnull__(1)));
__declspec(__nothrow) uintmax_t wcstoumax(const wchar_t * __restrict  ,
                    wchar_t ** __restrict  , int  ) __attribute__((__nonnull__(1)));

extern __declspec(__nothrow) __attribute__((const)) intmax_t imaxabs(intmax_t  );
   



 
extern __declspec(__nothrow) __attribute__((const)) imaxdiv_t imaxdiv(intmax_t  , intmax_t  );
   











 


}




 

#line 40 ".\\src\\GSM3MobileServerProvider.h"
#line 1 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"
 






 

 
 
 





 









        namespace std {

        extern "C" {







  typedef signed int ptrdiff_t;



  



    typedef unsigned int size_t;    
#line 57 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"

#line 82 "F:\\0_Tools\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"



    




   




  typedef long double max_align_t;



         }   
      }   






      using ::std::size_t;
      using ::std::ptrdiff_t;

        using ::std::max_align_t;






 

#line 41 ".\\src\\GSM3MobileServerProvider.h"
		

class GSM3MobileServerProvider
{	
		


 
		virtual bool getSocketAsServerModemStatus(int s)=0;
		
	public:
		
		

 
		virtual int minSocketAsServer()=0;
		
		

 
		virtual int maxSocketAsServer()=0;
		
		

 
		virtual int ready()=0;
		
		 
		GSM3MobileServerProvider(){};
						
		


 
		virtual  int connectTCPServer(int port)=0;
		
				
		

 
		virtual int getNewOccupiedSocketAsServer()=0;
		
		


 
		virtual bool getStatusSocketAsServer(uint8_t socket)=0;
		
		

};

extern GSM3MobileServerProvider* theGSM3MobileServerProvider;

#line 36 "src\\GSM3MobileServerProvider.cpp"
 
GSM3MobileServerProvider* theGSM3MobileServerProvider;
 
 

#line 1 "src\\GSM3MobileAccessProvider.cpp"
































 
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

#line 35 "src\\GSM3MobileAccessProvider.cpp"

GSM3MobileAccessProvider* theGSM3MobileAccessProvider;

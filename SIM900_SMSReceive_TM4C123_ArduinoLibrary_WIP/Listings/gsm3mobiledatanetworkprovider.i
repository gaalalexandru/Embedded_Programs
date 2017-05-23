#line 1 "src\\GSM3MobileDataNetworkProvider.cpp"
































 
#line 1 ".\\src\\GSM3MobileDataNetworkProvider.h"
































 



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

#line 38 ".\\src\\GSM3MobileDataNetworkProvider.h"



class GSM3MobileDataNetworkProvider
{
	public:
		
		




 
		virtual GSM3_NetworkStatus_t networkAttach(char* networId, char* user, char* pass)=0;
		
		

 
		virtual GSM3_NetworkStatus_t networkDetach()=0;
				
};

extern GSM3MobileDataNetworkProvider* theGSM3MobileDataNetworkProvider;

#line 35 "src\\GSM3MobileDataNetworkProvider.cpp"



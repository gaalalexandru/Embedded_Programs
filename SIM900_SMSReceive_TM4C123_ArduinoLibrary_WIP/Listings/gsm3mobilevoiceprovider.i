#line 1 "src\\GSM3MobileVoiceProvider.cpp"
































 
#line 1 ".\\src\\GSM3MobileVoiceProvider.h"
































 



enum GSM3_voiceCall_st { IDLE_CALL, CALLING, RECEIVINGCALL, TALKING};

class GSM3MobileVoiceProvider
{
	public:
		
		


 
		virtual void initialize(){};
		
		


 
		virtual int voiceCall(const char* number)=0;
		
		

 
		virtual int answerCall()=0;
		
		

 
		virtual int hangCall()=0;
		
		



 
		virtual int retrieveCallingNumber(char* buffer, int bufsize)=0;

		

 
		virtual GSM3_voiceCall_st getvoiceCallStatus()=0;
		
		

 
		virtual void setvoiceCallStatus(GSM3_voiceCall_st status)=0;

		

 
		virtual int ready()=0;
};

extern GSM3MobileVoiceProvider* theGSM3MobileVoiceProvider;

#line 35 "src\\GSM3MobileVoiceProvider.cpp"

GSM3MobileVoiceProvider* theGSM3MobileVoiceProvider;

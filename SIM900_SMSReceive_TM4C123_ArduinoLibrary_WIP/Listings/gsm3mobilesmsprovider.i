#line 1 "src\\GSM3MobileSMSProvider.cpp"
































 
#line 1 ".\\src\\GSM3MobileSMSProvider.h"
































 



class GSM3MobileSMSProvider
{
	public:
		
		


 
		virtual inline int beginSMS(const char* to){return 0;};
		
		

 
		virtual inline void writeSMS(const char c){};
		
		

 
		virtual inline int endSMS(){return 0;};
		
		

 
		virtual inline int availableSMS(){return 0;};
		
		

 
		virtual inline int peekSMS(){return 0;};
		
		
 
		virtual inline void flushSMS(){return;};
		
		



 
		virtual inline int remoteSMSNumber(char* number, int nlength){return 0;}; 
		
		

 
		virtual inline int readSMS(){return 0;};
		
		

 
		virtual int ready()=0;
};

extern GSM3MobileSMSProvider* theGSM3SMSProvider;

#line 35 "src\\GSM3MobileSMSProvider.cpp"

GSM3MobileSMSProvider* theGSM3SMSProvider;

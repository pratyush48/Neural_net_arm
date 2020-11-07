#include "stm32f4xx.h"
#include <string.h>
void printMsg(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
}

void printWelcome(const int a)
	
{	
	char *ptr;
	if(a==0)
		{ptr="Testing AND GATE:\n INPUT, OUTPUT \n";}
	else if(a==1)
			{ptr="Testing NAND GATE:\n INPUT, OUTPUT \n";}
	else if(a==2)
			{ptr="Testing OR GATE:\n INPUT, OUTPUT \n";}
	else if(a==3)
			{ptr="Testing NOR GATE: \n INPUT, OUTPUT \n";}
	else if(a==4)
			{ptr="Testing NOT GATE: \n INPUT, OUTPUT \n";}
	else if(a==5)
			{ptr="Testing XOR GATE: \n INPUT, OUTPUT \n";}
	else if(a==6)
			{ptr="Testing XNOR GATE: \n INPUT, OUTPUT \n";}
	
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   
	 }

}

	 void printNext()
{
	ITM_SendChar('\n')	 ;
}

void ADDComma()
{
	
	 ITM_SendChar(',')	 ;
}

void printfMsg(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
}
void printMsg2p(const int a, const int b)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
}

void printMsg4p(const int a, const int b, const int c, const int d, const int e)
{
	 char Msg[100];
	 char *ptr;
	 // Printing the message
	sprintf(Msg,"\nPrinting First parameter a:  ");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 //Printing the first parameter
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 // Printing the message
	 sprintf(Msg,"\nPrinting Second parameter b: ");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 // Printing the message
	 sprintf(Msg,"\nPrinting Third parameter c: ");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", c);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 // Printing the message
	 sprintf(Msg,"\nPrinting Four parameter d: ");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", d);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
	 }

	 // Printing the message
	 sprintf(Msg,"\nPrinting Fifth parameter e (check this value is correct or not): ");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }

	  sprintf(Msg, "%x", e);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
}


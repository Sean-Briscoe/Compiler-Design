%{
#include <stdio.h>
#include <stdlib.h>
%}

plates1	  	([01][0-9]|[01][0-9][12])
plates2		([0189][0-9])
counties1 (DL)|(CW)|(CN)|(CE)|(C)|(D)|(G)|(KE)|(KK)|(KY)|(LD)|(LH)|(LM)|(LS)|(L)|(MH)|(MN)|(MO)|(OY)|(RN)|(SO)|(T)|(WH)|(WX)|(WW)|(W)

counties2 (DL)|(CW)|(CN)|(CE)|(C)|(D)|(G)|(KE)|(KK)|(KY)|(LD)|(LH)|(LK)|(LM)|(LS)|(L)|(MH)|(MN)|(MO)|(OY)|(RN)|(SO)|(TN)|(TS)|(WH)|(WD)|(WX)|(WW)|(W)
space	[\r\n\t\f\v ]

%%

{space} {}
"\n"+	{}
{plates1}-{counties1}-[0-9]{1,6}{space}+	{getYear(yytext);}

{plates2}-{counties2}-[0-9]{1,6}{space}+	{getYear(yytext);}
.*{space}		{printf("INVALID\n");}

%%

int getYear(char p[]){
	char year[2];

    if(yytext[0] < '2'){
  	   year[0] = yytext[0];
  	   year[1] = yytext[1];
	   int years = 18-atoi(year);
  	   printf("%d\n", years);
    }

    if(yytext[0] > '7'){
  	   year[0] = yytext[0];
  	   year[1] = yytext[1];
  	   int years = 118-atoi(year);
  	   printf("%d\n", years);
    }
}

int main(){
	yylex();
	return 0;
}
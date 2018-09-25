%{
#include <stdio.h>
%}

%%

["][^"]*["]	{printf("%s",yytext);}

"**".*	{}

"}"		{ 
			printf ("syntax error\n");
        	return 0;
        }

"{"     { /* ignore multiline comments. */
           register int c;

           for (;;)
           {
             while ((c = input ()) != '}' && c != EOF)
               ; /* eat up text of comment. */

             if (c == '}')
             {
                break; /* found the end. */
             }

             if (c == EOF)
             {
               printf ("syntax error\n");
               break;
             }
           }
         }


%%

main(){
	yylex();
	return 0;
}



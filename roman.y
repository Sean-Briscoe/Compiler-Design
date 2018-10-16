%{

  #  include <stdio.h>
  #  include <stdlib.h>
  int yylex();
  void yyerror(char *s);
  
%}

%output "roman.tab.c"
%token NUM EOL
%%

calclist: /* nothing */ {}
| calclist expr EOL {
			printf("%d\n", $2);
		    }
;

expr: NUM
| expr NUM {
	     $$ = $$ + $2;
	   }
;

%%

void yyerror(char *s)
{
  printf("%s\n", s);
}

int main()
{
  yyparse();
	return 0;
}

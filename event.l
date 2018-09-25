%{
int count=0;
%}

%%

[0-9]*[0|2|4|6|8][^a-zA-z0-9_]+ {count++;}
\n								{}
.								{}

%%

int main()
{
  yylex();
  printf("%d\n", count);
  return 0;
}


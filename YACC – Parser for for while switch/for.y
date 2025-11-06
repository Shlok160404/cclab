%{
#include <stdio.h>
int yylex(void); void yyerror(const char*s){ printf("Invalid\n"); }
%}
%token FOR ID NUM RELOP
%%
S : FOR '(' optE ';' optE ';' optE ')' stmt   { printf("Valid FOR\n"); }
  ;
optE : /*empty*/ | E ;
E : ID | NUM | ID '=' E | E RELOP E | E '+' E | E '-' E | E '*' E | E '/' E | '(' E ')' ;
stmt : '{' '}' | '{' stmt '}' | ';' ;
%%
int main(){ return yyparse(); }

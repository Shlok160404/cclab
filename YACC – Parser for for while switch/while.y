%{
#include <stdio.h>
int yylex(void); void yyerror(const char*s){ printf("Invalid\n"); }
%}
%token WHILE ID NUM RELOP
%%
S : WHILE '(' E ')' stmt { printf("Valid WHILE\n"); }
E : ID | NUM | E RELOP E | E '+' E | E '-' E | '(' E ')' ;
stmt : '{' '}' | ';' ;
%%
int main(){ return yyparse(); }

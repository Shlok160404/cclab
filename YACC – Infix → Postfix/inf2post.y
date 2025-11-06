%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char*s){ }
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
line: expr '\n' { printf("\n"); }
    ;
expr: expr '+' expr { printf("+ "); }
    | expr '-' expr { printf("- "); }
    | expr '*' expr { printf("* "); }
    | expr '/' expr { printf("/ "); }
    | '(' expr ')'  { /* nothing */ }
    | NUM           { printf("%d ", $1); }
    ;
%%
int main(){ return yyparse(); }

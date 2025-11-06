%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char*s){ fprintf(stderr,"Syntax error, skipping line\n"); }
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
input: /* empty */
     | input line
     ;
line:  expr '\n'     { printf("= %d\n", $1); }
    |  error '\n'    { yyerrok; }
    ;
expr: expr '+' expr  { $$=$1+$2; }
    | expr '-' expr  { $$=$1-$2; }
    | expr '*' expr  { $$=$1*$2; }
    | expr '/' expr  { $$=$1/$2; }
    | '(' expr ')'   { $$=$2; }
    | NUM            { $$=$1; }
    ;
%%
int main(){ return yyparse(); }

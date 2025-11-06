%{
#include <stdio.h>
int yylex(void); void yyerror(const char*s){ printf("Invalid\n"); }
%}
%token SWITCH CASE DEFAULT ID NUM BREAK
%%
S : SWITCH '(' ID ')' '{' Cases OptDefault '}' { printf("Valid SWITCH\n"); }
Cases : /*empty*/ | Cases CASE NUM ':' Stmts ;
OptDefault : /*empty*/ | DEFAULT ':' Stmts ;
Stmts : /*empty*/ | Stmts stmt ;
stmt : BREAK ';' | ';' ;
%%
int main(){ return yyparse(); }

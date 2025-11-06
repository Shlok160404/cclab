%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int tempno=0;
char* mktemp3(const char*a,const char*op,const char*b){
  char buf[64]; sprintf(buf,"t%d",++tempno); printf("%s = %s %s %s\n",buf,a,op,b);
  return strdup(buf);
}
int yylex(void);
void yyerror(const char*s){ }
%}
%union { char* s; }
%token <s> ID
%type  <s> expr
%left '+' '-'
%left '*' '/'
%%
line: expr '\n'   { /* result in $1 */ }
    ;
expr: expr '+' expr { $$=mktemp3($1,"+",$3); }
    | expr '-' expr { $$=mktemp3($1,"-",$3); }
    | expr '*' expr { $$=mktemp3($1,"*",$3); }
    | expr '/' expr { $$=mktemp3($1,"/",$3); }
    | '(' expr ')'  { $$=$2; }
    | ID            { $$=$1; }
    ;
%%
int main(){ return yyparse(); }

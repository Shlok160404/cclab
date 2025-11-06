%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char*s){ fprintf(stderr,"Error: %s\n",s); }
%}
%token NUM
%%
line: /* empty */
    | line expr '\n'   { printf("= %d\n", $2); }
    ;
expr: NUM              { $$=$1; }
    | expr expr '+'    { $$=$1+$2; }
    | expr expr '-'    { $$=$1-$2; }
    | expr expr '*'    { $$=$1*$2; }
    | expr expr '/'    { $$=$1/$2; }
    ;
%%
int main(){ return yyparse(); }

%{
#include "y.tab.h"
%}
%%
[0-9]+               { yylval.s=strdup(yytext); return ID; }
[A-Za-z_][A-Za-z0-9_]* { yylval.s=strdup(yytext); return ID; }
[+\-*/()]\n?         { return yytext[0]; }
[ \t]+               { }
\n                   { return '\n'; }
.                    { }
%%
int yywrap(){ return 1; }

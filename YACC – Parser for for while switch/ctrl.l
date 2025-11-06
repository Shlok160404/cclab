%{
#include "y.tab.h"
%}
%%
"for"      { return FOR; }
"while"    { return WHILE; }
"switch"   { return SWITCH; }
"case"     { return CASE; }
"default"  { return DEFAULT; }
"break"    { return BREAK; }
"continue" { return CONTINUE; }
"=="|"!="|"<="|">="|"<"|">" { return RELOP; }
[0-9]+     { return NUM; }
[A-Za-z_][A-Za-z0-9_]* { return ID; }
[ \t]+     { }
\n         { return '\n'; }
.          { return yytext[0]; }
%%
int yywrap(){ return 1; }

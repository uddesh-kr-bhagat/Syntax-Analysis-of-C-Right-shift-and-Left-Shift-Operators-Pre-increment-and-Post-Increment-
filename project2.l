%{
#include "project2.tab.h"
extern int yylval;
%}
%%
[a-zA-Z][a-zA-Z0-9]* {return ID;} //identifier
[0-9]+ {yylval=atoi(yytext);      //numbers
		return NUMBER;
       }
"++"   {return PP;}          //tokens
"<<"   {return LS;}
">>"   {return RS;}
"("    {return LB;}
")"    {return RB;}
";"    {return SEMI;}
"*"    {return PTR;}
" "    {return SPACE;}
"{"	 {return CLB;}
"}"    {return CRB;}
[\n]    return NL;             //end of line
.       {return printf("INVALID \n");};   //invalid for other characters
%%
int yywrap() { return 1; }

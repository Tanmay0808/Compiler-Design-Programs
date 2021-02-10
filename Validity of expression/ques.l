/* Declarations */
%{
    //To check for validity of expression
    #include "y.tab.h"
%}

/* Translation Rules */
%%
[0-9]+                   return NUMBER;
[a-zA-Z_][a-zA-Z0-9_]*   return ID;
.                        return *yytext;
\n                       return NEWLINE;
%%

/* Auxiliary Functions */
int yywrap()
{
    return 1;
}
/* Declarations */
%{
#include <stdio.h>
#include "y.tab.h"

%}
 
/* Regular Definations */
alpha [A-Za-z]
digit [0-9]

/* Translation Rules */
%%
 
 
[ \t\n]                                 ;
(create|CREATE)                         return CREATE;
int                                     return INT;
float									return FLOAT;
char									return CHAR;
(table|TABLE)                           return TABLE;
varchar                                 return VARCHAR; 
drop                                    return DROP;
{digit}+                                return NUM;
({alpha}|{digit})+                      return ID;						
.                                       return yytext[0];
 
%%
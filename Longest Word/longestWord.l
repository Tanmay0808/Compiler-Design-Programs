/* Declarations */
%{
    //Find the longest word in a text file
    #include<stdio.h>
    int longest_len = 0;
    char longword[60];
%}

/* Translation Rules */
%%
[a-zA-Z]+  { if (yyleng >= longest_len) {longest_len=yyleng;strcpy(longword,yytext);}}
.|\n  {;}
%%

/* Auxiliary Functions */
int main(){
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Longest word : %s\nLength : %d chars\n",longword,longest_len);
    return 0;
}

int yywrap()
{
    return 1;
}
/* Declarations */
%{
    //To count single and multiline comments
    #include<stdio.h>
    #include<string.h>
    int sl_comments=0, ml_comments=0;  
%}

/* Translation Rules */
%%
\"(\\.|[^"\\])*\" {fprintf(yyout,"%s",yytext);}
"/*"([^*]|\*+[^*/])*\*+"/" {printf("Multi Line Comment : %s\n",yytext); ml_comments++;}
\/\/.* {printf("Single Line Comment : %s\n",yytext); sl_comments++;}
%%

/* Auxiliary Functions */
int main(){
    yyin = fopen("comments.cpp","r");
    yyout = fopen("output.cpp","w");
    yylex();
    printf("Single Line Comments : %d\nMulti Line Comments : %d\n",sl_comments,ml_comments);
    return 0;
}

int yywrap(){
    return 1;
}
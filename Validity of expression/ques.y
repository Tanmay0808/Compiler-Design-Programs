/* Declarations */
%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    int yyerror();
%}

%token NUMBER ID NEWLINE
%left '+' '-'
%left '*' '/'

%%

start: expr NEWLINE {printf("Expression is Valid\n");exit(0);}

expr : expr '+' expr
     | expr '-' expr
     | expr '*' expr
     | expr '/' expr
     | '(' expr ')'
     | NUMBER 
     | ID
     ;

%%

/* Auxiliary Functions */
int yyerror(char const *s)
{
    printf("Expression is not valid\n");
    return 1;
}

int main()
{
    printf("Enter Expression : \n");
    yyparse();
    return 0;
}
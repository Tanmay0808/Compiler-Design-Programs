/* Declarations */
%{
    //To Count Number of string literals in the input file
    #include<stdio.h>
    int num_literals = 0;
%}


/* Translation Rules */
%%
.          {;}
\/\/.*     {;}
\"[^\"]*\"  {num_literals++;}
\n         {;}
%%

/* Auxiliary Functions */
int main()
{
    yyin = fopen("input.cpp","r");
    yylex();
    printf("No of Literals : %d\n",num_literals);
    return 0;
}

int yywrap()
{
    return 1;
}
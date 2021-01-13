/* Declarations */
%{
    //To Count Number of words in the input file
    #include<stdio.h>
    int num_words = 0;
%}


/* Translation Rules */
%%
.          {;}
[a-zA-Z]+  {num_words++;}
\n         {;}
%%

/* Auxiliary Functions */
int main()
{
    yyin = fopen("input.txt","r");
    yylex();
    printf("No of words : %d\n",num_words);
    return 0;
}

int yywrap()
{
    return 1;
}
/* Declarations */
%{
    //To Encrypt Plaintext using a key entered by user
    #include<stdio.h>
    int key=0;
%}

/* Translation Rules */
%%
[a-z] {fprintf(yyout, "%c", (*yytext - 'a' + key)%26 + 'a');}
[A-Z] {fprintf(yyout, "%c", (*yytext - 'A' + key)%26 + 'A');}
.|\n {fprintf(yyout,"%s",yytext);}
%%

/* Auxiliary Functions */
int main()
{
    printf("Enter Key Value : ");
    scanf("%d",&key);
    yyin = fopen("input.txt","r");
    yyout = fopen("output.txt","w");
    yylex();
    printf("Encryption Successful\n");
    return 0;
}

int yywrap()
{
    return 1;
}

/* Declarations */
%{ 
    //To count the number of keywords, identifiers in cpp file
    #include<stdio.h> 
    #include<stdbool.h>
    char key[62][20]={"auto","double","int","struct",
    "break","else","long","switch",
    "case","enum","register","typedef",
    "char","extern","return","union",
    "const","float","short","unsigned",
    "continue","for","signed","void",
    "default","goto","sizeof","volatile",
    "do","if","static","while","asm","dynamic_cast","namespace","reinterpret_cast",
    "bool","explicit","new","static_cast",
    "catch","false","operator","template",
    "class","friend","private","this"
    "const_cast","inline","public","throw",
    "delete","mutable","protected","true",
    "try","typeid","typename","using",
    "virtual","wchar_t"};
    int kcounter=0;
    int icounter=0;
    bool found_flag;
%}

/* Regular Definations */
between_quotes ["].*["]
starting_hash  [#].* 
keyword_type   [a-z][a-zA-Z_]+
identifier_type [_a-zA-Z]?[a-zA-Z0-9_]+
special_char    [^a-zA-Z0-9]

/* Translation Rules */
%% 
{between_quotes} ;
{starting_hash} ;
{keyword_type} {found_flag=0;
                  for(int i=0;i<sizeof(key)/sizeof(key[0]);i++)
                   {
                   if(strcmp(key[i],yytext)==0)
                   {  
                    kcounter++;
                    printf("%s is a keyword\n",yytext);
                    found_flag=1;}
                   }
                 if(found_flag==0){icounter++;printf("%s is an identifier\n",yytext);}
                }
{identifier_type} {icounter++;printf(" %s is an identifier\n",yytext);}
{special_char} ;
%% 

/* Auxiliary Functions */ 
int main() 
{ 
    yyin=fopen("input.cpp","r"); 
    yylex(); 
    printf("the count of keywords is %d\n",kcounter);
    printf("the count of identifier is %d\n",icounter);         
}

int yywrap() 
{ 
    return 1; 
}
 
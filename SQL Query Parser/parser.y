/* Declarations */
%{
    #include <stdio.h>
    #include <stdlib.h>
    int yyerror();
    int yylex();
%}
%token ID NUM CREATE TABLE DROP VARCHAR INT CHAR FLOAT
 
%%
    S       : ST1 ';' {    
                            printf("QUERY ACCEPTED");
                            exit(0);
                        }
            ;
            
    ST1     : CREATE TABLE ID '(' rows ')'
            | DROP TABLE ID
            ;
    
    rows        :    ID INT  ',' rows
                |    ID VARCHAR '(' NUM ')' ',' rows
                |    ID INT 
                |    ID VARCHAR '(' NUM ')'
				|	 ID CHAR ',' rows
				|	 ID CHAR
				|	 ID FLOAT ',' rows
				|	 ID FLOAT
                ;
%%

/* Auxiliary Functions */ 
int main()
{
    printf("Enter the query: ");
    yyparse();
	return 0;
}

int yyerror (const char *str) {
    fprintf(stderr, "error: %s\n", str);
    return 1;
}
 
int yywrap() {
    return 1;
}

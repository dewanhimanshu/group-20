%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror();
    int yylex();
    int colCount = 0, valCount = 0;
%}

/* List of Tokens */
%token id
%token number
%token insert
%token into
%token values
%token opening_bracket
%token closing_bracket
%token comma
%token null
%token literal

%%
/* Q is the start symbol */
Q : S {   
        printf("Correct  Query\n"); 
        exit(0);    
      }
    ;
/* Two syntaxs for SQL insert  */
S : insert into TABLE opening_bracket ATTRIBUTE_LIST closing_bracket values opening_bracket VALUE_LIST closing_bracket   {
                                                                            //If Number of Values is not equal to number of columns 
                                                                            if(valCount != colCount){
                                                                                printf("Incorrect  Query \n Count of Values not equal to Count of Columns  \n");
                                                                                return 0;
                                                                            }
                                                                         }
    | insert into TABLE values opening_bracket VALUE_LIST closing_bracket
    ;
/* Attribute List can be identifier or literal (More than one times seperated by comma) */
ATTRIBUTE_LIST : id comma ATTRIBUTE_LIST { colCount++; }
               | id { colCount++; }
               | literal comma ATTRIBUTE_LIST { colCount++; }
               | literal
               ;

/* Value List can be identifier , literal , number or nulls  (More than one times seperated by comma) */
VALUE_LIST : id comma VALUE_LIST {valCount++;}
           | id  {valCount++;}
           | number comma VALUE_LIST  {valCount++;}
           | number {valCount++;}  
           | null comma VALUE_LIST {valCount++;} 
           | null {valCount++;}
           | literal comma VALUE_LIST{ valCount++; }
           | literal { valCount++; }
           ;
/* Table Name should be Identifier */
TABLE : id 
      ;
%%
int main()
{
    printf("Enter the Insert Query:\n");
    yyparse();
}
void yyerror () {
    /*This function is called when incorrect query is entered*/
    printf("Incorrect  Query ");
}


 %{
#include <stdio.h>
#include <stdio.h>
extern int yylex();
%}

%token ID PP LS RS LB RB NUMBER SEMI PTR NL SPACE CLB CRB //all tokens 
%%
/*ID -Identifier
PP- ++
LS- left shift operator
RS- right shift operator
LB- '('
RB- ')'
SEMI- ';'
PTR- for pointer
NL - end of line
CLB - '{'
CRB - '}'  
*/
statement: expr SEMI NL{ printf("syntax valid.\n "); //matched string
         return 0;
         }
         | err NL {printf("\n");                    //unmatched string
		return 0;
		}
         ;
expr:CLB X CRB               //expression with { expression } bracket     
    |X                       //expression
    ;
Y:CLB X CRB RB                //bracket sequence or missing problem
 |LB CLB X CRB 
 |LB X CRB
 |CLB X RB
 |LB CLB X CRB RB {yyerror(" bracket sequence error \n");}
 ;
X:PP N                   //++ thenidentifier
  |N PP 			//identifier then ++
  |M LS M               // then number/identifier << then number/identifier
  |M RS M			// then number/identifier >> then number/identifier
  |LB X RB			// brackets (x)
  ;
N:ID             //identifier
 |LB N RB        //brackets (identifiers)
 |LB PTR ID RB   // pointer (*identifiers)
 ;
M:ID 			//identifier
 |NUMBER		//Number
 |LB M RB		//brackets (ID/number)
 ;
/*error handling using yyerror function */

err:PP {yyerror("no match for operator '++' \n");}
   |M SEMI {printf("expression is valid but no operation is performed \n");}
   |LS M {yyerror("no match for operator '<<' \n");}   
   |M LS {yyerror("no match for operator '<<' \n");}
   |M SPACE M  {yyerror("no operator found \n");}
   |RS M {yyerror("no match for operator '>>' \n");}   
   |M RS {yyerror("no match for operator '>>' \n");}
   |X CRB {yyerror(" '{' is missing \n");}
   |CLB X {yyerror(" '}' is missing \n");}
   |X RB {yyerror(" '(' is missing \n");}
   |LB X {yyerror(" ')' is missing \n");}
   |Y    {yyerror(" brackets are not arranged properly \n");}
   |expr {yyerror(" ; is missing \n");}
   ;


%%

int main() {
    yyparse();
    return 0;
}

void yyerror(char* s) 
{
//error display function having argument as string
    fprintf(stderr, "Error: %s\n", s);
}


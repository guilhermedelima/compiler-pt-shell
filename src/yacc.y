%{
#include "pt_spell.h"
%}


%token T_VERB
%token T_WORD
%token T_END
%token T_NUMBER

%start Input

%%

Input:
	| Input line
	;

line:
	T_END
	| sentence T_END
	;

sentence:
	T_NUMBER { printf("NUMBER: %.2f\n", $1); }
	| T_VERB { printf("VERB\n"); }
	| T_VERB T_WORD { printf("VERB NOME\n"); }
	;

%%

void yyerror(char *s){
	printf("ERROR: %s\n", s);
}	

int main(){
	yyparse();
	return 0;
}



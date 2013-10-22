%{
#include "pt_spell.h"
#include "shell_parser.h"
%}


%token T_VERB
%token T_FOLDER
%token T_FILE
%token T_NAME
%token T_END
%token T_NUMBER
%token T_PREPOSITION
%start Input

%%

Input:
	| Input line
	;

line:
	T_END
	| command T_END
	;

command:
	T_NUMBER { printf("NUMBER: %.2f\n", $1); }
	| T_VERB T_FOLDER T_NAME { put_command_1(verb, name); }
	| T_VERB T_FILE T_NAME { put_command_2(verb, name); }
	| T_VERB T_NAME { printf("TODO yet\n"); }
	| T_VERB T_PREPOSITION T_FOLDER T_NAME { put_command_3(verb, name); } 
	;

%%

void yyerror(char *s){
	printf("ERROR: %s\n", s);
}	

int main(){
	yyparse();
	return 0;
}



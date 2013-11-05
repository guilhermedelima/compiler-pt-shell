%{
#include "pt_spell.h"
#include "shell_parser.h"
%}


%token T_VERB
%token T_FOLDER
%token T_FILE
%token T_FILES
%token T_NAME
%token T_END
%token T_NUMBER
%token T_PREPOSITION
%token T_BACK

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

	/* Comandos Simples */
	| T_VERB T_FOLDER T_NAME { put_command_1(verb, name, T_FOLDER); }
	| T_VERB T_FILE T_NAME { put_command_1(verb, name, T_FILE); }
	| T_VERB T_NAME { /*TODO*/; }

	/* Comando cd */
	| T_VERB T_PREPOSITION T_FOLDER T_NAME { put_command_cd(verb, name); } 
	| T_VERB T_PREPOSITION T_FOLDER T_BACK { put_command_cd(verb, NULL); }

	/* Comando cp */
	| T_VERB T_FILE T_NAME T_PREPOSITION T_NAME { /*TODO*/; } /* Esta regra e a mesma das duas abaixo*/
	| T_VERB T_FILE T_NAME T_PREPOSITION T_FOLDER T_NAME { /*TODO*/; }
	| T_VERB T_FILE T_NAME T_PREPOSITION T_FILE T_NAME { /*TODO*/; }

	| T_VERB T_FOLDER T_NAME T_PREPOSITION T_NAME { /*TODO*/; }
	| T_VERB T_FOLDER T_NAME T_PREPOSITION T_FOLDER T_NAME { /*TODO*/; }

	| T_VERB T_FILES copy_names { /*TODO*/; }
	;


copy_names:
	T_NAME { /*TODO*/; }
	| T_NAME copy_names { /*TODO*/; }
	;

%%

void yyerror(char *s){
	printf("ERROR: %s\n", s);
}	

int main(){
	yyparse();
	return 0;
}



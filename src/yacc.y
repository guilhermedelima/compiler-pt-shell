%{
#include "pt_spell.h"
#include "shell_parser.h"

FILE *yyout;
plural_tokens yy_names = {.length = 0};
%}

%union{
	char *str;
	int num;
}

%token <str> T_VERB
%token T_FOLDER
%token T_FOLDERS
%token T_FILE
%token T_FILES
%token <str> T_NAME
%token T_END
%token <num> T_NUMBER
%token T_PREPOSITION
%token T_BACK

%%

Input:
	| Input line
	;

line:
	T_END
	| command T_END
	;

command:
	T_NUMBER { printf("NUMBER: %d\n", $1); }

	/* Comandos Simples */
	| T_VERB T_FOLDER T_NAME { put_command_1($1, $3, T_FOLDER); }
	| T_VERB T_FILE T_NAME { put_command_1($1, $3, T_FILE); }
	| T_VERB T_NAME { /*TODO*/; }

	/* Comando cd */
	| T_VERB T_PREPOSITION T_FOLDER T_NAME { put_command_cd($1, $4); } 
	| T_VERB T_PREPOSITION T_FOLDER T_BACK { put_command_cd($1, NULL); }

	/* Comando cp */
	/* Esta regra e a mesma das duas abaixo*/
	| T_VERB T_FILE T_NAME T_PREPOSITION T_NAME { put_command_cp($1, T_FILE, $3, 0, $5); }

	| T_VERB T_FILE T_NAME T_PREPOSITION T_FOLDER T_NAME { put_command_cp($1, T_FILE, $3, T_FOLDER, $6); }
	| T_VERB T_FILE T_NAME T_PREPOSITION T_FILE T_NAME { put_command_cp($1, T_FILE, $3, T_FILE, $6); }

	| T_VERB T_FOLDER T_NAME T_PREPOSITION T_NAME { put_command_cp($1, T_FOLDER, $3, 0, $5); }
	| T_VERB T_FOLDER T_NAME T_PREPOSITION T_FOLDER T_NAME { put_command_cp($1, T_FOLDER, $3, T_FOLDER, $6); }

	/* Comando cp - Plural */
	| T_VERB T_FILES names T_PREPOSITION T_FOLDER T_NAME { put_command_cp_plural($1, T_FILES, $6); }
	| T_VERB T_FOLDERS names T_PREPOSITION T_FOLDER T_NAME { put_command_cp_plural($1, T_FOLDERS, $6); }
	;


names:
	T_NAME { add_name($1); }
	| T_NAME names { add_name($1); }
	;

%%

void yyerror(char *s){
	printf("ERROR: %s\n", s);
}	

int main(int argc, char *argv[]){

	switch(argc){
		case 1:
			yyin = stdin;
			yyout = stdout;
			break;
		case 3:{
				yyin = fopen(argv[1], "r");
				yyout = fopen(argv[2], "w");

				if(!yyin || !yyout){
					fprintf(stderr, "Failed to open %s or create %s\n", argv[1], argv[2]);
					exit(-1);
				}

				break;
			}
		default:
			fprintf(stderr, "Correc Usage: %s <Source File> <Generated File>\n", argv[0]);
			exit(-1);
			break;
	}
	yyparse();
	fclose(yyout);
	return 0;
}



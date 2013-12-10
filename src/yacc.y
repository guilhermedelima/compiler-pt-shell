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
%token <str> T_FOLDER
%token <str> T_FOLDERS
%token <str> T_FILE
%token <str> T_FILES
%token <str> T_NAME
%token T_END
%token <num> T_NUMBER
%token <str> T_PREPOSITION
%token <str> T_REPLACE
%token <str> T_BACK
%token <str> T_PHRASE
%token <str> T_LOCATION
%token <str> T_LOCATIONS
%token <str> T_REGEX
%token <str> T_PIPE

%type <str> command
%type <str> left_simple
%type <str> left_cd
%type <str> left_cp
%type <str> left_grep
%type <str> left_sed

%%

Input:
	| Input line
	;

line:
	T_END
	| command T_END { new_line(); }
	| command T_PIPE pipe_rule T_END { check_left_command($1); new_line(); }
	;

command:
	T_NUMBER { printf("NUMBER: %d\n", $1); }
	| left_simple { $$ = $1; }
	| left_cd { $$ = $1; }
	| left_cp { $$ = $1; }
	| left_grep { $$ = $1; }
	| left_sed { $$ = $1; }
	;	

names:
	T_NAME { add_name($1); }
	| T_NAME names { add_name($1); }
	;

left_simple:
	T_VERB T_FOLDER names { $$ = put_command_simple($1, T_FOLDER); }
	| T_VERB T_FILE names { $$ = put_command_simple($1, T_FILE); }

	| T_VERB T_FOLDERS names { $$ = put_command_simple($1, T_FOLDERS); }
	| T_VERB T_FILES names { $$ = put_command_simple($1, T_FILES); }
	;

left_cd:
	T_VERB T_PREPOSITION T_FOLDER T_NAME { $$ = put_command_cd($1, $4); } 
	| T_VERB T_PREPOSITION T_FOLDER T_BACK { $$ = put_command_cd($1, NULL); }
	;
	
left_cp:
	T_VERB T_FILE T_NAME T_PREPOSITION T_NAME { $$ = put_command_cp($1, T_FILE, $3, 0, $5); }

	| T_VERB T_FILE T_NAME T_PREPOSITION T_FOLDER T_NAME { $$ = put_command_cp($1, T_FILE, $3, T_FOLDER, $6); }
	| T_VERB T_FILE T_NAME T_PREPOSITION T_FILE T_NAME { $$ = put_command_cp($1, T_FILE, $3, T_FILE, $6); }

	| T_VERB T_FOLDER T_NAME T_PREPOSITION T_NAME { $$ = put_command_cp($1, T_FOLDER, $3, 0, $5); }
	| T_VERB T_FOLDER T_NAME T_PREPOSITION T_FOLDER T_NAME { $$ = put_command_cp($1, T_FOLDER, $3, T_FOLDER, $6); }

	| T_VERB T_FILES names T_PREPOSITION T_FOLDER T_NAME { $$ = put_command_cp_plural($1, T_FILES, $6); }
	| T_VERB T_FOLDERS names T_PREPOSITION T_FOLDER T_NAME { $$ = put_command_cp_plural($1, T_FOLDERS, $6); }
	;

left_grep:
	T_VERB T_PHRASE T_REGEX T_LOCATION T_FILE names { $$ = put_command_grep($1, $3, T_FILE); }
	| T_VERB T_PHRASE T_REGEX T_LOCATION T_FOLDER names { $$ = put_command_grep($1, $3, T_FOLDER); }

	| T_VERB T_PHRASE T_REGEX T_LOCATIONS T_FILES names { $$ = put_command_grep($1, $3, T_FILES); }
	| T_VERB T_PHRASE T_REGEX T_LOCATIONS T_FOLDERS names { $$ = put_command_grep($1, $3, T_FOLDERS); }
	;

left_sed:
	T_VERB T_PHRASE T_REGEX T_REPLACE T_REGEX T_LOCATION T_FILE names { $$ = put_command_sed($1, $3, $5, T_FILE); }

	| T_VERB T_PHRASE T_REGEX T_REPLACE T_REGEX T_LOCATIONS T_FILES names { $$ = put_command_sed($1, $3, $5, T_FILES); }
	;

pipe_rule:
	pipe_command
	| pipe_command T_PIPE pipe_rule
	;

pipe_command:
	pipe_grep
	| pipe_sed
	;

pipe_grep:
	T_VERB T_PHRASE T_REGEX { put_command_pipe_grep($1, $3); }
	;

pipe_sed:
	T_VERB T_PHRASE T_REGEX T_REPLACE T_REGEX { put_command_pipe_sed($1, $3, $5); }
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



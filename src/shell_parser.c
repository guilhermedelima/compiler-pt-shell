#include "shell_parser.h"

void put_command_1(char *verb, char *name, int token_type){

	char *command;

	if(!strcmp(verb, "mostrar") || !strcmp(verb, "exibir") || !strcmp(verb, "ver"))
		command = (token_type == T_FOLDER) ? "ls -a" : "cat";
	else if(!strcmp(verb, "criar") || !strcmp(verb, "gerar"))
		command = (token_type == T_FOLDER) ? "mkdir" : "touch";
	else if(!strcmp(verb, "remover") || !strcmp(verb, "apagar"))
		command = (token_type == T_FOLDER) ? "rm -R" : "rm";
	else{
		yyerror("There's no command to this verb\n");
		exit(-1);
	}

	printf("%s %s\n", command, name);

}

void put_command_cd(char *verb, char *name){
	
	char *command;
	command = NULL;

	if(!strcmp(verb, "ir") || !strcmp(verb, "mudar") || (!strcmp(verb, "voltar") && !name) )
			command = "cd";
	else{
		yyerror("There's no command to this verb\n");
		exit(-1);
	}

	printf("%s %s\n", command, (name) ? name : "..");
}



#include "shell_parser.h"

void put_command_1(char *verb, char *name){

	char *command;

	if(!strcmp(verb, "mostrar") || !strcmp(verb, "exibir") || !strcmp(verb, "ver"))
		command = "ls -a";
	else if(!strcmp(verb, "criar") || !strcmp(verb, "gerar"))
		command = "mkdir";
	else if(!strcmp(verb, "remover") || !strcmp(verb, "apagar"))
		command = "rm -R";
	else{
		yyerror("There's no command to this verb\n");
		exit(-1);
	}

	printf("%s %s\n", command, name);

}

void put_command_2(char *verb, char *name){

	char *command;

	if(!strcmp(verb, "mostrar") || !strcmp(verb, "exibir") || !strcmp(verb, "ver"))
		command = "cat";
	else if(!strcmp(verb, "criar") || !strcmp(verb, "gerar"))
		command = "touch";
	else if(!strcmp(verb, "remover") || !strcmp(verb, "apagar"))
		command = "rm";
	else{
		yyerror("There's no command to this verb\n");
		exit(-1);
	}

	printf("%s %s\n", command, name);

}

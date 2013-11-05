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

	fprintf(yyout, "%s %s\n", command, name);

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

	fprintf(yyout, "%s %s\n", command, (name) ? name : "..");
}

//Copiar Arquivo "/home/x" para "y"			cp /home/x y
//Copiar Arquivo "/home/x" para diretorio "/opt"	cp /home/x /opt/x
//Copiar Arquivo "/home/x" para Arquivo "y"		cp /home/x y

//Copiar Diretorio "/home/text" para "/opt"		cp -r /home/test /opt/text
//Copiar Diretorio "/home/text" para Diretorio "/opt"	cp -r /home/text /opt/text"

void put_command_cp(char *verb, int s_token, char *source, int t_token, char *target){

	char *command;
	char new_target[MAX_VECTOR];

	if(!strcmp(verb, "copiar")){
	
		command = (s_token == T_FILE) ? "cp" : "cp -R";

		strcpy(new_target, target);

		if(s_token == T_FOLDER || t_token == T_FOLDER){
			char *name = get_filename(source);

			strcat(new_target, "/");
			strcat(new_target, name);

			free(name);
		}

	}else{
		yyerror("There's no command to this verb\n");
		exit(-1);
	}

	fprintf(yyout, "%s %s %s\n", command, source, new_target);
}

//Copiar Arquivos /home/arq1 /etc/arq2 /sys/arq3 para diretorio /opt		cp /home/arq1/ /etc/arq2 /opt 
//Copiar diretorios /home/dir1 /etc/dir2 /sys/dir3 para diretorio /opt 		cp -R /home/dir1 /home/dir2 /opt 
void put_command_cp_plural(char *verb, int s_token, char *target){

	char *command;

	if(!strcmp(verb, "copiar")){
	
		command = (s_token == T_FILES) ? "cp" : "cp -R";
		fprintf(yyout, "%s ", command);

		int i;
		for(i=0; i<yy_names.length; i++)
			fprintf(yyout, "%s ", yy_names.list[i]);

		fprintf(yyout, "%s\n", target);

	}else{
		yyerror("There's no command to this verb\n");
		exit(-1);
	}

	yy_names.length = 0;
}



void add_name(char *token){

	yy_names.list[yy_names.length] = token;
	yy_names.length++;

}

char *get_filename(char *full_path){

	char *str, *tmp, buffer[MAX_VECTOR];
	str = strdup(full_path);

	for(tmp = strtok(str, "/"); tmp; tmp = strtok(NULL, "/"))
		strcpy(buffer, tmp);

	free(str);
	return strdup(buffer);
}


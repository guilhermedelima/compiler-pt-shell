#include "shell_parser.h"

/*
  Função que traduz comandos básicos tanto para plural como para singular.
*/
void put_command_simple(char *verb, int token_type){

	char *command;

	if( check_agreement(token_type) == FALSE ){
		yyerror("Use correct form of plural and singular");
		exit(-1);
	}

	if(!strcmp(verb, "mostrar") || !strcmp(verb, "exibir") || !strcmp(verb, "ver"))
		command = (token_type == T_FOLDER || token_type == T_FOLDERS) ? "ls -a" : "cat";
	else if(!strcmp(verb, "criar") || !strcmp(verb, "gerar"))
		command = (token_type == T_FOLDER || token_type == T_FOLDERS) ? "mkdir" : "touch";
	else if(!strcmp(verb, "remover") || !strcmp(verb, "apagar"))
		command = (token_type == T_FOLDER || token_type == T_FOLDERS) ? "rm -R" : "rm";
	else{
		yyerror("There's no command to this verb\n");
		exit(-1);
	}

	fprintf(yyout, "%s ", command);
	print_names();
	fprintf(yyout, "\n");
}

/*
  Função que traduz comando cd - Apenas singular.
*/
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

/*
	Função para traduzir comando cp no singular. São trados os seguintes casos:

	Copiar Arquivo "/home/x" para "y"			cp /home/x y
	Copiar Arquivo "/home/x" para diretorio "/opt"		cp /home/x /opt/x
	Copiar Arquivo "/home/x" para Arquivo "y"		cp /home/x y

	Copiar Diretorio "/home/text" para "/opt"		cp -r /home/test /opt/text
	Copiar Diretorio "/home/text" para Diretorio "/opt"	cp -r /home/text /opt/text"
*/
void put_command_cp(char *verb, int s_token, char *source, int t_token, char *target){

	char *command;
	char new_target[MAX_VECTOR];

	if(!strcmp(verb, "copiar"))
		command = (s_token == T_FILE) ? "cp" : "cp -R";
	else{
		yyerror("There's no command to this verb\n");
		exit(-1);
	}

	strcpy(new_target, target);

	if(s_token == T_FOLDER || t_token == T_FOLDER){
		char *name = get_filename(source);
		strcat(new_target, "/");
		strcat(new_target, name);
		free(name);
	}

	fprintf(yyout, "%s %s %s\n", command, source, new_target);
}

/*
	Função para traduzir comando cp no Plural. São trados os seguintes casos:

	Copiar Arquivos /home/arq1 /etc/arq2 /sys/arq3 para diretorio /opt	cp /home/arq1/ /etc/arq2 /opt 
	Copiar diretorios /home/dir1 /etc/dir2 /sys/dir3 para diretorio /opt	cp -R /home/dir1 /home/dir2 /opt 
*/
void put_command_cp_plural(char *verb, int s_token, char *target){

	char *command;

	if( check_agreement(s_token) == FALSE ){
		yyerror("Use correct form of plural and singular");
		exit(-1);
	}

	if(!strcmp(verb, "copiar"))
		command = (s_token == T_FILES) ? "cp" : "cp -R";
	else{
		yyerror("There's no command to this verb\n");
		exit(-1);
	}

	fprintf(yyout, "%s ", command);
	print_names();
	fprintf(yyout, "%s\n", target);
}


/*
  Função que traduz comando grep tanto para plural como para singular.
*/
void put_command_grep(char *verb, char *regex, int token_type){

	char *command;

	if( check_agreement(token_type) == FALSE ){
		yyerror("Use correct form of plural and singular");
		exit(-1);
	}

	if(!strcmp(verb, "buscar") || !strcmp(verb, "encontrar") || !strcmp(verb, "filtrar"))
		command = (token_type == T_FILE || token_type == T_FILES) ? "grep" : "grep -r";
	else{
		yyerror("There's no command to this verb\n");
		exit(-1);
	}

	fprintf(yyout, "%s -i %s ", command, regex);
	print_names();
	fprintf(yyout, "\n");
}

void add_name(char *token){
	yy_names.list[yy_names.length] = token;
	yy_names.length++;
}

void print_names(){

	int i;
	for(i=0; i<yy_names.length; i++){
		fprintf(yyout, "%s ", yy_names.list[i]);		
		free(yy_names.list[i]);
	}	

	yy_names.length = 0;
}

boolean check_agreement(int token_type){

	boolean isSingularOk, isPluralOk;

	isSingularOk = (yy_names.length!=1 && (token_type==T_FOLDER || token_type==T_FILE)) ? FALSE : TRUE;
	isPluralOk = (yy_names.length<2 && (token_type==T_FOLDERS || token_type==T_FILES)) ? FALSE : TRUE;

	return (!isSingularOk || !isPluralOk) ? FALSE : TRUE;
}

char *get_filename(char *full_path){

	char *str, *tmp, buffer[MAX_VECTOR];
	str = strdup(full_path);

	for(tmp = strtok(str, "/"); tmp; tmp = strtok(NULL, "/"))
		strcpy(buffer, tmp);

	free(str);
	return strdup(buffer);
}


#include "shell_parser.h"

/*
  Função que traduz comandos básicos tanto para plural como para singular.
*/
char *put_command_simple(char *verb, int token_type){

	char *command;

	if( check_agreement(token_type) == FALSE ){
		yyerror("Use correct form of plural and singular");
	}

	if(!strcmp(verb, "mostrar") || !strcmp(verb, "exibir") || !strcmp(verb, "ver"))
		command = (token_type == T_FOLDER || token_type == T_FOLDERS) ? "ls -a" : "cat";
	else if(!strcmp(verb, "criar") || !strcmp(verb, "gerar"))
		command = (token_type == T_FOLDER || token_type == T_FOLDERS) ? "mkdir" : "touch";
	else if(!strcmp(verb, "remover") || !strcmp(verb, "apagar"))
		command = (token_type == T_FOLDER || token_type == T_FOLDERS) ? "rm -R" : "rm";
	else if(!strcmp(verb, "listar") && (token_type == T_FOLDER || token_type == T_FOLDERS))
		command = "ls -a";
	else{
		yyerror("There's no command to this verb\n");
	}

	fprintf(yyout, "%s", command);
	print_names();

	return strdup(command);
}

/*
  Função que traduz comando cd - Apenas singular.
*/
char *put_command_cd(char *verb, char *name){
	
	char *command;
	command = NULL;

	if(!strcmp(verb, "ir") || !strcmp(verb, "mudar") || (!strcmp(verb, "voltar") && !name) )
		command = "cd";
	else{
		yyerror("There's no command to this verb\n");
	}

	fprintf(yyout, "%s %s", command, (name) ? name : "..");

	return strdup(command);
}

/*
	Função para traduzir comando cp no singular. São trados os seguintes casos:

	Copiar Arquivo "/home/x" para "y"			cp /home/x y
	Copiar Arquivo "/home/x" para diretorio "/opt"		cp /home/x /opt/x
	Copiar Arquivo "/home/x" para Arquivo "y"		cp /home/x y

	Copiar Diretorio "/home/text" para "/opt"		cp -r /home/test /opt/text
	Copiar Diretorio "/home/text" para Diretorio "/opt"	cp -r /home/text /opt/text"
*/
char *put_command_cp(char *verb, int s_token, char *source, int t_token, char *target){

	char *command;
	char new_target[MAX_VECTOR];

	if(!strcmp(verb, "copiar"))
		command = (s_token == T_FILE) ? "cp" : "cp -R";
	else{
		yyerror("There's no command to this verb\n");
	}

	strcpy(new_target, target);

	if(s_token == T_FOLDER || t_token == T_FOLDER){
		char *name = get_filename(source);

		if(new_target[strlen(new_target)-1] != '/')
			strcat(new_target, "/");

		strcat(new_target, name);
		free(name);
	}

	fprintf(yyout, "%s %s %s", command, source, new_target);

	return strdup(command);
}

/*
	Função para traduzir comando cp no Plural. São trados os seguintes casos:

	Copiar Arquivos /home/arq1 /etc/arq2 /sys/arq3 para diretorio /opt	cp /home/arq1/ /etc/arq2 /opt 
	Copiar diretorios /home/dir1 /etc/dir2 /sys/dir3 para diretorio /opt	cp -R /home/dir1 /home/dir2 /opt 
*/
char *put_command_cp_plural(char *verb, int s_token, char *target){

	char *command;

	if( check_agreement(s_token) == FALSE ){
		yyerror("Use correct form of plural and singular");
	}

	if(!strcmp(verb, "copiar"))
		command = (s_token == T_FILES) ? "cp" : "cp -R";
	else{
		yyerror("There's no command to this verb\n");
	}

	fprintf(yyout, "%s", command);
	print_names();
	fprintf(yyout, " %s", target);

	return strdup(command);
}


/*
  Função que traduz comando grep tanto para plural como para singular.
*/
char *put_command_grep(char *verb, char *regex, int token_type){

	char *command;

	if( check_agreement(token_type) == FALSE ){
		yyerror("Use correct form of plural and singular");
	}

	if(!strcmp(verb, "buscar") || !strcmp(verb, "encontrar") || !strcmp(verb, "filtrar"))
		command = (token_type == T_FILE || token_type == T_FILES) ? "grep -i" : "grep -r -i";
	else{
		yyerror("There's no command to this verb\n");
	}

	fprintf(yyout, "%s %s", command, regex);
	print_names();

	return strdup(command);
}

char *put_command_sed(char *verb, char *regex_find, char *regex_replace, int token_type){

	char *command, *rc1, *rc2;

	if( check_agreement(token_type) == FALSE){
		yyerror("Use correct form of plural and singular");
	}

	if(!strcmp(verb, "substituir") || !strcmp(verb, "trocar"))
		command = "sed";
	else{
		yyerror("There's no command to this verb\n");
	}

	rc1 = get_text_regex(regex_find);
	rc2 = get_text_regex(regex_replace);

	fprintf(yyout, "%s \"s/%s/%s/g\"", command, rc1, rc2);	
	print_names();

	free(rc1);
	free(rc2);

	return strdup(command);
}

/* */

void check_left_command(char *command){

	boolean isValidPipe;
	isValidPipe = check_pipe(command);

	if(isValidPipe == FALSE){
		yyerror("Invalid verb to the left side of sentence\n");
	}

}


void put_command_pipe_grep(char *verb, char *regex){

	char *command;

	if(!strcmp(verb, "buscar") || !strcmp(verb, "encontrar") || !strcmp(verb, "filtrar"))
		command = "grep";
	else{
		yyerror("There's no command to this verb\n");
	}

	fprintf(yyout, " | %s %s", command, regex);
}


void put_command_pipe_sed(char *verb, char *regex_find, char *regex_replace){

	char *command, *rc1, *rc2;

	if(!strcmp(verb, "substituir") || !strcmp(verb, "trocar"))
		command = "sed";
	else{
		yyerror("There's no command to this verb\n");
	}

	rc1 = get_text_regex(regex_find);
	rc2 = get_text_regex(regex_replace);

	fprintf(yyout, " | %s \"s/%s/%s/g\"", command, rc1, rc2);

	free(rc1);
	free(rc2);
}


/* */

void new_line(){
	fprintf(yyout, "\n");
}

void add_name(char *token){
	yy_names.list[yy_names.length] = token;
	yy_names.length++;
}

void print_names(){

	int i;
	for(i=0; i<yy_names.length; i++){
		fprintf(yyout, " %s", yy_names.list[i]);		
		free(yy_names.list[i]);
	}	

	yy_names.length = 0;
}

void add_comment(char *token){
	yy_comment.list[yy_comment.length] = token;
	yy_comment.length++;
}

void print_comment(){
	
	int i;
	if(yyout_name){

		fprintf(yyout, "#");

		for(i=0; i<yy_comment.length; i++){
			fprintf(yyout, " %s", yy_comment.list[i]);
			free(yy_comment.list[i]);
		}

		fprintf(yyout, "\n\n");
	}else{

		for(i=0; i<yy_comment.length; i++){
			free(yy_comment.list[i]);
		}
	}

	yy_comment.length = 0;
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

char *get_text_regex(char *regex){

	int length;
	char *new_regex;

	length = (int)strlen(regex) - 2;
	new_regex = (char *) calloc(length, sizeof(char));
	strncpy(new_regex, regex+1, length);

	return new_regex;
}









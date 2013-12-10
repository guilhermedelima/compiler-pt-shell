#ifndef SHELL_PARSER_H
#define SHELL_PARSER_H


#include "pt_spell.h"

#define START_MESSAGE "#!/bin/bash\n# PT-SHELL Compiler - GNU GENERAL PUBLIC LICENSE V2\n"


typedef struct{
	char *list[MAX_VECTOR];
	int length;
}plural_tokens;

extern plural_tokens yy_names;
extern plural_tokens yy_comment;

extern char *put_command_simple(char *verb, int token_type);
extern char *put_command_cd(char *verb, char *name);
extern char *put_command_cp(char *verb, int s_token, char *source, int t_token, char *target);
extern char *put_command_cp_plural(char *verb, int s_token, char *target);
extern char *put_command_grep(char *verb, char *regex, int token_type);
extern char *put_command_sed(char *verb, char *regex_find, char *regex_replace, int token_type);

extern void check_left_command(char *command);
extern void put_command_pipe_grep(char *verb, char *regex);
extern void put_command_pipe_sed(char *verb, char *regex_find, char *regex_replace);

extern void new_line();

extern void add_name(char *names);
extern void print_names();
extern void add_comment(char *token);
extern void print_comment();

extern char *get_text_regex(char *regex);
extern char *get_filename(char *full_path);
extern boolean check_agreement(int token_type);


#endif

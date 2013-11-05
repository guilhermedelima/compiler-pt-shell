#ifndef SHELL_PARSER_H
#define SHELL_PARSER_H


#include "pt_spell.h"

typedef struct{
	char *list[MAX_VECTOR];
	int length;
}plural_tokens;

extern plural_tokens yy_names;

extern void put_command_1(char *verb, char *name, int token_type);
extern void put_command_cd(char *verb, char *name);
extern void put_command_cp(char *verb, int s_token, char *source, int t_token, char *target);
extern void put_command_cp_plural(char *verb, int s_token, char *target);

extern void add_name(char *names);
extern char *get_filename(char *full_path);



#endif

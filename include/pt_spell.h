#ifndef PT_SPELL_H
#define PT_SPELL_H

#define YYSTYPE double

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <postgresql/libpq-fe.h>
#include "y.tab.h"

/*
  bison functions
*/

extern YYSTYPE yylval;

extern int yylex(); 
extern int yyparse(); 
extern void yyerror(char* s);


/*
  pt_spell functions
*/

#define POSTGRESQL_DB "host=localhost user=postgres password=root dbname=dictionary_pt"
#define MAX_VECTOR 256

typedef struct{
	char *name;
	char *command;
}token_verb;

extern char *verb, *name;



extern int find_verb(char *token);
extern char *build_query(char *key);
extern PGconn *connect_postgresql();
extern PGresult *exec_query(char *query, PGconn *connection);
extern void close_postgresql(PGconn *connection);

#endif

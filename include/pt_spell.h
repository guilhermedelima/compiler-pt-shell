#ifndef PT_SPELL_H
#define PT_SPELL_H


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <postgresql/libpq-fe.h>
#include "y.tab.h"

/*
  bison functions
*/

#define YY_NO_INPUT

extern YYSTYPE yylval;

extern FILE *yyin;
extern FILE *yyout;

extern int yylex(); 
extern int yyparse(); 
extern void yyerror(char* s);


/*
  pt_spell functions
*/

typedef enum{
	TRUE=1, FALSE=0
}boolean;

#define POSTGRESQL_DB "host=localhost user=postgres password=root dbname=dictionary_pt"
#define MAX_VECTOR 256


extern int find_verb(char *token);
extern boolean check_pipe(char *command);

extern char *build_query(char *key);
extern char *build_pipe_query(char *command);

extern PGconn *connect_postgresql();
extern PGresult *exec_query(char *query, PGconn *connection);
extern void close_postgresql(PGconn *connection);

#endif

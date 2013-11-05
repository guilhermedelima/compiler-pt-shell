%{
#include "pt_spell.h"

char *verb;
char *name;
%}


/* Definitions */
STRING [a-z\/][a-z0-9\/]*
NUMBER [0-9]*
WHITESPACE [ \t\r]+
FILE arquivo
FILES arquivos
FOLDER diretorio
PREPOSITION para
BACK anterior

%option case-insensitive

%%

{WHITESPACE} { /* Nothing to do */ }

{FILE} {  return T_FILE; }
{FILES} { return T_FILES; }
{FOLDER} { return T_FOLDER; }
{PREPOSITION} { return T_PREPOSITION; }
{BACK} { return T_BACK; }


{STRING} { 	
	return find_verb(yytext);
}

{NUMBER} { 	
	yylval = atoi(yytext);
	return T_NUMBER;
}


"\n" { return T_END; }

%%

int yywrap(){
	return 0;
}




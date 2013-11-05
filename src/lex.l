%{
#include "pt_spell.h"

%}


/* Definitions */
STRING [a-z\/\.][a-z0-9\/\.]*
NUMBER [0-9]*
WHITESPACE [ \t\r]+
FILE arquivo
FILES arquivos
FOLDER diretorio
FOLDERS diretorios
PREPOSITION para
BACK anterior

%option case-insensitive
%option nounput

%%

{WHITESPACE} { /* Nothing to do */ }

{FILE} {  return T_FILE; }
{FILES} { return T_FILES; }
{FOLDER} { return T_FOLDER; }
{FOLDERS} { return T_FOLDERS; }
{PREPOSITION} { return T_PREPOSITION; }
{BACK} { return T_BACK; }
"\n" { return T_END; }

{STRING} { 	
	return find_verb(yytext);
}

{NUMBER} { 	
	yylval.num = atoi(yytext);
	return T_NUMBER;
}

<<EOF>> { 
	yyterminate(); 
}


%%

int yywrap(){
	fclose(yyin);
	return 1;
}




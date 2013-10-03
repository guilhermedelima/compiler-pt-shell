%{
#include "pt_spell.h"

char *verb;
char *name;
%}


/* Definitions */
STRING [a-z][a-z0-9]*
NUMBER [0-9]*
WHITESPACE [ \t\r]+


%%

{WHITESPACE} { /* Nothing to do */ }

{STRING} { 	
	return find_verb(yytext);
}

{NUMBER} { 	
	yylval = atoi(yytext);
	return T_NUMBER;
}

"ARQUIVO" {  return T_FILE; }
"DIRETORIO" { return T_FOLDER; }

"\n" { return T_END; }

%%

int yywrap(){
	return 0;
}




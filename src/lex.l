%{
#include "pt_spell.h"
%}


/* Definitions */
STRING [a-z][a-z0-9]*
NUMBER [0-9]*
WHITESPACE [ \t]



%%

{WHITESPACE} { /* Nothing to do */ }

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




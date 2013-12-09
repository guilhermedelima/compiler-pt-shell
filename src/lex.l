%{
#include "pt_spell.h"

%}


/* Definitions */
STRING [a-z\/\.][a-z0-9\/\.]*
REGEX [\"]([ a-z0-9\/\.][a-z0-9\/\.]*)*[\"]
NUMBER [0-9]*
WHITESPACE [ \t\r]+
FILE arquivo
FILES arquivos
FOLDER diretorio
FOLDERS diretorios
PREPOSITION para
REPLACE por
BACK anterior
PHRASE frase
LOCATION no
LOCATIONS nos
PIPE e

%option case-insensitive
%option nounput

%%

{WHITESPACE} { /* Nothing to do */ }

{FILE} { yylval.str = strdup(yytext); return T_FILE; }
{FILES} { yylval.str = strdup(yytext); return T_FILES; }
{FOLDER} { yylval.str = strdup(yytext); return T_FOLDER; }
{FOLDERS} { yylval.str = strdup(yytext); return T_FOLDERS; }
{PREPOSITION} { yylval.str = strdup(yytext); return T_PREPOSITION; }
{REPLACE} { yylval.str = strdup(yytext); return T_REPLACE; }
{BACK} { yylval.str = strdup(yytext); return T_BACK; }
{PHRASE} { yylval.str = strdup(yytext); return T_PHRASE; }
{LOCATION} { yylval.str = strdup(yytext); return T_LOCATION; }
{LOCATIONS} { yylval.str = strdup(yytext); return T_LOCATIONS; }
{PIPE} { yylval.str = strdup(yytext); return T_PIPE; }
"\n" { return T_END; }

{REGEX} { 
	yylval.str = strdup(yytext);
	return T_REGEX; 
}

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




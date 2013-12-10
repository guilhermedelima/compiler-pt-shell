%{

#include "shell_parser.h"

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
{FILE} { add_comment(strdup(yytext)); return T_FILE; }
{FILES} { add_comment(strdup(yytext)); return T_FILES; }
{FOLDER} { add_comment(strdup(yytext)); return T_FOLDER; }
{FOLDERS} { add_comment(strdup(yytext)); return T_FOLDERS; }
{PREPOSITION} { add_comment(strdup(yytext)); return T_PREPOSITION; }
{REPLACE} { add_comment(strdup(yytext)); return T_REPLACE; }
{BACK} { add_comment(strdup(yytext)); return T_BACK; }
{PHRASE} { add_comment(strdup(yytext)); return T_PHRASE; }
{LOCATION} { add_comment(strdup(yytext)); return T_LOCATION; }
{LOCATIONS} { add_comment(strdup(yytext)); return T_LOCATIONS; }
{PIPE} { add_comment(strdup(yytext)); return T_PIPE; }

"\n" { nLines++; return T_END; }

{REGEX} { 
	add_comment(strdup(yytext));
	yylval.str = strdup(yytext);
	return T_REGEX; 
}

{STRING} { 
	add_comment(strdup(yytext));
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




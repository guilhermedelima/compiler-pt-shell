#include "pt_spell.h"

int find_verb(char *token){	

	char *query;
	int n_lines, token_type;
	PGconn *connection;
	PGresult *result;

	query = build_query(token);
	
	connection = connect_postgresql();
	result = exec_query(query, connection);

	n_lines = PQntuples(result);

	if(n_lines == 1){

		char *result_name;

		result_name = PQgetvalue(result, 0, 0);
		yylval.str = strdup(result_name);

		token_type = T_VERB;

	}else{
		yylval.str = strdup(token);
		token_type = T_NAME;
	}

	PQclear(result);
	close_postgresql(connection);
	free(query);

	return token_type;
}

boolean check_pipe(char *command){

	char *query, *result_bool;
	int n_lines;
	PGconn *connection;
	PGresult *result;
	boolean isPipe;

	query = build_pipe_query(command);

	connection = connect_postgresql();
	result = exec_query(query, connection);

	n_lines = PQntuples(result);

	result_bool = (n_lines == 1) ? PQgetvalue(result, 0, 0) : NULL;
	isPipe = (!result_bool || !strcmp(result_bool, "n")) ? FALSE : TRUE;

	PQclear(result);
	close_postgresql(connection);
	free(query);

	return isPipe;
}

char *build_query(char *key){

	char *query;
	query = (char *) calloc(MAX_VECTOR+1, sizeof(char));

	strcat(query, "select infinitivo from syntax.verbos where split_part(ia, ':', 1) ilike '");
	strcat(query, key);
	strcat(query, "' or split_part(ia, ':', 2) ilike '");
	strcat(query, key);
	strcat(query, "' or split_part(fn, ':', 1) ilike '");
	strcat(query, key);
	strcat(query, "';");
	
	return query;
}

char *build_pipe_query(char *command){

	char *query;
	query = (char *) calloc(MAX_VECTOR+1, sizeof(char));

	strcat(query, "select pipe from syntax.comandos where nome ilike split_part('");
	strcat(query, command);
	strcat(query, "', ' ', 1);");
	free(command);	

	return query;
}

PGconn *connect_postgresql(){

	PGconn *connection;

	connection = PQconnectdb(POSTGRESQL_DB);

	if(PQstatus(connection) != CONNECTION_OK){
		fprintf(stderr, "Error on connect to postgresql: %s\n", PQerrorMessage(connection));
		exit(-1);
	}

	return connection;
}

PGresult *exec_query(char *query, PGconn *connection){

	PGresult *result;
	ExecStatusType status;

	result = PQexec(connection, query);
	status = PQresultStatus(result);

	if(status != PGRES_COMMAND_OK && status != PGRES_TUPLES_OK){
		fprintf(stderr, "Error on exec select at postgresql: %s\n", PQerrorMessage(connection));
		exit(-1);
	}

	return result;

} 


void close_postgresql(PGconn *connection){

	PQfinish(connection);

}









#include "pt_spell.h"

int find_verb(char *token){	

	char *query;
	PGconn *connection;
	PGresult *result;

	query = build_query(token);
	
	connection = connect_postgresql();
	result = exec_query(query, connection);

	printf("Query Result: %s\n", PQgetvalue(result, 0, 0));

	close_postgresql(connection);

	return T_VERB;
}

char *build_query(char *key){

	char *query;
	query = (char *) malloc(MAX_VECTOR * sizeof(char));

	strcat(query, "select infinitivo from syntax.verbos where split_part(ia, ':', 1) like '");
	strcat(query, key);
	strcat(query, "' or split_part(ia, ':', 2) like '");
	strcat(query, key);
	strcat(query, "' or split_part(fn, ':', 1) like '");
	strcat(query, key);
	strcat(query, "';");
	
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
		fprintf(stderr, "Error on exec select at postgresql\n");
		exit(-1);
	}

	return result;

} 


void close_postgresql(PGconn *connection){

	PQfinish(connection);

}









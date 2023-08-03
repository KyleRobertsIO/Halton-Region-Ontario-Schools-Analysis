#!/bin/bash

# Wait for the SQL Server to come up
/wait

echo "Creating DATABASE"

/opt/mssql-tools/bin/sqlcmd -S ${SQL_SERVER_HOST} \
-U ${SQL_SERVER_USERNAME} \
-P ${SQL_SERVER_PASSWORD} \
-d "master" \
-Q 'CREATE DATABASE ontario_schools;'

echo "Creating data model tables"

/opt/mssql-tools/bin/sqlcmd -S ${SQL_SERVER_HOST} \
-U ${SQL_SERVER_USERNAME} \
-P ${SQL_SERVER_PASSWORD} \
-d ${SQL_SERVER_DATABASE} -i/app/sql_scripts/CREATE_DATA_MODEL.sql

echo "Creating staging table"

/opt/mssql-tools/bin/sqlcmd -S ${SQL_SERVER_HOST} \
-U ${SQL_SERVER_USERNAME} \
-P ${SQL_SERVER_PASSWORD} \
-d ${SQL_SERVER_DATABASE} \
-Q 'CREATE SCHEMA staging;'

/opt/mssql-tools/bin/sqlcmd -S ${SQL_SERVER_HOST} \
-U ${SQL_SERVER_USERNAME} \
-P ${SQL_SERVER_PASSWORD} \
-d ${SQL_SERVER_DATABASE} -i/app/sql_scripts/CREATE_STAGING_TABLE.sql
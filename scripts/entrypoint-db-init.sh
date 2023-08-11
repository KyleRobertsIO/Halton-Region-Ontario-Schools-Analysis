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

echo "Creating staging schema"

/opt/mssql-tools/bin/sqlcmd -S ${SQL_SERVER_HOST} \
-U ${SQL_SERVER_USERNAME} \
-P ${SQL_SERVER_PASSWORD} \
-d ${SQL_SERVER_DATABASE} \
-Q 'CREATE SCHEMA staging;'

echo "Creating staging table"

/opt/mssql-tools/bin/sqlcmd -S ${SQL_SERVER_HOST} \
-U ${SQL_SERVER_USERNAME} \
-P ${SQL_SERVER_PASSWORD} \
-d ${SQL_SERVER_DATABASE} -i/app/sql_scripts/CREATE_STAGING_TABLE.sql

echo "Creating functions"

/opt/mssql-tools/bin/sqlcmd -S ${SQL_SERVER_HOST} \
-U ${SQL_SERVER_USERNAME} \
-P ${SQL_SERVER_PASSWORD} \
-d ${SQL_SERVER_DATABASE} -i/app/sql_scripts/CREATE_FUNCTIONS.sql

echo "Creating stored procedures"

/opt/mssql-tools/bin/sqlcmd -S ${SQL_SERVER_HOST} \
-U ${SQL_SERVER_USERNAME} \
-P ${SQL_SERVER_PASSWORD} \
-d ${SQL_SERVER_DATABASE} -i/app/sql_scripts/CREATE_PROCEDURES.sql

echo "Creating views"

/opt/mssql-tools/bin/sqlcmd -S ${SQL_SERVER_HOST} \
-U ${SQL_SERVER_USERNAME} \
-P ${SQL_SERVER_PASSWORD} \
-d ${SQL_SERVER_DATABASE} -i/app/sql_scripts/CREATE_VIEWS.sql

echo "Running data ingestion"

python ./ontario_schools.py

echo "Promoting data to fact table and dimensions"

/opt/mssql-tools/bin/sqlcmd -S ${SQL_SERVER_HOST} \
-U ${SQL_SERVER_USERNAME} \
-P ${SQL_SERVER_PASSWORD} \
-d ${SQL_SERVER_DATABASE} \
-Q 'EXEC [dbo].[PROMOTE_DATA];'
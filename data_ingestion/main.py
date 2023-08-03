import os
from common.database import SQLServerConnectors

def main():
    
    connector = SQLServerConnectors.SQLLoginConnector(
        driver = os.getenv("SQL_SERVER_ODBC_DRIVER"),
        host = os.getenv("SQL_SERVER_HOST"),
        port = int(os.getenv("SQL_SERVER_PORT")),
        database = os.getenv("SQL_SERVER_DATABASE"),
        username = os.getenv("SQL_SERVER_USERNAME"),
        password = os.getenv("SQL_SERVER_PASSWORD"),
        timeout = int(os.getenv("SQL_SERVER_CONNECTION_TIMEOUT")),
        encrypt = eval(os.getenv("SQL_SERVER_USE_TLS"))
    )
    print("Hello World!")

if __name__ == "__main__":
    main()
from sqlalchemy.engine import URL

from abc import ABCMeta, abstractmethod

class BaseConnector(metaclass = ABCMeta):
    def __init__(
            self, 
            driver: str, 
            host: str, 
            port: int, 
            database: str,
            timeout: int,
            encrypt: bool
        ):
            self._driver = driver
            self._host = host
            self._port = port
            self._database = database
            self._timeout = timeout
            self._encrypt = encrypt

    @abstractmethod
    def get_connection_string(self) -> URL:
        pass

class SQLLoginConnector(BaseConnector):
    def __init__(
        self,
        driver: str,
        host: str,
        port: int,
        database: str,
        username: str,
        password: str,
        timeout: int,
        encrypt: bool
    ):
        super().__init__(
            driver = driver,
            host = host, 
            port = port, 
            database = database,
            timeout = timeout,
            encrypt = encrypt
        )
        self._username = username
        self._password = password
    
    def get_connection_string(self) -> URL:
        return URL.create(
            drivername = "mssql+pyodbc",
            username = self._username,
            password = self._password,
            host = self._host,
            port = self._port,
            database = self._database,
            query = {
                "authentication": "SqlPassword",
                "driver": self._driver,
                "encrypt": "yes" if self._encrypt else "no",
                "connection timeout": str(self._timeout)
            }
        )
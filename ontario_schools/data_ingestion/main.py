import os, sys
from typing import List
from logging import Logger
from ontario_schools.common.database import SQLServerConnectors
from ontario_schools.data_ingestion.collector import download_data
from ontario_schools.data_ingestion.types import DataSourceDetail
from ontario_schools.data_ingestion.sources import load_sources
from ontario_schools.data_ingestion.loader import load_data
from ontario_schools.data_ingestion.sql_upload import upload_to_staging
import ontario_schools.data_ingestion.types as types

def create_connector() -> SQLServerConnectors.BaseConnector:
    return SQLServerConnectors.SQLLoginConnector(
        driver = os.getenv("SQL_SERVER_ODBC_DRIVER"),
        host = os.getenv("SQL_SERVER_HOST"),
        port = int(os.getenv("SQL_SERVER_PORT", "1433")),
        database = os.getenv("SQL_SERVER_DATABASE"),
        username = os.getenv("SQL_SERVER_USERNAME"),
        password = os.getenv("SQL_SERVER_PASSWORD"),
        timeout = int(os.getenv("SQL_SERVER_CONNECTION_TIMEOUT", "15")),
        encrypt = True if os.getenv("SQL_SERVER_USE_TLS", "True") == "True" else False
    )

def main():
    logger = Logger("Ontario Schools Data Ingester")
    logger.setLevel("INFO")

    # data_source_details: List[DataSourceDetail] = load_sources(
    #     file_path = "./data_reference.json"
    # )

    # file_refs, download_err = download_data(
    #     data_source_details = data_source_details,
    #     storage_dir = "./data_cache"
    # )
    # if download_err != None:
    #     logger.error(
    #         "failed to download data files; {1}".format(download_err.args)
    #     )
    #     sys.exit(1)

    file_refs = [
        types.DataFileReference(
            path = "./data_cache/provided_dataset.xlsx",
            school_year = "2017-2018"
        )
        # types.DataFileReference(
        #     path = "./data_cache/sif_data_table_2017_2018_en.xlsx",
        #     school_year = "2017-2018"
        # ),
        # types.DataFileReference(
        #     path = "./data_cache/sif_data_table_2018_2019_en.xlsx",
        #     school_year = "2018-2019"
        # ),
        # types.DataFileReference(
        #     path = "./data_cache/sif_data_table_2019_2020_en.xlsx",
        #     school_year = "2019-2020"
        # ),
        # types.DataFileReference(
        #     path = "./data_cache/new_sif_data_table_2020_21prelim_en_june2023.xlsx",
        #     school_year = "2020-2021"
        # )
    ]

    collection = load_data(data_file_references = file_refs)
    connector = create_connector()
    upload_to_staging(connector = connector, data = collection)

    # engine: Engine = create_engine(
    #     url = create_connector().get_connection_string()
    # )
    # try:
    #     conn: Connection = engine.connect()
    # except Exception as conn_err:
    #     logger.error(
    #         "failed to establish connection to database; {0}".format(conn_err.args)
    #     )
    #     sys.exit(1)
    # upload_to_staging(conn = conn)

# if __name__ == "__main__":
#     main()
import wget
from typing import List
from ontario_schools.data_ingestion.types import (
    DataSourceDetail, DataFileReference, FilePath
)


def download_data(
    data_source_details: List[DataSourceDetail], 
    storage_dir: str
) -> tuple[List[DataFileReference], Exception]:
    """
    Attempts to download all the data from the 
    provided DataSourceDetail list to the target 
    storage folder. 
    """
    file_paths: List[DataFileReference] = []
    for source in data_source_details:
        # Attempt download of file
        file_path, download_err = _download_excel(
            url = source.download_link, 
            storage_dir = storage_dir
        )
        # Handle errors
        if download_err != None:
            return (None, download_err)
        
        file_paths.append(
            DataFileReference(
                path = file_path,
                school_year = source.school_year
            )
        )
    return (file_paths, None)

def _download_excel(
    url: str, 
    storage_dir: str
) -> tuple[FilePath, Exception]:
    try:
        file_path: str = wget.download(
            url = url, 
            out = storage_dir
        )
    except Exception as download_err:
        return (None, download_err)
    return (file_path, None)
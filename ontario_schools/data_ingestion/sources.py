import json
from typing import List
from ontario_schools.data_ingestion.types import DataSourceDetail

def load_sources(file_path: str):
    dsd_collection: List[DataSourceDetail] = []

    f = open(file_path, "r")
    raw_source_collection = json.loads(f.read())
    
    for source in raw_source_collection:
        dsd_collection.append(DataSourceDetail(**source))
    return dsd_collection

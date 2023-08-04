import pandas as pd
import polars as pr
from typing import List
from ontario_schools.data_ingestion.types import DataFileReference

def load_data(
    data_file_references: List[DataFileReference]
) -> List[dict]:
    collection: List[dict] = []
    for ref in data_file_references:
        current_df = pr.read_excel(ref.path)
        #current_df: pd.DataFrame = pd.read_excel(ref.path)

        # Append school year to data frame
        current_df['school_year'] = ref.school_year
        # Combined data frame with master
        collection = collection + current_df.to_dict("records")
    return collection
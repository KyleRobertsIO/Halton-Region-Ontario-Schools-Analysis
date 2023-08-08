import pandas as pd
import polars as pl
from typing import List
from ontario_schools.data_ingestion.types import DataFileReference

def load_data(
    data_file_references: List[DataFileReference]
) -> List[dict]:
    # collection: List[dict] = []
    master_df = pl.DataFrame()
    for ref in data_file_references:
        # Reads Excel and converts to CSV then loads dataframe into memory
        sheets: dict = pl.read_excel(
            source = ref.path,
            sheet_id = 0,
            xlsx2csv_options = { "skip_empty_lines": True },
            read_csv_options = { "has_header": True, "infer_schema_length": 0 }
        )
        # Find the sheet name for dict reference lookup
        current_df = sheets.get(list(sheets.keys())[0])
        del sheets
        # Append school year and convert to dict for collection of dicts
        current_df = current_df.with_columns(school_year = pl.lit("2018-2019"))
        if master_df.is_empty():
            master_df = current_df
        else:
            master_df = pl.concat([master_df, current_df], rechunk = True)
    return master_df.to_dicts()
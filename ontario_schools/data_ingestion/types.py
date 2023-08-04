from dataclasses import dataclass

class FilePath(str):
    def __str__(self):
        return self

@dataclass
class DataSourceDetail:
    school_year: str
    download_link: str

@dataclass
class DataFileReference:
    path: FilePath
    school_year: str
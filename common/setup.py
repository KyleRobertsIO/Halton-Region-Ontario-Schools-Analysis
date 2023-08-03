import os.path
import re
from setuptools import find_packages, setup

PACKAGE_NAME = "common"
PACKAGE_PPRINT_NAME = "Common Tools"

package_folder_path = "."

# Version extraction inspired from 'requests'
with open(os.path.join(package_folder_path, 'version.py')
          if os.path.exists(os.path.join(package_folder_path, 'version.py'))
          else os.path.join(package_folder_path, '_version.py'), 'r') as fd:
    version = re.search(r'^VERSION\s*=\s*[\'"]([^\'"]*)[\'"]',
                        fd.read(), re.MULTILINE).group(1)

setup(
    name = PACKAGE_NAME,
    version = version,
    description = "Ingestion of data from Ontario open data website.",
    license = "MIT License",
    author = "Kyle Roberts",
    author_email = "admin@kyleroberts.tech",
    url = "https://github.com/KyleRobertsIO/Halton-Region-Ontario-Schools-Analysis",
    keywords = "python, data, analytics",
    packages = find_packages(exclude=[
        'tests'
    ]),
    include_package_data = True,
    install_requires=[
        "sqlalchemy>=2.0.19"
    ],
    python_requires=">=3.10"
)
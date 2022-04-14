# CYBELE Metadata REST API
This repository comprises all the different pre-defined queries that are being used to generate the CYBELE data discovery REST API on the fly.

The operations supported can be classified in two groups. 

The first group includes the methods that allow specifying the testbed to use for the query by defining the default graph to be used for querying at Virtuoso (note: a separate graph is used for each testbed):

|Input: endpoint (string), endpoint for SPARQL query (optional). The testbed can be specified adding the parameter ?default-graph-uri in the URL, e.g., https://www.foodie-cloud.org/sparql?default-graph-uri=https://w3id.org/cybele/datasets/PSNC
| - |
The supported methods are:

- GET /allDatasets: retrieve all information about CYBELE datasets, with full structure and including information about referenced objects (e.g., measurements, dimensions, temporal and spatial information, etc.)
- GET /allDatasetsIDs: retrieve the IDs of all CYBELE datasets 
- GET /allDatasets\_flat: retrieve all the information about CYBELE datasets as a flat list (information about referenced resources can be retrieved with the /getResource method) 
- GET /allmetadata: retrieve all information about CYBELE objects (datasets, agents, periodOfTime, etc.)
- GET /getByKeyword: Retrieve all the information about CYBELE datasets including the provided keyword, e.g., greece, in the dataset title or connected resources' labels
  - Input: keyword (string)
- GET /getDatasetDBDistribution: Retrieve the database distribution information about a particular dataset (e.g., <https://w3id.org/cybele/dataset/id/dataset_2>)
  - Input: resource (IRI)
- GET /getDatasetSpatialInfo: Retrieve the spatial information about a particular dataset (e.g., <https://w3id.org/cybele/dataset/id/dataset_2>)
  - Input: resource (IRI)
- GET /getDatasetStructure: Retrieve the structure information about a particular dataset (e.g., <https://w3id.org/cybele/dataset/id/dataset_2>)
  - Input: resource (IRI)
- GET /getResource retrieve all information about a particular resource (e.g. dataset (https://w3id.org/cybele/dataset/id/bd2c8216-fd62-4740-92b4-39511af4336c), publisher (https://w3id.org/cybele/agent/id/8f6332ab-bb45-4199-a339-3f2710d4070d), etc.)
  - Input: resource (IRI)

The second group includes the methods that allow specifying the testbed to use for the query using the parameter:

|Input: testbed (string)|
| - |
The methods are exactly as the ones above, but with the suffix \_testbed, e.g., allDatasets\_testbed, getByKeyword\_testbed, getResource\_testbed
## Updates in final release
In the final release of the Data Semantic Alignment & Enrichment service several improvements and updates have been introduced that are mainly related to the support of the final version of the CYBELE Common Semantic Model. The updates are summarized to the following:

- Support of new metadata including the License, media type, byte size.
- Support of structural metadata (dimensions, measures).
- Support of metadata related to the DB access at the data storage (these metadata enable the formulation and execution of SQL queries by the Advanced Query Builder).
- Support of metadata related to the distinction/separation between different testbeds.
- Support of enhanced spatial metadata (i.e. polygons) to enable advanced spatial search of data.
- Inclusion of new methods for the searching, filtering and retrieval of metadata.

## Software package repository and services

Virtuoso endpoint for CYBELE is at <https://www.foodie-cloud.org/sparql> 

Endpoint of the metadata REST API: <http://grlc.io/api-git/cybele-project/metadata/> 




Cite as

> Palma R., Janiak B., Zegnis D. (2022) Cybele data discovery API queries. Cybele project. https://github.com/cybele-project/metadata/ 


Shield: [![CC BY NC SA 3.0 IGO][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 3.0 IGO][cc-by].

[![CC BY NC SA 3.0 IGO][cc-by-image]][cc-by]

[cc-by]: https://creativecommons.org/licenses/by-nc-sa/3.0/igo/
[cc-by-image]: https://licensebuttons.net/l/by/3.0/igo/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%20NC%20SA%203.0%20IGO-lightgrey.svg

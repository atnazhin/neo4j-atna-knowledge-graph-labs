// NOTE: The following script syntax is valid for database version 5.0 and above.

:param {
  // Define the file path root and the individual file names required for loading.
  // https://neo4j.com/docs/operations-manual/current/configuration/file-locations/
  file_path_root: 'file:///', // Change this to the folder your script can access the files at.
  file_0: 'earthquake_data_tsunami.csv'
};

// CONSTRAINT creation
// -------------------
//
// Create node uniqueness constraints, ensuring no duplicates for the given node label and ID property exist in the database. This also ensures no duplicates are introduced in future.
//
CREATE CONSTRAINT `magnitude_Earthquake_uniq` IF NOT EXISTS
FOR (n: `Earthquake`)
REQUIRE (n.`magnitude`) IS UNIQUE;
CREATE CONSTRAINT `latitude_Location_uniq` IF NOT EXISTS
FOR (n: `Location`)
REQUIRE (n.`latitude`) IS UNIQUE;
CREATE CONSTRAINT `tsunami_TsunamiRisk_uniq` IF NOT EXISTS
FOR (n: `TsunamiRisk`)
REQUIRE (n.`tsunami`) IS UNIQUE;

:param {
  idsToSkip: []
};

// NODE load
// ---------
//
// Load nodes in batches, one node label at a time. Nodes will be created using a MERGE statement to ensure a node with the same label and ID property remains unique. Pre-existing nodes found by a MERGE statement will have their other properties set to the latest values encountered in a load file.
//
// NOTE: Any nodes with IDs in the 'idsToSkip' list parameter will not be loaded.
LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row
WHERE NOT row.`magnitude` IN $idsToSkip AND NOT toFloat(trim(row.`magnitude`)) IS NULL
CALL (row) {
  MERGE (n: `Earthquake` { `magnitude`: toFloat(trim(row.`magnitude`)) })
  SET n.`magnitude` = toFloat(trim(row.`magnitude`))
  SET n.`cdi` = toInteger(trim(row.`cdi`))
  SET n.`mmi` = toInteger(trim(row.`mmi`))
  SET n.`sig` = toInteger(trim(row.`sig`))
  SET n.`nst` = toInteger(trim(row.`nst`))
  SET n.`dmin` = toFloat(trim(row.`dmin`))
  SET n.`gap` = toFloat(trim(row.`gap`))
  SET n.`depth` = toFloat(trim(row.`depth`))
  SET n.`latitude` = toFloat(trim(row.`latitude`))
  SET n.`longitude` = toFloat(trim(row.`longitude`))
  SET n.`Year` = toInteger(trim(row.`Year`))
  SET n.`Month` = toInteger(trim(row.`Month`))
  SET n.`tsunami` = toLower(trim(row.`tsunami`)) IN ['1','true','yes']
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row
WHERE NOT row.`latitude` IN $idsToSkip AND NOT toFloat(trim(row.`latitude`)) IS NULL
CALL (row) {
  MERGE (n: `Location` { `latitude`: toFloat(trim(row.`latitude`)) })
  SET n.`latitude` = toFloat(trim(row.`latitude`))
  SET n.`longitude` = toFloat(trim(row.`longitude`))
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row
WHERE NOT row.`tsunami` IN $idsToSkip 
CALL (row) {
  MERGE (n: `TsunamiRisk` { `tsunami`: toLower(trim(row.`tsunami`)) IN ['1','true','yes'] })
  SET n.`tsunami` = toLower(trim(row.`tsunami`)) IN ['1','true','yes']
  SET n.`Year` = toInteger(trim(row.`Year`))
} IN TRANSACTIONS OF 10000 ROWS;


// RELATIONSHIP load
// -----------------
//
// Load relationships in batches, one relationship type at a time. Relationships are created using a MERGE statement, meaning only one relationship of a given type will ever be created between a pair of nodes.
LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL (row) {
  MATCH (source: `Earthquake` { `magnitude`: toFloat(trim(row.`magnitude`)) })
  MATCH (target: `TsunamiRisk` { `tsunami`: toLower(trim(row.`tsunami`)) IN ['1','true','yes'] })
  MERGE (source)-[r: `HAS_TSUNAMI_RISK`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL (row) {
  MATCH (source: `Earthquake` { `magnitude`: toFloat(trim(row.`magnitude`)) })
  MATCH (target: `Location` { `latitude`: toFloat(trim(row.`latitude`)) })
  MERGE (source)-[r: `OCCURRED_IN`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL (row) {
  MATCH (source: `Location` { `latitude`: toFloat(trim(row.`latitude`)) })
  MATCH (target: `Earthquake` { `magnitude`: toFloat(trim(row.`magnitude`)) })
  MERGE (source)-[r: `OCCURRED_IN`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL (row) {
  MATCH (source: `TsunamiRisk` { `tsunami`: toLower(trim(row.`tsunami`)) IN ['1','true','yes'] })
  MATCH (target: `Earthquake` { `magnitude`: toFloat(trim(row.`magnitude`)) })
  MERGE (source)-[r: `HAS_TSUNANI_RISK`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

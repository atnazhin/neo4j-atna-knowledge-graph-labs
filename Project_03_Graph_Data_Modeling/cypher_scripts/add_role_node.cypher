// Convert ACTED_IN relationships into Role nodes
MATCH (a:Actor)-[r:ACTED_IN]->(m:Movie)
MERGE (role:Role {name: r.role})
MERGE (a)-[:PLAYED]->(role)
MERGE (role)-[:IN_MOVIE]->(m);


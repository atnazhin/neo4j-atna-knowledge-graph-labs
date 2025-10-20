// Ensure actor exists
MERGE (p:Person {name: 'Daniel Kaluuya'});

// Ensure movie exists and connect
MATCH (p:Person {name: 'Daniel Kaluuya'})
MERGE (m:Movie {title: 'Get Out'})
MERGE (p)-[:ACTED_IN]->(m)
RETURN p, m;

// Controlling results
MATCH (a:Actor)-[:ACTED_IN]->(m:Movie)
RETURN a.name, m.title
ORDER BY m.released DESC
LIMIT 5;

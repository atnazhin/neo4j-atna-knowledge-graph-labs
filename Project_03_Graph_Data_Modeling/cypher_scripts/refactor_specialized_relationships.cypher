
// 1️⃣ Promote ACTED_IN relationships to Actor nodes
MATCH (p:Person)-[r:ACTED_IN]->(m:Movie)
WHERE NOT p:Actor
SET p:Actor
REMOVE p:Person
RETURN p.name AS promotedActor, m.title AS movie;

// 2️⃣ Promote DIRECTED relationships to Director nodes
MATCH (p:Person)-[r:DIRECTED]->(m:Movie)
WHERE NOT p:Director
SET p:Director
REMOVE p:Person
RETURN p.name AS promotedDirector, m.title AS movie;

// 3️⃣ Clean up unused Person nodes
MATCH (p:Person)
WHERE NOT (p)-[:ACTED_IN|DIRECTED]->()
DETACH DELETE p;

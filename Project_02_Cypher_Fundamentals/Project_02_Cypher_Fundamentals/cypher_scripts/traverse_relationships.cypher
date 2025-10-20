// Actors and the movies they acted in
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
RETURN p.name AS actor, m.title AS movie
LIMIT 20;

// Directors of Cloud Atlas
MATCH (m:Movie {title: "Cloud Atlas"})<-[:DIRECTED]-(d:Person)
RETURN d.name AS director;

// People Emil Eifrem acted with (co-actors)
MATCH (e:Person {name:"Emil Eifrem"})-[:ACTED_IN]->(m)<-[:ACTED_IN]-(co:Person)
RETURN DISTINCT co.name;

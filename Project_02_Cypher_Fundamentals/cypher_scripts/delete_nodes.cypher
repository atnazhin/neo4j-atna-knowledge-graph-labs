// Remove Emil Eifrem and all relationships
MATCH (e:Person {name: "Emil Eifrem"})-[r]-()
DELETE e, r;

// (Optional) hard delete movie by title
// MATCH (m:Movie {title: 'Get Out'}) DETACH DELETE m;

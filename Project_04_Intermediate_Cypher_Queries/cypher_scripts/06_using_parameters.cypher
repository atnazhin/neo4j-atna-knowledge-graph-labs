// -----------------------------------------------------------------------------
// Project 04: Intermediate Cypher Queries
// Script 06: Using Parameters
// -----------------------------------------------------------------------------
// Description:
// Demonstrates parameterized queries — safely passing external values into Cypher
// instead of hardcoding them. This improves performance and prevents injection.
//
// Graph pattern used:
// (Actor)-[:PLAYED]->(Role)-[:IN_MOVIE]->(Movie)
// -----------------------------------------------------------------------------

// Example parameterized query:
// This query finds all movies for a given actor name, provided as a parameter.
//
// To run in Neo4j Browser or Desktop:
// :param actorName => 'Tom Hanks'
// Then run the query below.


MATCH (a:Actor {name: 'Tom Hanks'})-[:PLAYED]->(r:Role)-[:IN_MOVIE]->(m:Movie)
RETURN a.name AS Actor, collect(m.title) AS Movies, count(m) AS TotalMovies;

// -----------------------------------------------------------------------------
// ✅ Expected Output
// -----------------------------------------------------------------------------
// | Actor       | Movies                                | TotalMovies |
// |--------------|----------------------------------------|--------------|
// | "Tom Hanks" | ["Apollo 13", "Sleepless
// -----------------------------------------------------------------------------
// 
//
// Notes:
// - `$actorName` is a runtime parameter.
// - Parameters make queries reusable and more secure.
// - Use `:params` in Neo4j Desktop to view all active parameters.
// -----------------------------------------------------------------------------

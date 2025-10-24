// -----------------------------------------------------------------------------
// Project 04: Intermediate Cypher Queries
// Script 04: Pipelining Queries
// -----------------------------------------------------------------------------
// Description:
// This query demonstrates Cypher's pipelining capability — chaining multiple
// operations (MATCH → WITH → WHERE → RETURN → ORDER BY).
// It identifies actors, counts the number of movies they have appeared in,
// filters based on count, and orders the results by movie count.
//
// Graph pattern used:
// (Actor)-[:PLAYED]->(Role)-[:IN_MOVIE]->(Movie)
//
// -----------------------------------------------------------------------------
// Query starts here
// -----------------------------------------------------------------------------

MATCH (a:Actor)-[:PLAYED]->(:Role)-[:IN_MOVIE]->(m:Movie)
WITH a, count(m) AS moviesCount, collect(m.title) AS Movies
WHERE moviesCount > 0
RETURN a.name AS Actor, moviesCount, Movies
ORDER BY moviesCount DESC;

// -----------------------------------------------------------------------------
// Expected Output:
// -----------------------------------------------------------------------------
// | Actor           | moviesCount | Movies                                     |
// |-----------------|--------------|--------------------------------------------|
// | "Tom Hanks"     | 2            | ["Apollo 13", "Sleepless in Seattle"]      |
// | "Meg Ryan"      | 1            | ["Sleepless in Seattle"]                   |
// | "Danny DeVito"  | 1            | ["Hoffa"]                                 |
// | "Jack Nicholson"| 1            | ["Hoffa"]                                 |
// -----------------------------------------------------------------------------
//
// Notes:
// - The WITH clause is used to pipeline results between MATCH and RETURN.
// - collect(m.title) gathers all movie titles per actor.
// - ORDER BY sorts the results by descending movie count.
// -----------------------------------------------------------------------------


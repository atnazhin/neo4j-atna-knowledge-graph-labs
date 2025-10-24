// -----------------------------------------------------------------------------
// Project 04: Intermediate Cypher Queries
// Script 05: Subqueries
// -----------------------------------------------------------------------------
// Description:
// Demonstrates the use of subqueries in Cypher using the CALL { } IN TRANSACTIONS
// pattern. This query finds all actors and, within a subquery, retrieves the
// movies and roles they performed in.
//
// Graph pattern used:
// (Actor)-[:PLAYED]->(Role)-[:IN_MOVIE]->(Movie)
// -----------------------------------------------------------------------------

// Outer query: iterate over all actors
MATCH (a:Actor)
CALL {
  // Inner subquery: for each actor, find their movies and roles
  WITH a
  MATCH (a)-[:PLAYED]->(r:Role)-[:IN_MOVIE]->(m:Movie)
  RETURN collect({movie: m.title, role: r.name}) AS moviesAndRoles
}
RETURN a.name AS Actor, moviesAndRoles
ORDER BY size(moviesAndRoles) DESC;

// -----------------------------------------------------------------------------
// Expected Output:
// -----------------------------------------------------------------------------
// | Actor           | moviesAndRoles                                           |
// |-----------------|----------------------------------------------------------|
// | "Tom Hanks"     | [{movie: "Apollo 13", role: "Jim Lovell"},              |
// |                 |  {movie: "Sleepless in Seattle", role: "Sam Baldwin"}]   |
// | "Meg Ryan"      | [{movie: "Sleepless in Seattle", role: "Annie Reed"}]    |
// | "Danny DeVito"  | [{movie: "Hoffa", role: "Bobby Ciaro"}]                 |
// | "Jack Nicholson"| [{movie: "Hoffa", role: "Jimmy Hoffa"}]                 |
// -----------------------------------------------------------------------------
//
// Notes:
// - CALL { } allows execution of a subquery inside another query.
// - WITH passes variables into the subquery.
// - Each actor is processed individually, and results are aggregated.
// -----------------------------------------------------------------------------

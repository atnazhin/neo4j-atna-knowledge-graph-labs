// Graph traversal
MATCH path = (a:Actor)-[:ACTED_IN*1..2]-(m:Movie)
RETURN a.name AS Actor, length(path) AS Depth, collect(m.title) AS Movies;

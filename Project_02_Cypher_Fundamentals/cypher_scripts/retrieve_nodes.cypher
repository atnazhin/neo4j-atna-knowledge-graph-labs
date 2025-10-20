
---

## H) Cypher script files

### H.1 `retrieve_nodes.cypher`
```cypher
// List sample nodes
MATCH (n) RETURN n LIMIT 25;

// All movies (latest first)
MATCH (m:Movie)
RETURN m.title AS title, m.released AS year
ORDER BY year DESC
LIMIT 10;

// People born after a given year
MATCH (p:Person)
WHERE p.born > 1980
RETURN p.name, p.born
ORDER BY p.born DESC;

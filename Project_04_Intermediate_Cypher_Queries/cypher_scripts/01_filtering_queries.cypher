// Filtering queries example

MATCH (d:Director)-[:DIRECTED]->(m:Movie)-[:IN_GENRE]->(g:Genre)
WHERE m.year = 2000 AND g.name = 'Horror'
RETURN d.name;

// Find movies missing tmdbId
MATCH (m:Movie)
WHERE m.tmdbId IS NULL
RETURN m.title;

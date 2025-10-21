
MATCH (p:Person)
WHERE exists((p)-[:ACTED_IN]->())
SET p:Actor;

MATCH (p:Person)
WHERE exists((p)-[:DIRECTED]->())
SET p:Director;

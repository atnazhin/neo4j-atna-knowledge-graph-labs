# Project 4: Intermediate Cypher Queries  

This project demonstrates practical mastery of **intermediate-level Cypher querying techniques** in Neo4j.  
It builds upon the foundational Movie dataset and introduces **advanced query control**, **graph traversal**, and **query optimization concepts**.

---

## 🎯 Objectives  

Through this project, I learned to:
- Filter and manipulate query results using predicates and property conditions  
- Control returned result sets with ordering, limits, and distinct clauses  
- Perform **multi-hop graph traversals** and pattern-based queries  
- Build **pipelined** queries using the `WITH` clause  
- Apply **subqueries** and **query parameters** for modular and reusable Cypher design  

---

## 🧠 Key Concepts & Skills  

| Concept | Description |
|----------|-------------|
| **Filtering Queries** | Refined graph searches using equality, range, and string conditions. |
| **Controlling Results** | Ordered, limited, and deduplicated query outputs. |
| **Graph Traversal** | Navigated multi-level node relationships efficiently. |
| **Pipelining Queries** | Chained queries using `WITH` to manage scope and memory. |
| **Subqueries & Parameters** | Modularized logic with embedded queries and dynamic inputs. |

---

## 🧩 Example Challenges & Cypher Solutions  

### 🎬 Filtering Queries  
Find *Horror* movies directed in 2000:  
```cypher
MATCH (d:Director)-[:DIRECTED]->(m:Movie)-[:IN_GENRE]->(g:Genre)
WHERE m.year = 2000 AND g.name = 'Horror'
RETURN d.name;


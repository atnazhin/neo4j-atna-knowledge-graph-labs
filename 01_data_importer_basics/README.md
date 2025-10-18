# Lesson 1: Importing Nodes from CSV using Neo4j Data Importer

In this lab, I practiced using the **Neo4j Data Importer** to load CSV data, define node labels, and set a unique identifier.

---

## 🧱 Steps Performed
1. Opened [Neo4j Data Importer](https://workspace.neo4j.io/workspace/import)
2. Uploaded `persons.csv`
3. Created the **Person** node label
4. Set `id` as the unique identifier
5. Mapped columns → properties (`name`, `age`, `city`)
6. Ran the import successfully

---

## 🧮 Verification Query
```cypher
MATCH (p:Person)
RETURN p
LIMIT 25;

---

## 🎬 Challenge: Add Movie Nodes

**Objective:**  
Import movie data from a CSV file and create `Movie` nodes in the database.

### Steps Performed
1. Uploaded `movies.csv` to the Data Importer  
2. Added a new **Movie** node label  
3. Set `movieId` as the unique identifier  
4. Mapped columns → properties:
   - `movieId` → `id`
   - `title` → `title`
   - `year` → `released`
   - `genre` → `genre`
   - `rating` → `rating`
5. Ran the import successfully

### Verification Query

---

## 🔗 Challenge: Creating Relationships (ACTED_IN)

**Objective:**  
Create `ACTED_IN` relationships between existing `Person` and `Movie` nodes using the `acted_in.csv` file.

### Steps Performed
1. Uploaded `acted_in.csv` into [Neo4j Data Importer](https://workspace.neo4j.io/workspace/import)
2. Added a **relationship** between:
   - **Person** → **Movie**
3. Set the relationship type to **ACTED_IN**
4. Matched:
   - `personId` → `Person.id`
   - `movieId` → `Movie.id`
5. Mapped the `role` column as a property on the relationship
6. Ran the import successfully

### Verification Queries
To view actor–movie pairs:
```cypher
MATCH (p:Person)-[r:ACTED_IN]->(m:Movie)
RETURN p.name, r.role, m.title
LIMIT 25;

```cypher
MATCH (m:Movie)
RETURN m
LIMIT 25;

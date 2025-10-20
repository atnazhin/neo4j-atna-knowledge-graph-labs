#Project 1: Importing Nodes from CSV using Neo4j Data Importer

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


---

## 🎬 Challenge: Add DIRECTED Relationship

**Objective:**  
Add the `DIRECTED` relationship between existing `Person` and `Movie` nodes using `directed.csv`.

### Steps Performed
1. Uploaded `directed.csv` into [Neo4j Data Importer](https://workspace.neo4j.io/workspace/import)
2. Added a **DIRECTED** relationship between **Person → Movie**
3. Mapped columns:
   - `person_tmdbId` → `Person.id`
   - `movieId` → `Movie.id`
4. Ran the import successfully

### Verification Query
```cypher
MATCH (p:Person)-[d:DIRECTED]->(m:Movie)
RETURN p.name AS Director, m.title AS Movie
LIMIT 25;


```cypher
MATCH (m:Movie)
RETURN m
LIMIT 25;

# Project 1: Importing Data into Neo4j using the Data Importer

In this project, I explored how to use the **Neo4j Data Importer** to bring CSV data into a graph database and build connections between entities.  
The goal was to create a small graph that includes **Person** and **Movie** nodes linked by **ACTED_IN** and **DIRECTED** relationships.

---

## 🧱 Step 1 – Import Person Nodes

**Objective:**  
Import data about people from a CSV file and create `Person` nodes.

**Steps Performed**
1. Opened [Neo4j Data Importer](https://workspace.neo4j.io/workspace/import)  
2. Uploaded `persons.csv`  
3. Created the **Person** node label  
4. Set `id` as the unique identifier  
5. Mapped columns → properties (`name`, `age`, `city`)  
6. Ran the import successfully  

**Verification Query**
```cypher
MATCH (p:Person)
RETURN p
LIMIT 25;

---

## 🌍 Challenge: Global Earthquake–Tsunami Risk Graph

**Objective:**  
Apply what you learned about the Neo4j Data Importer to build a custom graph from a real-world dataset.

**Dataset:**  
[Global Earthquake–Tsunami Risk Assessment Dataset (Kaggle)](https://www.kaggle.com/datasets)  
This dataset contains 782 earthquake records (2001–2022), including magnitude, depth, location, and tsunami risk indicators.

---

### 🧩 Graph Model


**Nodes**
- 🌋 `Earthquake` — magnitude, depth, significance, year, month  
- 📍 `Location` — latitude, longitude  
- 🌊 `TsunamiRisk` — tsunami flag (0 = No Tsunami, 1 = Tsunami)

**Relationships**
- `OCCURRED_IN`: connects earthquakes to their coordinates  
- `HAS_TSUNAMI_RISK`: connects earthquakes to tsunami classification  

---

### 🧱 Steps Performed
1. Uploaded `earthquake_data_tsunami.csv` to Neo4j Data Importer  
2. Created three node labels:
   - `Earthquake` (unique ID: generated from row number)
   - `Location` (unique ID: latitude)
   - `TsunamiRisk` (unique ID: tsunami)
3. Defined relationships:
   - `Earthquake → Location` via `OCCURRED_IN`
   - `Earthquake → TsunamiRisk` via `HAS_TSUNAMI_RISK`
4. Mapped columns to properties and ran the import successfully  

---

### 🧮 Verification Queries

**Node and relationship counts**
```cypher
MATCH (n) RETURN labels(n), count(*) ORDER BY count(*) DESC;
### Earthquake–Location links
MATCH (e:Earthquake)-[:OCCURRED_IN]->(l:Location)
RETURN e.year, e.magnitude, l.latitude, l.longitude
LIMIT 10;
### Tsunami risk links
MATCH (e:Earthquake)-[:HAS_TSUNAMI_RISK]->(t:TsunamiRisk)
RETURN e.magnitude, e.year, t.tsunami
LIMIT 10;



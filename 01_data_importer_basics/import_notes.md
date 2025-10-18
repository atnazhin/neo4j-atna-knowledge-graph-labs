
# Lesson 1: Importing Nodes from CSV using Neo4j Data Importer

In this lesson, I learned how to import data from a CSV file into Neo4j using the **Data Importer** tool.  
I practiced creating a node label, setting a unique identifier, and running Cypher queries to verify the imported data.

---

## 📂 Files
- [`data-importer-2025-10-18.zip`](https://github.com/user-attachments/files/22986863/data-importer-2025-10-18.zip) – Neo4j Data Importer project export  
- [`persons.csv`](https://github.com/user-attachments/files/22986856/persons.csv) – source dataset used for import  

---

## 🧱 Steps Performed
1. Opened [Neo4j Data Importer](https://workspace.neo4j.io/workspace/import)
2. Uploaded `persons.csv`
3. Created a **Person** node label  
4. Set **id** as the unique identifier
5. Mapped properties:
   - `name` → `name`
   - `age` → `age`
   - `city` → `city`
6. Imported the data into Neo4j successfully

---

## 🧮 Cypher Query Used
```cypher
MATCH (p:Person)
RETURN p
LIMIT 25;

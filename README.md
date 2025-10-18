# neo4j-atna-knowledge-graph-labs
Hands-on projects and notes exploring Neo4j and knowledge graph data modelling.

# Lesson 1: Importing Data into Neo4j using the Data Importer

In this lesson, I explored how to use the **Neo4j Data Importer** to bring CSV data into a graph database and build connections between entities.  
The goal was to create a small graph that includes **Person** and **Movie** nodes linked by **ACTED_IN** relationships.

Through this exercise, I learned how to:
- Upload and map CSV files to node labels (`Person`, `Movie`)
- Define unique identifiers for nodes
- Map column data to properties
- Import and verify relationships (`ACTED_IN`) between nodes
- Validate the data using Cypher queries

By the end of this lesson, the Neo4j database contained:
- 🧑‍🤝‍🧑 `Person` nodes (from `persons.csv`)
- 🎬 `Movie` nodes (from `movies.csv`)
- 🔗 `ACTED_IN` relationships (from `acted_in.csv`)

This provides the foundation for modeling real-world networks in Neo4j and prepares for more complex relationship types in future lessons.

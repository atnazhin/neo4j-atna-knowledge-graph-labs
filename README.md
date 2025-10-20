# neo4j-atna-knowledge-graph-labs
Hands-on projects and notes exploring Neo4j and knowledge graph data modelling.

# Project 1: Importing Data into Neo4j using the Data Importer

In this project, I explored how to use the **Neo4j Data Importer** to bring CSV data into a graph database and build connections between entities.  
The goal was to create a small graph that includes **Person** and **Movie** nodes linked by **ACTED_IN** relationships.

Through this exercise, I learned how to:
- Upload and map CSV files to node labels (`Person`, `Movie`)
- Define unique identifiers for nodes
- Map column data to properties
- Import and verify relationships (`ACTED_IN`) between nodes
- Validate the data using Cypher queries

By the end of this project, the Neo4j database contained:
- 🧑‍🤝‍🧑 `Person` nodes (from `persons.csv`)
- 🎬 `Movie` nodes (from `movies.csv`)
- 🔗 `ACTED_IN` relationships (from `acted_in.csv`)
  ## 📚 Projects

| # | Project Title | Description |
|---|---------------|--------------|
| 1 | [Importing Nodes from CSV using Data Importer](./01_data_importer_basics/README.md) | Imported a CSV file into Neo4j, created the `Person` node label, and verified data using Cypher. |
|  | [Challenge: Global Earthquake–Tsunami Risk Graph](./01_data_importer_basics/README.md#-challenge-global-earthquake–tsunami-risk-graph) | Modeled and imported a real-world dataset to build `Earthquake`, `Location`, and `TsunamiRisk` nodes connected by `OCCURRED_IN` and `HAS_TSUNAMI_RISK` relationships. |
| 2 | [Project 2: Cypher Fundamentals](./Project_02_Cypher_Fundamentals/README.md) | Query, filter, create, update, and delete graph data using Cypher on the Movies dataset. |

This provides the foundation for modeling real-world networks in Neo4j and prepares for more complex relationship types.
## 🖼️ Visual Results  

Below are the complete Neo4j visual results — showing the full workflow from importing data, creating relationships, running Cypher queries, and visualizing the graphs for both the **Movie dataset** and the **Global Earthquake–Tsunami Risk Challenge**.

| Screenshot | Description |
|-------------|--------------|
| ![Import Movie](./visual_results/importmovie.png) | **Movie data imported** successfully using the Neo4j Data Importer. |
| ![Import Result Relationship](./visual_results/importresultRelationship.png) | Import summary displaying the creation of nodes and relationships from CSV files. |
| ![Creating Relationship](./visual_results/creatingRelationship1.png) | Configuring the **ACTED_IN** relationship between `Person` and `Movie`. |
| ![Result Relationship](./visual_results/resultRelationship.png) | Verified graph connections between actors and movies. |
| ![Adding Rating](./visual_results/addingRating.png) | Added a `User` node and established **RATED** relationships for interaction tracking. |
| ![Show Index](./visual_results/showIndex.png) | Displaying Neo4j **index and constraint** settings for optimized query performance. |
| ![Import Global](./visual_results/importglobal.png) | Importing the **Global Earthquake–Tsunami Risk dataset** using Neo4j Data Importer. |
| ![Import Earthquake](./visual_results/importEarthquake.png) | Created `Earthquake`, `Location`, and `TsunamiRisk` nodes with their properties. |
| ![Relationship OCCURRED](./visual_results/relationshipOCCURRED.png) | Visualizing the **OCCURRED_IN** relationships connecting `Earthquake` to `Location`. |
| ![Relationship Tsunami](./visual_results/relationshipTsunami.png) | Showing **HAS_TSUNAMI_RISK** connections from `Earthquake` to `TsunamiRisk`. |
| ![Query Movie](./visual_results/queryMovie.png) | Running Cypher queries to retrieve movie–actor relationships. |
| ![Query Earthquakes](./visual_results/queryEarthquakes.png) | Query results showing the `Earthquake` and `Location` link visualization. |
| ![Query Directed](./visual_results/queryDirected.png) | Viewing directed relationships between earthquakes and tsunami risks. |
| ![Query](./visual_results/query.png) | Cypher result graph verifying the connections between users, ratings, and movies. |

---

### ✅ Summary  

This visual sequence captures:  
- Importing CSV datasets into Neo4j  
- Mapping node labels and defining relationships  
- Running Cypher queries for validation  
- Building two connected graph models:
  - 🎬 **Movie–Person–User Graph**  
  - 🌎 **Global Earthquake–Tsunami Risk Graph**  

---

### 💾 Commit Message Suggestion  


# 🎬 Project 03 – Graph Data Modeling Fundamentals

This project demonstrates **Graph Data Modeling** competency using the **Neo4j Movie Domain** from the official GraphAcademy course.  
It shows how to design, implement, and iteratively **refactor a graph data model** to support new use cases and optimize Cypher query performance.

---

## 🎯 Objectives

Through this project, I practiced and demonstrated how to:

- Translate a business use case into a graph data model.  
- Create and connect nodes and relationships using Cypher.  
- Define appropriate properties, constraints, and indexes.  
- Refactor an existing model to introduce new entities and structure.  
- Visualize and query graph data efficiently.

---

## 🧱 Domain Overview

The domain models a **Movie Rating System** that stores information about:

- Movies  
- People (actors and directors)  
- Users who rate movies  

It answers questions such as:
- Which people acted in a movie?  
- Who directed a movie?  
- What movies did a person act in?  
- Which users rated a movie, and what rating did they give?  
- Which actors were born before a specific year?  

---

## 🧠 Conceptual Data Model

| Node Label | Description |
|-------------|-------------|
| `Person` | A person involved in making movies (base label). |
| `Movie` | A film with properties such as title, release date, rating, and genres. |
| `User` | A viewer who reviews or rates a movie. |
| `Actor` | Specialized label for people who act in movies. |
| `Director` | Specialized label for people who direct movies. |
| `Genre` | Category of a movie (Drama, Comedy, etc.). |
| `Language` | Language the movie is made in. |
| `Role` | A node representing a specific character played by an actor. |

### Relationships

| Relationship | Description |
|---------------|-------------|
| `(:Actor)-[:ACTED_IN]->(:Movie)` | Actor acted in a movie. |
| `(:Director)-[:DIRECTED]->(:Movie)` | Director directed a movie. |
| `(:User)-[:RATED {rating}]->(:Movie)` | User rated a movie. |
| `(:Movie)-[:IN_GENRE]->(:Genre)` | Movie belongs to one or more genres. |
| `(:Movie)-[:IN_LANGUAGE]->(:Language)` | Movie is in a particular language. |
| `(:Actor)-[:PLAYED]->(:Role)-[:IN_MOVIE]->(:Movie)` | Actor played a character role in a movie. |

---

## ⚙️ Implementation

All Cypher scripts are stored in [`cypher_scripts/`](./cypher_scripts/) and can be executed sequentially.

### 1️⃣ Create Initial Nodes

[`create_nodes.cypher`](./cypher_scripts/create_nodes.cypher)
```cypher
MATCH (n) DETACH DELETE n;

MERGE (:Movie {title: 'Apollo 13', tmdbId: 568, released: '1995-06-30', imdbRating: 7.6, genres: ['Drama', 'Adventure', 'IMAX']})
MERGE (:Person {name: 'Tom Hanks', tmdbId: 31, born: '1956-07-09'})
MERGE (:Person {name: 'Meg Ryan', tmdbId: 5344, born: '1961-11-19'})
MERGE (:Person {name: 'Danny DeVito', tmdbId: 518, born: '1944-11-17'})
MERGE (:Person {name: 'Jack Nicholson', tmdbId: 514, born: '1937-04-22'})
MERGE (:Movie {title: 'Sleepless in Seattle', tmdbId: 858, released: '1993-06-25', imdbRating: 6.8, genres: ['Comedy', 'Drama', 'Romance']})
MERGE (:Movie {title: 'Hoffa', tmdbId: 10410, released: '1992-12-25', imdbRating: 6.6, genres: ['Crime', 'Drama']});


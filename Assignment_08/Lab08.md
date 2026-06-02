# Lab Assignment 08: PL/SQL Triggers

## Objective
To implement event-driven programming in a relational database using SQL Triggers. This assignment focuses on designing `AFTER INSERT` and `AFTER DELETE` triggers that automatically enforce reciprocal (symmetric) friendship relationships in a social network database schema.

---

## Relational Schema

### 1. Highschooler Table (`Highschooler`)
Tracks student profiles, including their names and current school grades.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `ID` | Int | Primary Key | Unique high school student identifier |
| `name` | Text | - | Full name of the student |
| `grade` | Int | - | Student's school grade level |

### 2. Friend Table (`Friend`)
Represents mutual friendship links between students. Friendship is conceptualized as a bidirectional (symmetric) relationship.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `ID1` | Int | Foreign Key | References `Highschooler(ID)` |
| `ID2` | Int | Foreign Key | References `Highschooler(ID)` |
| *Composite Key* | `(ID1, ID2)` | Primary Key | Enforces unique friendship pairs |

### 3. Likes Table (`Likes`)
Represents an asymmetric interest relation where one student likes another student.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `ID1` | Int | Foreign Key | References `Highschooler(ID)` |
| `ID2` | Int | Foreign Key | References `Highschooler(ID)` |
| *Composite Key* | `(ID1, ID2)` | Primary Key | Enforces unique like entries |

---

## Program Specifications & Requirements

The database system must maintain referential integrity and execute reciprocal relations using the following event-driven mechanisms:

1. **Schema & Referential Constraints**
   - Create the `Facebook` database if it does not exist.
   - Construct `Highschooler`, `Friend`, and `Likes` tables.
   - Apply Foreign Key constraints from `Friend(ID1, ID2)` and `Likes(ID1, ID2)` referencing the primary key `Highschooler(ID)`.

2. **Event-Driven Reciprocal Integrity (Triggers)**
   - **Insert Symmetry Trigger (`insert_friend_symmetry`)**
     - Fire **`AFTER INSERT`** on the `Friend` table for each row.
     - Automatically check if the symmetric/reciprocal friendship link exists (`ID1 = NEW.ID2` and `ID2 = NEW.ID1`).
     - If the symmetric link is missing, insert it automatically.
   - **Delete Symmetry Trigger (`delete_friend_symmetry`)**
     - Fire **`AFTER DELETE`** on the `Friend` table for each row.
     - Automatically find and delete the reciprocal friendship link (`ID1 = OLD.ID2` and `ID2 = OLD.ID1`) to keep friendship links perfectly synchronized.

3. **Data Verification**
   - Test insertions and deletions on the `Friend` table to confirm that database triggers successfully maintain bidirectional symmetry without causing infinite recursion loops.

---

## Code Reference
The full database script containing the schema creation, trigger implementations, sample data, and verification tests can be accessed here: [trigger.sql](./trigger.sql)
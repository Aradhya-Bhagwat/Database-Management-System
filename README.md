# 📚 Database Management Systems (Semester 4)

[![SQL](https://img.shields.io/badge/Language-SQL-blue.svg)](https://en.wikipedia.org/wiki/SQL)
[![Python](https://img.shields.io/badge/Language-Python-yellow.svg)](https://www.python.org/)
[![Course](https://img.shields.io/badge/Course-DBMS-brightgreen.svg)]()
[![Status](https://img.shields.io/badge/Status-Completed-success.svg)]()

Welcome to my repository for **Database Management Systems** implemented in **SQL** and **Python**. This repository contains a collection of relational database models, query implementations, connectivity applications, and advanced PL/SQL scripts developed during my 4th Semester Engineering curriculum.

## 🎯 Objective
The primary goal of this repository is to demonstrate a solid understanding of core computer science concepts by implementing database designs, writing optimal SQL queries, developing backend connectivity applications, and programming advanced database-side logic (procedural PL/SQL).

## 📂 Repository Contents

The table below reflects the implementations present in the source files:

| Folder / File | Topic / Assignment Description | Core Concepts Covered |
| :--- | :--- | :--- |
| `Assignment_01` | **Entity-Relationship (ER) Diagram Design** | Conceptual database design, identifying entities, attributes (keys, composite, multi-valued), and relationships. |
| `Assignment_02` | **Database Creation and DDL Constraints** | Physical schema construction, enforcing primary keys, foreign keys (referential integrity), check constraints, and nullability. |
| `Assignment_03` | **Data Manipulation Language (DML)** | Populating tables, conditional filtering (`LIKE`, comparative operators), sorting (`ORDER BY`), arithmetic expressions, and basic aggregates. |
| `Assignment_04` | **Advanced Joins and Views** | Multi-table joins, set operations (Intersections/Exclusions), database abstraction via Views, and conditional deletion. |
| `Assignment_05` | **Complex Subqueries and Aggregations** | Non-correlated/correlated subqueries, aggregate grouping with filters (`GROUP BY` and `HAVING`), and relational division. |
| `Assignment_06` | **Database Connectivity & CRUD** | Menu-driven console interface linking Python frontend to a MySQL backend, demonstrating full CRUD execution. |
| `Assignment_07` | **PL/SQL Stored Functions** | Modular backend programming by creating stored functions that retrieve derived address profiles using multi-table joins. |
| `Assignment_08` | **PL/SQL Triggers** | Event-driven programming (`AFTER INSERT`, `AFTER DELETE`) designed to automatically enforce reciprocal friendship symmetry. |

## 🚀 Getting Started

To run these scripts and applications locally on your machine, follow the instructions below.

### Prerequisites
You will need a standard MySQL database engine and a Python 3 environment.
* **MySQL Database Server:** Install [MySQL Community Server](https://dev.mysql.com/downloads/mysql/) or setup a local instance.
* **Python 3:** Ensure Python is installed (along with the connection driver: `pip install PyMySQL`).

### Setup & Execution
1. **Clone the repository:**
   ```bash
   git clone https://github.com/Aradhya-Bhagwat/Database-Management-System.git
   cd Database-Management-System
   ```
2. **Execute an SQL Script** (using `DML.sql` as an example):
   * Access your local MySQL instance:
     ```bash
     mysql -u your_username -p
     ```
   * Or load a script directly from command line:
     ```bash
     mysql -u your_username -p < Assignment_03/DML.sql
     ```
3. **Run the Database Connectivity Program (Assignment 6):**
   ```bash
   python Assignment_06/connect.py
   ```

## 🧑💻 Author
**Aradhya Bhagwat**  

---
⭐️ *If you found this repository helpful or interesting, feel free to give it a star!*
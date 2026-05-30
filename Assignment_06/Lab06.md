# Lab Assignment 06: Database Connectivity and CRUD Operations

## Objective
To bridge the gap between application software and relational databases by implementing database connectivity (using Python's `PyMySQL` or `mysql-connector-python` API) with a MySQL backend. The goal is to build a full CRUD (Create, Read, Update, Delete) menu-driven console application.

---

## Schema Requirements

The database system `EducationalInstitute` is composed of two primary tables with relational integrity:

### 1. Students Table (`Students`)
Maintains enrollment profiles of the students.

- `student_id` (INT): Auto-incrementing primary key.
- `first_name` (VARCHAR): Student's first name.
- `last_name` (VARCHAR): Student's last name.
- `age` (INT): Student's age.
- `email` (VARCHAR): Student's email, unique constraint.

### 2. Courses Table (`Courses`)
Maintains information regarding course packages.

- `course_id` (INT): Auto-incrementing primary key.
- `course_name` (VARCHAR): Name of the course.
- `course_duration` (VARCHAR): Course duration (e.g., '6 Months', '1 Year').

---

## Functional Requirements

The Python application must execute the following operations dynamically by interacting with the MySQL server:

1. **Database Setup**
   - Create the `EducationalInstitute` database if it does not exist.
   - Create both the `Students` and `Courses` tables with appropriate data types.
   
2. **Interactive CRUD Menu**
   - Provide a persistent loop presenting the user with options to perform database operations.
   
3. **Data Operations (DML / DDL)**
   - **Create**: Add new students and courses by taking input from the command line.
   - **Read**: Fetch and display all students or courses in a readable formatted terminal list.
   - **Update**: Edit existing student profiles (name, age, email) and course records by specifying their primary keys.
   - **Delete**: Remove students or courses from the database by specifying their primary keys.
   
4. **Graceful Database Lifecycle**
   - Handle connection establishment, queries, parameter binding, transactions (commit/rollback), and ensure connection resources are safely closed.

---

## Code Reference
The full implementation can be viewed and run here: [connect.py](./connect.py)
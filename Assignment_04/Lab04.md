# Lab Assignment 04: Advanced SQL Queries and Views

## Objective
To master complex data querying and schema abstraction in SQL. This lab focuses on multi-table joins, set operations (Intersections/Exclusions), view creation, pattern matching, and conditional deletions on relational tables representing project allocations.

---

## Relational Schema

### 1. Project Table (`Project`)
Tracks the projects undertaken by the organization and their designated chief architects.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `project_id` | Varchar/Int | Primary Key | Unique project identifier |
| `proj_name` | Varchar | Not Null | Name of the project |
| `chief_arch` | Varchar | - | Name of the chief architect |

### 2. Employee Table (`Employee`)
Tracks basic employee credentials.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `Emp_id` | Varchar/Int | Primary Key | Unique employee identifier |
| `Emp_name` | Varchar | Not Null | Full name of the employee |

### 3. Allocation Table (`Assigned-To`)
Represents the many-to-many relationship mapping employees to projects.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `Project_id` | Varchar/Int | Foreign Key | References `Project(project_id)` |
| `Emp_id` | Varchar/Int | Foreign Key | References `Employee(Emp_id)` |
| *Composite Key* | `(Project_id, Emp_id)` | Primary Key | Enforces unique allocation entries |

---

## Query Problems

Write standard SQL statements to perform the following operations:

1. **Project Member Details (Join)**  
   Retrieve the complete details (ID and Name) of all employees working on project code **'C353'**.

2. **Project Member Codes (Projection)**  
   Obtain only the employee IDs of employees working on project **'C353'**.

3. **Project Name Filters (Join)**  
   Retrieve full employee details for all employees assigned to the **'Database'** project.

4. **Project Intersect (Set Operation)**  
   Find the details of employees who are actively working on **both** project **'C353'** and project **'C354'**.

5. **Project Exclusion (Set Difference / Exists)**  
   Find the employee IDs of all employees who are **not** assigned to project **'C453'**.

6. **String Prefix Search**  
   Retrieve the details of all employees whose names begin with the letter **'S'**.

7. **Architect Queries**  
   Retrieve the details of all projects overseen by the chief architect named **'Smith'**.

8. **Conditional Record Purging (Cascade/Delete)**  
   Delete all projects whose project name is **'DBMS'**.

9. **Direct Assignment Lookup**  
   Retrieve the `project_id` associated with employee ID **101**.

10. **Database Abstraction (Views)**  
    Create a view that encapsulates the names of projects and the total number of employees working on each.
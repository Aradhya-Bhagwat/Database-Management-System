# Lab Assignment 05: Complex Joins, Subqueries, and Aggregate Functions

## Objective
To develop advanced SQL querying skills, including writing correlated and non-correlated subqueries, aggregate grouping with filter conditions, multi-table joins, relational division (identifying allocations covering all positions of a type), and utilizing built-in date functions.

---

## Relational Schema

### 1. Employee Table (`Employee`)
Stores basic profile information, job skills, and remuneration details of workers.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `emp_no` | Int | Primary Key | Unique employee code |
| `name` | Varchar | Not Null | Employee's full name |
| `skill` | Varchar | - | Core skill/trade (e.g., 'Chef', 'Manager') |
| `pay-rate` | Decimal | Check (pay-rate > 0) | Hourly or monthly salary rate |

### 2. Position Table (`Position`)
Defines the various postings or jobs available within the establishment and their required skills.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `posting_no` | Int | Primary Key | Unique posting identifier |
| `skill` | Varchar | Not Null | Skill required for this posting |

### 3. Duty Allocation Table (`Duty_allocation`)
Acts as a junction table representing the schedule/shift allocation details of employees to postings.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `posting_no` | Int | Foreign Key | References `Position(posting_no)` |
| `emp_no` | Int | Foreign Key | References `Employee(emp_no)` |
| `day` | Date | - | Allocated date |
| `shift` | Varchar | - | Allocated shift (e.g., 'Morning', 'Night') |
| *Composite Key* | `(posting_no, emp_no, day, shift)` | Primary Key | Guarantees scheduler integrity |

---

## Query Problems

Write robust SQL statements to solve the following data retrieval and modification requirements:

1. **Temporal Filtering**  
   Retrieve complete duty allocation details for the employee with ID **123461** during the month of **April 1986**.

2. **Scheduling Details**  
   Find all shift and allocation details assigned to the employee named **'xyz'**.

3. **Relative Salary Comparisons**  
   Find all employees whose rate of pay is greater than or equal to the rate of pay of employee **'xyz'**.

4. **Correlated IDs and Pay Thresholds (Quantified Comparison)**  
   Retrieve the names and pay rates of employees with an `emp_no` less than **123460** whose rate of pay is strictly greater than the pay rate of **at least one** employee whose `emp_no` is greater than or equal to **123460**.

5. **Relational Division (The 'ALL' Operator)**  
   Find the names of all employees who are assigned to **every** position requiring a **'Chef'** skill.

6. **Extreme Value Queries (Minima)**  
   Find the employee(s) who receive the lowest pay rate.

7. **Conditional Intersect (Skill and Allocation)**  
   Retrieve a distinct list of names of employees skilled as a **'Chef'** who have been assigned to at least one duty.

8. **Aggregates and Groups**  
   Get the total count of unique/distinct employees assigned to each shift.

9. **Data Modification (DML Updates)**  
   Write a query to update employee details (e.g., incrementing or modifying the pay rate or skill set).

10. **Schema Abstraction (Views)**  
    Create a database view that consolidates employee names, scheduled dates, shifts, and position skills for quick scheduling overviews.
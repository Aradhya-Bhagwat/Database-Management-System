# Lab Assignment 03: Data Manipulation Language (DML) & Basic SQL Queries

## Objective
To populate relational tables and construct precise Data Manipulation Language (DML) queries in SQL. This lab focuses on data retrieval, projection, sorting, conditional filtering (using `LIKE`, comparative operators), arithmetic expressions, and basic aggregate functions.

---

## Database Schema

### 1. Department Table (`DEPT`)
Tracks the departments within the organization.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `DEPTNO` | Number/Int | Primary Key | Department number |
| `DNAME` | Varchar | - | Department name |
| `LOC` | Varchar | - | Location of the department |

### 2. Employee Table (`EMP`)
Tracks employee details, job designations, salary structures, and department assignments.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `EmpNo` | Number/Int | Primary Key | Employee ID |
| `Ename` | Varchar | - | Employee name |
| `Job` | Varchar | - | Designation / Job role |
| `MGR` | Number/Int | Foreign Key | Manager's employee number (self-referential) |
| `HireDate` | Date | - | Date of hiring |
| `Salary` | Decimal | - | Basic monthly salary |
| `Commission` | Decimal | - | Monthly commission / performance bonus |
| `Deptno` | Number/Int | Foreign Key | References `DEPT(DEPTNO)` |

---

## Sample Data Overview

### Departments (`DEPT`)
- **10**: Accounting (New York)
- **20**: Research (Dallas)
- **30**: Sales (Chicago)
- **40**: Operations (Boston)

### Employees (`EMP`)
*Examples include:*
- **7369**: Smith (Clerk, MGR: 7902, Salary: 800, Commission: 300, Dept: 20)
- **7499**: Allen (Salesman, MGR: 7698, Salary: 1600, Commission: 300, Dept: 30)

---

## Query Tasks to Solve

Formulate and execute SQL queries to perform the following operations:

1. **Department Aggregates**  
   List the total number of employees and their average salary in department **20**.

2. **Salary Deductions / Calculations**  
   List the name, salary, and provident fund (PF) amount for all employees.  
   *(Note: PF is calculated as 10% of the basic salary)*

3. **Sorting by Remuneration**  
   Retrieve complete employee details, sorted in **ascending order** of their basic salary.

4. **Chronological Sorting**  
   List the employee name and their hire date, sorted in **descending order** of the hire date (newest employees first).

5. **Payroll Summary (Derived Values)**  
   List the employee name, basic salary, PF, HRA, DA, and gross salary. Order the results in **ascending order** of gross salary.  
   *(Formulas: HRA = 50% of salary, DA = 30% of salary, Gross = Salary + HRA + DA - PF)*

6. **Staffing Counts**  
   List the department numbers and the count of employees currently working in each department.

7. **Salary Increments (Fixed)**  
   Increment the basic salary of all salesmen by **10% of their basic salary**.

8. **Comprehensive Statistics**  
   Retrieve the total salary, maximum salary, minimum salary, and average salary for all employees belonging to department **20**.

9. **Pattern Matching**  
   Find all employees whose names contain the letter **‘I’** as their **third character** (e.g., Smith, etc.).

10. **Role-Specific Maxima**  
    Find the maximum salary paid to any employee with the job role of **Salesman**.

11. **Salary Increments (Current)**  
    Increase the salary of all salesmen by **10% of their current salary**.

---

## Code Reference
The full SQL query script containing table populations and data manipulation operations can be accessed here: [DML.sql](./DML.sql)
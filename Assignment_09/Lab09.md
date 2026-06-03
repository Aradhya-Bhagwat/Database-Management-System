# Lab Assignment 09: PL/SQL Cursors

## Objective
To implement row-by-row processing in database-side logic using SQL Cursors. This assignment focuses on designing a cursor within a stored procedure that iterates through customer banking records, calculates simple interest for each customer, and populates a separate temporary list table with the calculated values.

---

## Relational Schema

### 1. Customer Table (`Customer`)
Stores the primary details, principal amounts, interest rates, and terms of the loan/deposit for customers.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `cust_id` | Int | Primary Key | Unique customer identifier |
| `Principal_amount` | Decimal(10,2) | - | The principal loan/deposit amount |
| `Rate_of_interest` | Decimal(5,2) | - | Annual rate of interest (percentage) |
| `No_of_Years` | Int | - | Term duration in years |

### 2. Temp List Table (`TEMPLIST`)
A temporary log table used to store calculated simple interest for each customer.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `cust_id` | Int | - | Customer identifier |
| `Simple_Interest` | Decimal(10,2) | - | Calculated simple interest amount |

---

## Program Specifications & Requirements

The implementation must fulfill the following database and logic operations:

1. **Schema & Referential Constraints**
   - Create the `Banking` database if it does not exist.
   - Construct the `Customer` and `TEMPLIST` tables.

2. **Cursor-Driven Calculation (Stored Procedure)**
   - Define a stored procedure named `CalculateInterest`.
   - Inside the procedure, declare a CURSOR `cur` that selects `cust_id`, `Principal_amount`, `Rate_of_interest`, and `No_of_Years` from the `Customer` table.
   - Declare a `CONTINUE HANDLER FOR NOT FOUND` to set a termination flag when all records have been read.
   - Open the cursor and iterate through all customer records using a loop.
   - In each iteration, fetch the values from the cursor, calculate the Simple Interest using the formula:
     `Simple_Interest = (Principal_amount * Rate_of_interest * No_of_Years) / 100`
   - Insert the customer ID and the calculated simple interest into the `TEMPLIST` table.
   - Close the cursor upon loop termination to free database resources.

3. **Data Verification**
   - Populate the `Customer` table with sample data.
   - Call the `CalculateInterest()` stored procedure.
   - Verify the results by querying the `TEMPLIST` table to display the calculated interest for all customers.

---

## Code Reference
The full SQL script containing the schema definition, stored procedure with cursor logic, sample data, and verification queries can be accessed here: [cursor.sql](./cursor.sql)

# Lab Assignment 07: PL/SQL Stored Functions

## Objective
To design and implement modular database-side logic by creating stored functions in MySQL. This assignment focuses on constructing a stored function that retrieves derived customer address profiles (specifically their city) by performing multi-table joins using foreign key constraints.

---

## Relational Schema

### 1. Customer Table (`Customer`)
Stores the primary details, street addresses, and contact information of the customers.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `cno` | Int | Primary Key | Unique customer identification number |
| `cname` | Varchar(255) | - | Full name of the customer |
| `street` | Varchar(255) | - | Street address of the customer |
| `zip` | Int | Foreign Key | References `Zipcode(zip)` |
| `phno` | Varchar(15) | - | Contact phone number |

### 2. Zipcode Table (`Zipcode`)
Maps area zip codes to their respective city names.

| Column Name | Data Type | Key Type | Description |
| :--- | :--- | :--- | :--- |
| `zip` | Int | Primary Key | Unique area zip code |
| `city` | Varchar(255) | - | Name of the city |

---

## Program Specifications & Requirements

The implementation must fulfill the following database and logic operations:

1. **Schema Creation & Constraints**
   - Create the `CustomerDB` database if it does not exist.
   - Design and build the `Customer` and `Zipcode` tables enforcing primary key and referential integrity constraints.

2. **Data Ingestion**
   - Populate the `Zipcode` table with representative area mapping details.
   - Populate the `Customer` table with corresponding customer records.

3. **Stored Function Design (`GetCustomerCity`)**
   - Declare a deterministic function `GetCustomerCity` that accepts a customer number `cust_no` (INT) as its input parameter and returns the city name (VARCHAR) as output.
   - Inside the function block, execute an inner join between the `Customer` and `Zipcode` tables on the `zip` attribute.
   - Return the matched city name for the requested customer.

4. **Testing and Verification**
   - Test the stored function by calling it for various populated customer numbers (e.g., `101`, `102`, `103`, etc.) and printing the results in a formatted output.

---

## Code Reference
The complete SQL script containing the schema definition, data population, stored function, and validation queries can be accessed here: [CustomerDB.sql](./CustomerDB.sql)

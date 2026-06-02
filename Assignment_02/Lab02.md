# Lab Assignment 02: Database Creation and DDL Constraints

## Objective
To implement physical database schemas using Data Definition Language (DDL) commands in SQL. The design must enforce standard relational constraints, including Primary Keys, Foreign Keys (with referential integrity), Check constraints, and Nullability constraints.

---

## Schema 1: Suppliers, Parts, and Shipments (LogisticsDB)

### Database Description
A logistics and manufacturing database designed to keep track of suppliers, parts, ongoing projects, and shipments between them.

### Tables and Constraints

1. **Suppliers (`S`)**
   - `S#` (Supplier ID): Primary Key
   - `Name`: Varchar, Not Null
   - `Status`: Integer, Check (Status > 0)
   - `City`: Varchar, Default 'Unknown'

2. **Parts (`P`)**
   - `P#` (Part ID): Primary Key
   - `Pname`: Varchar, Not Null
   - `Colour`: Varchar
   - `Weight`: Decimal/Float, Check (Weight > 0)
   - `City`: Varchar

3. **Projects (`J`)**
   - `J#` (Project ID): Primary Key
   - `Jname`: Varchar, Not Null
   - `City`: Varchar

4. **Shipments (`SPJ`)**
   - `S#`: Foreign Key referencing `S(S#)`
   - `P#`: Foreign Key referencing `P(P#)`
   - `J#`: Foreign Key referencing `J(J#)`
   - `Qty` (Quantity): Integer, Check (Qty > 0)
   - *Composite Primary Key*: `(S#, P#, J#)`

---

## Schema 2: Employee and Company Management (OfficeDB)

### Database Description
An enterprise database that tracks employees, the companies they work for, their salaries, and their managerial hierarchy.

### Tables and Constraints

1. **Employee (`employee`)**
   - `employee_name`: Varchar, Primary Key
   - `street`: Varchar, Not Null
   - `city`: Varchar, Not Null

2. **Company (`company`)**
   - `company_name`: Varchar, Primary Key
   - `city`: Varchar, Not Null

3. **Works (`works`)**
   - `employee_name`: Varchar, Primary Key, Foreign Key referencing `employee(employee_name)`
   - `company_name`: Varchar, Foreign Key referencing `company(company_name)`
   - `salary`: Decimal(10,2), Check (salary >= 0)

4. **Manages (`manages`)**
   - `employee_name`: Varchar, Primary Key, Foreign Key referencing `employee(employee_name)`
   - `manager_name`: Varchar, Foreign Key referencing `employee(employee_name)`

---

## Code Reference
The physical database implementation scripts enforcing these schemas and constraints can be accessed here:
- **Logistics Database (Schema 1)**: [LogisticsDB.sql](./LogisticsDB.sql)
- **Office Database (Schema 2)**: [OfficeDB.sql](./OfficeDB.sql)
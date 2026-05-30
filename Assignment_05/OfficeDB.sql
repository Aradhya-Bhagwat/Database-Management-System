CREATE DATABASE OfficeDB;
USE OfficeDB;

CREATE TABLE Employee (
    emp_no INT PRIMARY KEY,
    name VARCHAR(50),
    skill VARCHAR(50),
    pay_rate DECIMAL(10,2)
);

CREATE TABLE Position (
    posting_no INT PRIMARY KEY,
    skill VARCHAR(50)
);

CREATE TABLE Duty_allocation (
    posting_no INT,
    emp_no INT,
    day DATE,
    shift VARCHAR(20),
    PRIMARY KEY (posting_no, emp_no, day), 
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no) ON DELETE CASCADE
);

INSERT INTO Employee VALUES 
(123459, 'Amit Sharma', 'Chef', 500),
(123460, 'Rajesh Kumar', 'Manager', 600),
(123461, 'Priya Verma', 'Chef', 550),
(123462, 'Vikram Singh', 'Waiter', 300),
(123463, 'Neha Patil', 'Chef', 520),
(123464, 'Suresh Nair', 'Cashier', 400);

INSERT INTO Position VALUES 
(1, 'Chef'),
(2, 'Manager'),
(3, 'Waiter'),
(4, 'Cashier');

INSERT INTO Duty_allocation VALUES 
(1, 123461, '1986-04-05', 'Morning'),
(2, 123460, '1986-04-06', 'Evening'),
(3, 123462, '1986-04-07', 'Night'),
(1, 123463, '1986-04-08', 'Morning');

SELECT * FROM Duty_allocation 
WHERE emp_no = 123461 
AND MONTH(day) = 4 AND YEAR(day) = 1986;

SELECT shift FROM Duty_allocation 
WHERE emp_no = (SELECT emp_no FROM Employee WHERE name = 'Suresh Nair');

SELECT * FROM Employee 
WHERE pay_rate >= (SELECT pay_rate FROM Employee WHERE name = 'Suresh Nair');


SELECT name, pay_rate FROM Employee 
WHERE emp_no < 123460 
AND pay_rate > ANY (SELECT pay_rate FROM Employee WHERE emp_no >= 123460);

-- 5. Find names of employees assigned to all positions requiring a Chef’s skill
SELECT e.name FROM Employee e 
WHERE e.skill = 'Chef'
AND NOT EXISTS (
    SELECT * FROM Position p WHERE p.skill = 'Chef'
    AND NOT EXISTS (
        SELECT * FROM Duty_allocation d 
        WHERE d.emp_no = e.emp_no AND d.posting_no = p.posting_no
    )
);

SELECT * FROM Employee 
WHERE pay_rate = (SELECT MIN(pay_rate) FROM Employee);

SELECT DISTINCT e.name FROM Employee e
JOIN Duty_allocation d ON e.emp_no = d.emp_no
WHERE e.skill = 'Chef';

SELECT shift, COUNT(DISTINCT emp_no) AS employee_count 
FROM Duty_allocation 
GROUP BY shift;

UPDATE Employee 
SET pay_rate = pay_rate * 1.10 
WHERE skill = 'Chef';

CREATE VIEW Employee_Shift_Details AS 
SELECT e.emp_no, e.name, e.skill, e.pay_rate, d.shift 
FROM Employee e 
JOIN Duty_allocation d ON e.emp_no = d.emp_no;
SELECT * FROM Employee_Shift_Details;

DROP DATABASE IF EXISTS OfficeDB;
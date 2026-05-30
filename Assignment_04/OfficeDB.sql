CREATE DATABASE IF NOT EXISTS office;
USE office;

CREATE TABLE employee (
    employee_name VARCHAR(100) PRIMARY KEY,
    street VARCHAR(150),
    city VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE company (
    company_name VARCHAR(100) PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    established_year INT
);

CREATE TABLE works (
    employee_name VARCHAR(100),
    company_name VARCHAR(100),
    salary DECIMAL(12, 2) CHECK (salary > 0),
    position VARCHAR(100),
    PRIMARY KEY (employee_name, company_name),
    FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

CREATE TABLE manages (
    employee_name VARCHAR(100),
    manager_name VARCHAR(100),
    PRIMARY KEY (employee_name, manager_name),
    FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
    FOREIGN KEY (manager_name) REFERENCES employee(employee_name)
);

DESC employee;
DESC company;
DESC works;
DESC manages;

INSERT INTO employee (employee_name, street, city, email) 
VALUES 
('Aman', 'MG Road', 'Bangalore', 'aman@gmail.com'),
('Bob', 'LBS Marg', 'Mumbai', 'bob@rediffmail.com'),
('Dev', 'Connaught Place', 'Delhi', 'dev@yahoo.co.in');

INSERT INTO company (company_name, city, established_year) 
VALUES 
('TechCorp', 'Bangalore', 1999),
('BizInc', 'Mumbai', 2005),
('First Bank Corporation', 'Delhi', 1995),
('Small Bank Corporation', 'Delhi', 2000);

INSERT INTO works (employee_name, company_name, salary, position) 
VALUES 
('Aman', 'TechCorp', 90000.00, 'Software Engineer'),
('Bob', 'BizInc', 80000.00, 'Data Analyst'),
('Dev', 'TechCorp', 95000.00, 'Senior Developer'),
('Aman', 'First Bank Corporation', 120000.00, 'Manager'),
('Bob', 'First Bank Corporation', 110000.00, 'Senior Data Analyst'),
('Dev', 'Small Bank Corporation', 105000.00, 'Lead Developer');

INSERT INTO manages (employee_name, manager_name) 
VALUES 
('Bob', 'Aman'),
('Dev', 'Aman'),
('Bob', 'Dev');

ALTER TABLE employee MODIFY COLUMN street VARCHAR(150);
ALTER TABLE works MODIFY COLUMN salary DECIMAL(12, 2);

UPDATE employee SET email = 'aman1@gmail.com' WHERE employee_name = 'Aman';
UPDATE works SET position = 'Lead Developer' WHERE employee_name = 'Dev';

SELECT * FROM employee;
SELECT AVG(salary) AS average_salary FROM works;

SELECT employee_name 
FROM works 
WHERE company_name = 'First Bank Corporation';

SELECT employee_name 
FROM works 
WHERE company_name != 'First Bank Corporation';

SELECT company_name 
FROM works 
GROUP BY company_name 
ORDER BY COUNT(employee_name) DESC 
LIMIT 1;

SELECT company_name 
FROM company 
WHERE city IN (SELECT city FROM company WHERE company_name = 'Small Bank Corporation');

SELECT * 
FROM works 
WHERE salary > 10000;

UPDATE works 
SET salary = salary * 1.10 
WHERE company_name = 'First Bank Corporation';

SELECT m.employee_name AS employee, m.manager_name 
FROM manages m 
JOIN employee e ON m.employee_name = e.employee_name;

SELECT e.employee_name, e.street, e.city 
FROM employee e 
JOIN works w ON e.employee_name = w.employee_name 
WHERE w.company_name = 'First Bank Corporation' AND w.salary > 10000;

SELECT DISTINCT company_name 
FROM works 
WHERE salary > (SELECT AVG(salary) FROM works WHERE company_name = 'First Bank Corporation');

DROP DATABASE IF EXISTS office;

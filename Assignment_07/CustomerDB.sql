CREATE DATABASE IF NOT EXISTS CustomerDB;
USE CustomerDB;

CREATE TABLE IF NOT EXISTS Customer (
    cno INT PRIMARY KEY,
    cname VARCHAR(255),
    street VARCHAR(255),
    zip INT,
    phno VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Zipcode (
    zip INT PRIMARY KEY,
    city VARCHAR(255)
);

INSERT INTO Customer (cno, cname, street, zip, phno) VALUES
(101, 'Aarav Sharma', '123 MG Road', 1101, '987-654-3210'),
(102, 'Priya Gupta', '456 Nehru St', 1102, '987-123-4567'),
(103, 'Rohan Patel', '789 Banerjee Lane', 1103, '998-765-4321'),
(104, 'Ananya Verma', '101 Ashoka St', 1104, '900-123-6789'),
(105, 'Siddharth Iyer', '202 Gandhi Rd', 1105, '877-654-1234');

INSERT INTO Zipcode (zip, city) VALUES
(1101, 'Delhi'),
(1102, 'Mumbai'),
(1103, 'Bangalore'),
(1104, 'Chennai'),
(1105, 'Hyderabad');

SELECT * FROM Customer;
SELECT * FROM Zipcode;

DELIMITER $$

CREATE FUNCTION GetCustomerCity(cust_no INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE customer_city VARCHAR(255);

    SELECT z.city
    INTO customer_city
    FROM Customer c
    JOIN Zipcode z ON c.zip = z.zip
    WHERE c.cno = cust_no;

    RETURN customer_city;
END$$

DELIMITER ;

SELECT GetCustomerCity(101) AS City_for_Customer_101;
SELECT GetCustomerCity(102) AS City_for_Customer_102;
SELECT GetCustomerCity(103) AS City_for_Customer_103;
SELECT GetCustomerCity(104) AS City_for_Customer_104;
SELECT GetCustomerCity(105) AS City_for_Customer_105;

DROP DATABASE IF EXISTS CustomerDB;
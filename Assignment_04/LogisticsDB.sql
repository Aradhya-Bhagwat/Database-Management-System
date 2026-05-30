CREATE DATABASE IF NOT EXISTS logistics;
USE logistics;

CREATE TABLE Suppliers (
    S INT PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Active', 'Inactive')),
    City VARCHAR(100) NOT NULL
);

CREATE TABLE Parts (
    P INT PRIMARY KEY,
    Pname VARCHAR(100) NOT NULL,
    Colour VARCHAR(50),
    Weight DECIMAL(10, 2),
    City VARCHAR(100) NOT NULL
);

CREATE TABLE Projects (
    J INT PRIMARY KEY,
    Jname VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL
);

CREATE TABLE Shipment (
    S INT,
    P INT,
    J INT,
    Qty INT CHECK (Qty > 0),
    PRIMARY KEY (S, P, J),
    FOREIGN KEY (S) REFERENCES Suppliers(S),
    FOREIGN KEY (P) REFERENCES Parts(P) ON DELETE CASCADE,
    FOREIGN KEY (J) REFERENCES Projects(J)
);

INSERT INTO Suppliers (S, Name, Status, City) 
VALUES 
(1, 'John', 'Active', 'Bangalore'),
(2, 'Alex', 'Active', 'London'),
(3, 'Sarah', 'Inactive', 'Pune');

INSERT INTO Parts (P, Pname, Colour, Weight, City) 
VALUES 
(1, 'Steel Pipes', 'Silver', 5.20, 'Pune'),
(2, 'Steel Pipes', 'Silver', 5.50, 'Mumbai'),
(3, 'Copper Pipes', 'Green', 4.00, 'London');

INSERT INTO Projects (J, Jname, City) 
VALUES 
(1, 'Project A', 'London'),
(2, 'Project B', 'Mumbai'),
(3, 'Project C', 'Pune');

INSERT INTO Shipment (S, P, J, Qty) 
VALUES 
(1, 1, 1, 100), 
(2, 2, 2, 200), 
(1, 3, 3, 150), 
(3, 1, 2, 50);

SELECT DISTINCT S
FROM Shipment
WHERE J = 1;

SELECT DISTINCT P
FROM Shipment S
JOIN Suppliers Su ON S.S = Su.S
WHERE Su.City = 'London';

SELECT SUM(Qty) AS TotalQuantity
FROM Shipment
WHERE P = 1 AND S = 1;

SELECT DISTINCT Jname
FROM Shipment S
JOIN Projects P ON S.J = P.J
WHERE S.S = 1;

SELECT DISTINCT Colour
FROM Shipment S
JOIN Parts P ON S.P = P.P
WHERE S.S = 1;

SELECT DISTINCT Pname, Colour, City
FROM Parts;

SELECT DISTINCT J
FROM Shipment;

SELECT DISTINCT Colour
FROM Shipment S
JOIN Parts P ON S.P = P.P
WHERE S.S = 1;

DELETE FROM Parts
WHERE Colour = 'Green';

CREATE VIEW Supplier_Project_View AS
SELECT S.S AS SupplierID, P.Pname AS PartName, P.Colour AS PartColour, J.Jname AS ProjectName
FROM Shipment S
JOIN Parts P ON S.P = P.P
JOIN Projects J ON S.J = J.J;

DROP DATABASE IF EXISTS logistics;
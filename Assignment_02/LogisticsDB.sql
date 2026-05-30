CREATE DATABASE IF NOT EXISTS logistics;
USE logistics;

CREATE TABLE Suppliers (
    S INT PRIMARY KEY , 
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
    FOREIGN KEY (P) REFERENCES Parts(P),
    FOREIGN KEY (J) REFERENCES Projects(J)
);

DESC Suppliers;
DESC Parts;
DESC Projects;
DESC Shipment;

INSERT INTO Suppliers (S, Name, Status, City) VALUES (1, 'John', 'Active', 'Bangalore');
INSERT INTO Parts (P, Pname, Colour, Weight, City) VALUES (1, 'Steel Pipes', 'Silver', 5.20, 'Pune');
INSERT INTO Parts (P, Pname, Colour, Weight, City) VALUES (2, 'Steel Pipes', 'Silver', 5.50, 'Mumbai');

SELECT * FROM Parts;

DROP DATABASE IF EXISTS logistics; 
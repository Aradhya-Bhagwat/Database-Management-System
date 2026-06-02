CREATE DATABASE IF NOT EXISTS Facebook;
USE Facebook;

CREATE TABLE Highschooler (
    ID INT PRIMARY KEY,
    name TEXT,
    grade INT
);

CREATE TABLE Friend (
    ID1 INT,
    ID2 INT,
    PRIMARY KEY (ID1, ID2),
    FOREIGN KEY (ID1) REFERENCES Highschooler(ID),
    FOREIGN KEY (ID2) REFERENCES Highschooler(ID)
);

CREATE TABLE Likes (
    ID1 INT,
    ID2 INT,
    PRIMARY KEY (ID1, ID2),
    FOREIGN KEY (ID1) REFERENCES Highschooler(ID),
    FOREIGN KEY (ID2) REFERENCES Highschooler(ID)
);

INSERT INTO Highschooler (ID, name, grade) VALUES
(1, 'Aarsh', 10),
(2, 'Bob', 11),
(3, 'Charlie', 12),
(4, 'Diam', 10),
(5, 'Ira', 11);

INSERT INTO Friend (ID1, ID2) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 3),
(5, 1);

DELIMITER $$

CREATE TRIGGER insert_friend_symmetry
AFTER INSERT ON Friend
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Friend WHERE ID1 = NEW.ID2 AND ID2 = NEW.ID1) THEN
        INSERT INTO Friend (ID1, ID2) VALUES (NEW.ID2, NEW.ID1);
    END IF;
END$$

CREATE TRIGGER delete_friend_symmetry
AFTER DELETE ON Friend
FOR EACH ROW
BEGIN
    DELETE FROM Friend WHERE ID1 = OLD.ID2 AND ID2 = OLD.ID1;
END$$

DELIMITER ;

DROP DATABASE IF EXISTS Facebook;
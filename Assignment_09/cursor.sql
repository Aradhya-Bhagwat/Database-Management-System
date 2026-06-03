CREATE DATABASE IF NOT EXISTS Banking;
USE Banking;

CREATE TABLE Customer (
    cust_id INT PRIMARY KEY,
    Principal_amount DECIMAL(10,2),
    Rate_of_interest DECIMAL(5,2),
    No_of_Years INT
);

CREATE TABLE TEMPLIST (
    cust_id INT,
    Simple_Interest DECIMAL(10,2)
);

DELIMITER $$

CREATE PROCEDURE CalculateInterest()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_cust_id INT;
    DECLARE v_principal DECIMAL(10,2);
    DECLARE v_rate DECIMAL(5,2);
    DECLARE v_years INT;
    DECLARE v_interest DECIMAL(10,2);

    DECLARE cur CURSOR FOR SELECT cust_id, Principal_amount, Rate_of_interest, No_of_Years FROM Customer;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_cust_id, v_principal, v_rate, v_years;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET v_interest = (v_principal * v_rate * v_years) / 100;
        INSERT INTO TEMPLIST (cust_id, Simple_Interest) VALUES (v_cust_id, v_interest);
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;

INSERT INTO Customer (cust_id, Principal_amount, Rate_of_interest, No_of_Years) VALUES
(1, 1000.00, 5.0, 2),
(2, 2000.00, 4.5, 3),
(3, 1500.00, 6.0, 1),
(4, 3000.00, 5.5, 4),
(5, 2500.00, 4.0, 2);

CALL CalculateInterest();

SELECT * FROM TEMPLIST;
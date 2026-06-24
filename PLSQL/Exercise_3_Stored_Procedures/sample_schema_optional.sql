-- Optional sample schema for Exercise 3: Stored Procedures
-- Run this only if you do not already have the required tables.

SET SERVEROUTPUT ON;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE accounts';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

CREATE TABLE accounts (
    account_id      NUMBER PRIMARY KEY,
    customer_id     NUMBER,
    account_type    VARCHAR2(20),
    balance         NUMBER(12, 2)
);

CREATE TABLE employees (
    employee_id     NUMBER PRIMARY KEY,
    employee_name   VARCHAR2(100),
    department_id   NUMBER,
    salary          NUMBER(12, 2)
);

INSERT INTO accounts VALUES (101, 1, 'SAVINGS', 10000.00);
INSERT INTO accounts VALUES (102, 2, 'SAVINGS', 15000.00);
INSERT INTO accounts VALUES (103, 3, 'CURRENT', 20000.00);
INSERT INTO accounts VALUES (104, 4, 'SAVINGS', 5000.00);

INSERT INTO employees VALUES (1, 'Arun', 10, 30000.00);
INSERT INTO employees VALUES (2, 'Bala', 10, 35000.00);
INSERT INTO employees VALUES (3, 'Charan', 20, 40000.00);
INSERT INTO employees VALUES (4, 'Divya', 20, 45000.00);

COMMIT;

SELECT * FROM accounts;
SELECT * FROM employees;

-- Optional Sample Schema for Testing
-- Run this only if you do not already have CUSTOMERS and LOANS tables.

CREATE TABLE customers (
    customer_id     NUMBER PRIMARY KEY,
    customer_name   VARCHAR2(100),
    age             NUMBER,
    balance         NUMBER(12,2),
    isvip           VARCHAR2(5)
);

CREATE TABLE loans (
    loan_id         NUMBER PRIMARY KEY,
    customer_id     NUMBER,
    interest_rate   NUMBER(5,2),
    due_date        DATE,
    CONSTRAINT fk_loans_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES (1, 'Arun Kumar', 65, 15000, 'FALSE');
INSERT INTO customers VALUES (2, 'Meena Ravi', 45, 8000, 'FALSE');
INSERT INTO customers VALUES (3, 'Rajesh Babu', 70, 12000, 'FALSE');
INSERT INTO customers VALUES (4, 'Priya Sharma', 30, 20000, 'FALSE');

INSERT INTO loans VALUES (101, 1, 12.5, TRUNC(SYSDATE) + 10);
INSERT INTO loans VALUES (102, 2, 11.0, TRUNC(SYSDATE) + 40);
INSERT INTO loans VALUES (103, 3, 13.0, TRUNC(SYSDATE) + 20);
INSERT INTO loans VALUES (104, 4, 10.5, TRUNC(SYSDATE) + 5);

COMMIT;

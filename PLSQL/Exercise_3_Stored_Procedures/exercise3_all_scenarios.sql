-- Exercise 3: Stored Procedures
-- Combined solution file for all 3 scenarios.

SET SERVEROUTPUT ON;

------------------------------------------------------------
-- Scenario 1: Process Monthly Interest
------------------------------------------------------------

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN
    UPDATE accounts
    SET balance = balance + (balance * 0.01)
    WHERE UPPER(account_type) = 'SAVINGS';

    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' savings account(s) updated with 1% monthly interest.');

    COMMIT;
END ProcessMonthlyInterest;
/

------------------------------------------------------------
-- Scenario 2: Update Employee Bonus
------------------------------------------------------------

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department_id IN employees.department_id%TYPE,
    p_bonus_percent IN NUMBER
)
AS
BEGIN
    IF p_bonus_percent < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Bonus percentage cannot be negative.');
    END IF;

    UPDATE employees
    SET salary = salary + (salary * p_bonus_percent / 100)
    WHERE department_id = p_department_id;

    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employee(s) updated in department ' || p_department_id || '.');

    COMMIT;
END UpdateEmployeeBonus;
/

------------------------------------------------------------
-- Scenario 3: Transfer Funds
------------------------------------------------------------

CREATE OR REPLACE PROCEDURE TransferFunds (
    p_source_account_id      IN accounts.account_id%TYPE,
    p_destination_account_id IN accounts.account_id%TYPE,
    p_amount                 IN NUMBER
)
AS
    v_source_balance accounts.balance%TYPE;
    v_destination_id accounts.account_id%TYPE;
BEGIN
    IF p_amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Transfer amount must be greater than zero.');
    END IF;

    IF p_source_account_id = p_destination_account_id THEN
        RAISE_APPLICATION_ERROR(-20003, 'Source and destination accounts cannot be the same.');
    END IF;

    SELECT balance
    INTO v_source_balance
    FROM accounts
    WHERE account_id = p_source_account_id
    FOR UPDATE;

    SELECT account_id
    INTO v_destination_id
    FROM accounts
    WHERE account_id = p_destination_account_id
    FOR UPDATE;

    IF v_source_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20004, 'Insufficient balance in source account.');
    END IF;

    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_source_account_id;

    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_destination_account_id;

    DBMS_OUTPUT.PUT_LINE('Transfer successful. Amount transferred: ' || p_amount);

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20005, 'Source or destination account not found.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END TransferFunds;
/

------------------------------------------------------------
-- Optional Test Commands
------------------------------------------------------------
-- EXEC ProcessMonthlyInterest;
-- EXEC UpdateEmployeeBonus(10, 5);
-- EXEC TransferFunds(101, 102, 1000);
-- SELECT * FROM accounts;
-- SELECT * FROM employees;

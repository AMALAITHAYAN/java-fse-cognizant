-- Exercise 3 - Scenario 1
-- Stored Procedure: ProcessMonthlyInterest
-- Requirement: Apply 1% monthly interest to all savings accounts.

SET SERVEROUTPUT ON;

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

-- Test:
-- EXEC ProcessMonthlyInterest;
-- SELECT * FROM accounts;

-- Exercise 3 - Scenario 3
-- Stored Procedure: TransferFunds
-- Requirement: Transfer a specified amount from one account to another
-- after checking that the source account has sufficient balance.

SET SERVEROUTPUT ON;

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

-- Test:
-- EXEC TransferFunds(101, 102, 1000);
-- SELECT * FROM accounts;

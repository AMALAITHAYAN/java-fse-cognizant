-- Scenario 3:
-- Print reminder messages for customers whose loans are due within the next 30 days.

SET SERVEROUTPUT ON;

DECLARE
    CURSOR loan_cursor IS
        SELECT
            c.customer_id,
            c.customer_name,
            l.loan_id,
            l.due_date
        FROM customers c
        JOIN loans l
            ON c.customer_id = l.customer_id
        WHERE l.due_date BETWEEN TRUNC(SYSDATE) AND TRUNC(SYSDATE) + 30;

BEGIN
    FOR loan_record IN loan_cursor LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear '
            || loan_record.customer_name
            || ', your loan ID '
            || loan_record.loan_id
            || ' is due on '
            || TO_CHAR(loan_record.due_date, 'DD-MON-YYYY')
            || '. Please make the payment on time.'
        );

    END LOOP;

END;
/

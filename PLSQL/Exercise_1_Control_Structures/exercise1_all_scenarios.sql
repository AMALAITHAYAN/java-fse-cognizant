-- Exercise 1: Control Structures
-- Complete PL/SQL solution for all 3 scenarios.
--
-- Assumed tables:
-- CUSTOMERS(customer_id, customer_name, age, balance, isvip)
-- LOANS(loan_id, customer_id, interest_rate, due_date)

-- Scenario 1:
-- Apply a 1% discount to current loan interest rates for customers above 60 years old.

SET SERVEROUTPUT ON;

DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, customer_name, age
        FROM customers;

BEGIN
    FOR customer_record IN customer_cursor LOOP

        IF customer_record.age > 60 THEN

            UPDATE loans
            SET interest_rate = interest_rate - 1
            WHERE customer_id = customer_record.customer_id;

            DBMS_OUTPUT.PUT_LINE(
                '1% interest discount applied for customer: '
                || customer_record.customer_name
            );

        END IF;

    END LOOP;

    COMMIT;

END;
/


-- Scenario 2:
-- Set IsVIP to TRUE for customers with balance over 10000.

SET SERVEROUTPUT ON;

DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, customer_name, balance
        FROM customers;

BEGIN
    FOR customer_record IN customer_cursor LOOP

        IF customer_record.balance > 10000 THEN

            UPDATE customers
            SET isvip = 'TRUE'
            WHERE customer_id = customer_record.customer_id;

            DBMS_OUTPUT.PUT_LINE(
                'Customer promoted to VIP: '
                || customer_record.customer_name
            );

        END IF;

    END LOOP;

    COMMIT;

END;
/


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


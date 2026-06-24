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

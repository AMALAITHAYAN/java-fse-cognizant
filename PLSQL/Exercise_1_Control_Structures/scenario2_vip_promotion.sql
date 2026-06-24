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

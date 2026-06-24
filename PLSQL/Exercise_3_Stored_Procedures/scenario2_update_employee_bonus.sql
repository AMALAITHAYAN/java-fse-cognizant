-- Exercise 3 - Scenario 2
-- Stored Procedure: UpdateEmployeeBonus
-- Requirement: Add bonus percentage to employees in a given department.

SET SERVEROUTPUT ON;

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

-- Test:
-- EXEC UpdateEmployeeBonus(10, 5);
-- SELECT * FROM employees;

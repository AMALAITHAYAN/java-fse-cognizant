Exercise 1: Control Structures - PL/SQL Solution

This ZIP contains:
1. exercise1_all_scenarios.sql
   - All 3 scenario answers in one SQL file.
2. scenario1_senior_discount.sql
   - Applies 1% loan interest discount for customers above 60.
3. scenario2_vip_promotion.sql
   - Sets IsVIP flag for customers with balance over 10000.
4. scenario3_loan_reminders.sql
   - Prints loan reminder messages for loans due in the next 30 days.
5. sample_schema_optional.sql
   - Optional sample tables and data for testing.

Assumed table names and columns:
CUSTOMERS(customer_id, customer_name, age, balance, isvip)
LOANS(loan_id, customer_id, interest_rate, due_date)

Notes:
- Run in Oracle SQL Developer / SQL*Plus.
- Execute: SET SERVEROUTPUT ON before running blocks.
- If your IsVIP column is NUMBER(1), replace 'TRUE' with 1.
- If your IsVIP column is CHAR(1), replace 'TRUE' with 'Y'.

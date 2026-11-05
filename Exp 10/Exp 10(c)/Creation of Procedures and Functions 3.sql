Aim:

To create and execute a procedure and a function using PL/SQL.

Algorithm:
1. Create an employee table.
2. Insert employee details.
3. Create a procedure to increase salary.
4. Create a function to calculate annual salary.
5. Call the procedure and function.
6. Display the results.
Code:SET SERVEROUTPUT ON;

CREATE TABLE e10c_employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    salary NUMBER
);

INSERT INTO e10c_employees
VALUES (1, 'Ravi', 30000);

-- Procedure

CREATE OR REPLACE PROCEDURE e10c_bonus (
    p_id IN NUMBER,
    p_amount IN NUMBER
)
AS
BEGIN
    UPDATE e10c_employees
    SET salary = salary + p_amount
    WHERE emp_id = p_id;
END;
/

-- Function

CREATE OR REPLACE FUNCTION e10c_annual_salary (
    p_id IN NUMBER
)
RETURN NUMBER
AS
    v_salary NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM e10c_employees
    WHERE emp_id = p_id;

    RETURN v_salary * 12;
END;
/

-- Calling Procedure and Function

BEGIN
    e10c_bonus(1, 5000);

    DBMS_OUTPUT.PUT_LINE(
        'Annual Salary: ' || e10c_annual_salary(1)
    );
END;
/

SELECT * FROM e10c_employees;

Output:
Annual Salary: 420000

EMP_ID  NAME  SALARY
1       Ravi  35000

PL/SQL procedure successfully completed.

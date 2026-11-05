Aim:

To write PL/SQL programs to handle predefined, non-predefined and user-defined exceptions.

Algorithm:
1. Create the required table.
2. Write a PL/SQL block for a predefined exception.
3. Write a block for a non-predefined Oracle exception.
4. Write a block for a user-defined exception.
5. Handle each exception using EXCEPTION.
6. Display suitable messages.
Code:SET SERVEROUTPUT ON;

-- Predefined Exception

DECLARE
    a NUMBER := 10;
    b NUMBER := 0;
    c NUMBER;
BEGIN
    c := a / b;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Division by zero error');
END;
/

-- Non-Predefined Exception

CREATE TABLE e10b_test (
    id NUMBER NOT NULL
);

DECLARE
    e_null EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_null, -1400);
BEGIN
    INSERT INTO e10b_test VALUES (NULL);
EXCEPTION
    WHEN e_null THEN
        DBMS_OUTPUT.PUT_LINE('NULL value not allowed');
END;
/

-- User-Defined Exception

DECLARE
    age NUMBER := -5;
    invalid_age EXCEPTION;
BEGIN
    IF age < 0 THEN
        RAISE invalid_age;
    END IF;
EXCEPTION
    WHEN invalid_age THEN
        DBMS_OUTPUT.PUT_LINE('Invalid age');
END;
/
Output:Division by zero error

NULL value not allowed

Invalid age

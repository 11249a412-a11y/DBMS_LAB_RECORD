Aim:

To create PL/SQL programs using implicit and explicit cursors to process database records.

Algorithm:
1. Create a student table.
2. Insert student records.
3. Use an implicit cursor to update marks.
4. Display the number of updated rows.
5. Declare an explicit cursor to retrieve student records.
6. Use a cursor FOR loop to display the records.
Code:SET SERVEROUTPUT ON;

CREATE TABLE e10e_students (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    marks NUMBER
);

INSERT INTO e10e_students VALUES (1, 'Ravi', 70);
INSERT INTO e10e_students VALUES (2, 'Priya', 85);
INSERT INTO e10e_students VALUES (3, 'Arun', 65);

-- Implicit Cursor

BEGIN
    UPDATE e10e_students
    SET marks = marks + 5
    WHERE marks < 80;

    DBMS_OUTPUT.PUT_LINE(
        'Rows Updated: ' || SQL%ROWCOUNT
    );
END;
/

-- Explicit Cursor

DECLARE
    CURSOR c_student IS
        SELECT name, marks
        FROM e10e_students
        ORDER BY id;
BEGIN
    FOR s IN c_student LOOP
        DBMS_OUTPUT.PUT_LINE(
            s.name || ' - ' || s.marks
        );
    END LOOP;
END;
/
Output:
Rows Updated: 2

Ravi - 75
Priya - 85
Arun - 70

PL/SQL procedure successfully completed.

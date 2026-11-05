Aim:

To write a PL/SQL program that accepts marks from the user and displays the grade using conditional statements.

Algorithm:
1. Start the program.
2. Accept marks from the user.
3. Check the marks using IF and ELSIF.
4. Display the grade or fail status.
5. End the program.
Code:SET SERVEROUTPUT ON;

ACCEPT p_marks NUMBER PROMPT 'Enter marks: '

DECLARE
    marks NUMBER := &p_marks;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade A');
    ELSIF marks >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Grade B');
    ELSIF marks >= 50 THEN
        DBMS_OUTPUT.PUT_LINE('Grade C');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
/
Output:
Enter marks: 85

Grade B

PL/SQL procedure successfully completed.

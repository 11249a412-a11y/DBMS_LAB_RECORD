Aim:

To create database tables using PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK and DEFAULT constraints.

Algorithm:
1. Create a department table.
2. Add PRIMARY KEY and UNIQUE constraints.
3. Create a student table.
4. Apply NOT NULL, CHECK, FOREIGN KEY and DEFAULT constraints.
5. Insert valid records.
6. Display the records.
Code:

CREATE TABLE e4_departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(30) UNIQUE NOT NULL
);

CREATE TABLE e4_students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    age NUMBER CHECK (age >= 17),
    dept_id NUMBER,
    city VARCHAR2(30) DEFAULT 'Chennai',
    FOREIGN KEY (dept_id)
        REFERENCES e4_departments(dept_id)
);

INSERT INTO e4_departments VALUES (10, 'CSE');
INSERT INTO e4_departments VALUES (20, 'ECE');

INSERT INTO e4_students
(student_id, name, age, dept_id)
VALUES (101, 'Ravi', 19, 10);

INSERT INTO e4_students
(student_id, name, age, dept_id)
VALUES (102, 'Priya', 20, 20);

SELECT * FROM e4_students
ORDER BY student_id;

Output:

STUDENT_ID  NAME    AGE  DEPT_ID  CITY
101         Ravi    19   10       Chennai
102         Priya   20   20       Chennai

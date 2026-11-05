Aim:

To design and implement a Student Information System using SQL to store and manage student, course and enrollment details.

Algorithm:
1. Create a student table.
2. Create a course table.
3. Create an enrollment table.
4. Establish relationships using foreign keys.
5. Insert student and course details.
6. Retrieve student enrollment information using JOIN.
Code:CREATE TABLE e11a_students (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(30),
    department VARCHAR2(20)
);

CREATE TABLE e11a_courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(30)
);

CREATE TABLE e11a_enrollments (
    student_id NUMBER,
    course_id NUMBER,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id)
        REFERENCES e11a_students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES e11a_courses(course_id)
);

INSERT INTO e11a_students VALUES (101, 'Ravi', 'CSE');
INSERT INTO e11a_students VALUES (102, 'Priya', 'IT');

INSERT INTO e11a_courses VALUES (1, 'DBMS');
INSERT INTO e11a_courses VALUES (2, 'OS');

INSERT INTO e11a_enrollments VALUES (101, 1);
INSERT INTO e11a_enrollments VALUES (101, 2);
INSERT INTO e11a_enrollments VALUES (102, 1);

SELECT s.student_name, c.course_name
FROM e11a_students s
JOIN e11a_enrollments e
ON s.student_id = e.student_id
JOIN e11a_courses c
ON e.course_id = c.course_id
ORDER BY s.student_id, c.course_id;
Output:
STUDENT_NAME  COURSE_NAME
Ravi          DBMS
Ravi          OS
Priya         DBMS

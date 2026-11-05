Aim:

To perform database normalization from 1NF to 5NF using functional dependencies and suitable table decomposition.

Algorithm:
1. Create a table with atomic values to satisfy 1NF.
2. Remove partial dependencies to obtain 2NF.
3. Remove transitive dependencies to obtain 3NF.
4. Separate independent multivalued dependencies to obtain 4NF.
5. Apply a valid join dependency to decompose a relation into 5NF.
6. Retrieve the normalized data.
Code:-- 1NF: Each column contains one atomic value

CREATE TABLE e8_1nf (
    student_id NUMBER,
    student_name VARCHAR2(30),
    dept_id NUMBER,
    dept_name VARCHAR2(30),
    course_id NUMBER,
    course_name VARCHAR2(30),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO e8_1nf
VALUES (1, 'Ravi', 10, 'CSE', 101, 'DBMS');

INSERT INTO e8_1nf
VALUES (1, 'Ravi', 10, 'CSE', 102, 'OS');

INSERT INTO e8_1nf
VALUES (2, 'Priya', 20, 'IT', 101, 'DBMS');


-- 2NF: Remove partial dependencies

CREATE TABLE e8_students_2nf AS
SELECT DISTINCT student_id, student_name,
       dept_id, dept_name
FROM e8_1nf;

CREATE TABLE e8_courses AS
SELECT DISTINCT course_id, course_name
FROM e8_1nf;

CREATE TABLE e8_enrollments AS
SELECT student_id, course_id
FROM e8_1nf;


-- 3NF: Remove transitive dependency

CREATE TABLE e8_departments AS
SELECT DISTINCT dept_id, dept_name
FROM e8_students_2nf;

CREATE TABLE e8_students_3nf AS
SELECT student_id, student_name, dept_id
FROM e8_students_2nf;


-- 4NF: Separate independent multivalued facts

CREATE TABLE e8_hobbies (
    student_id NUMBER,
    hobby VARCHAR2(30),
    PRIMARY KEY (student_id, hobby)
);

CREATE TABLE e8_languages (
    student_id NUMBER,
    language_name VARCHAR2(30),
    PRIMARY KEY (student_id, language_name)
);

INSERT INTO e8_hobbies VALUES (1, 'Cricket');
INSERT INTO e8_hobbies VALUES (1, 'Drawing');

INSERT INTO e8_languages VALUES (1, 'English');
INSERT INTO e8_languages VALUES (1, 'Tamil');


-- 5NF: Decomposition based on a valid join dependency

CREATE TABLE e8_supplier_part (
    supplier VARCHAR2(10),
    part VARCHAR2(10),
    PRIMARY KEY (supplier, part)
);

CREATE TABLE e8_supplier_project (
    supplier VARCHAR2(10),
    project VARCHAR2(10),
    PRIMARY KEY (supplier, project)
);

CREATE TABLE e8_part_project (
    part VARCHAR2(10),
    project VARCHAR2(10),
    PRIMARY KEY (part, project)
);

INSERT INTO e8_supplier_part VALUES ('S1', 'P1');
INSERT INTO e8_supplier_part VALUES ('S1', 'P2');

INSERT INTO e8_supplier_project VALUES ('S1', 'J1');
INSERT INTO e8_supplier_project VALUES ('S1', 'J2');

INSERT INTO e8_part_project VALUES ('P1', 'J1');
INSERT INTO e8_part_project VALUES ('P1', 'J2');
INSERT INTO e8_part_project VALUES ('P2', 'J1');
INSERT INTO e8_part_project VALUES ('P2', 'J2');

-- Display 3NF data

SELECT s.student_name, d.dept_name
FROM e8_students_3nf s
JOIN e8_departments d
ON s.dept_id = d.dept_id
ORDER BY s.student_id;

-- Display 4NF data

SELECT * FROM e8_hobbies ORDER BY hobby;

SELECT * FROM e8_languages ORDER BY language_name;

-- Reconstruct 5NF relationship

SELECT sp.supplier, sp.part, sj.project
FROM e8_supplier_part sp
JOIN e8_supplier_project sj
ON sp.supplier = sj.supplier
JOIN e8_part_project pj
ON sp.part = pj.part
Output:
  3NF Output:

STUDENT_NAME  DEPT_NAME
Ravi          CSE
Priya         IT

4NF Hobbies:

STUDENT_ID  HOBBY
1           Cricket
1           Drawing

4NF Languages:

STUDENT_ID  LANGUAGE_NAME
1           English
1           Tamil

5NF Output:

SUPPLIER  PART  PROJECT
S1        P1    J1
S1        P1    J2
S1        P2    J1
S1        P2    J2
  
AND sj.project = pj.project
ORDER BY sp.part, sj.project;

Aim:
  To create a student table in a database, insert records, and retrieve information using SQL queries.

Algorithm:
1. Start the SQL environment.
2. Create a student table.
3. Insert student details into the table.
4. Retrieve all records using SELECT.
5. Retrieve specific records using WHERE.
6. Display the results.

Code:
CREATE TABLE e1_students (
    roll_no NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    department VARCHAR2(20),
    marks NUMBER
);

INSERT INTO e1_students VALUES (101, 'Ravi', 'CSE', 78);
INSERT INTO e1_students VALUES (102, 'Meena', 'CSE', 92);
INSERT INTO e1_students VALUES (103, 'Sara', 'IT', 66);
INSERT INTO e1_students VALUES (104, 'Arun', 'ECE', 85);

SELECT * FROM e1_students;

SELECT roll_no, name, marks
FROM e1_students
WHERE marks >= 80
ORDER BY marks DESC;


Output:
  
All Student Records:

ROLL_NO  NAME    DEPARTMENT  MARKS
101      Ravi    CSE         78
102      Meena   CSE         92
103      Sara    IT          66
104      Arun    ECE         85

Students with Marks >= 80:

ROLL_NO  NAME    MARKS
102      Meena   92
104      Arun    85

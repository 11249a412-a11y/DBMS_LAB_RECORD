Aim:

To perform INSERT, UPDATE, DELETE, ALTER and SELECT operations on a database table using conditions.

Algorithm:
1. Create a student table.
2. Insert student records.
3. Add a new column using ALTER.
4. Modify records using UPDATE.
5. Delete records using DELETE.
6. Display the remaining records.
Code:CREATE TABLE e2_students (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    age NUMBER
);

INSERT INTO e2_students VALUES (1, 'Ravi', 19);
INSERT INTO e2_students VALUES (2, 'Priya', 20);
INSERT INTO e2_students VALUES (3, 'Arun', 18);

ALTER TABLE e2_students
ADD email VARCHAR2(50);

UPDATE e2_students
SET age = 21,
    email = 'priya@example.com'
WHERE id = 2;

DELETE FROM e2_students
WHERE age < 19;

SELECT *
FROM e2_students
WHERE age >= 19
ORDER BY id;

output:

ID   NAME    AGE   EMAIL
1    Ravi    19    NULL
2    Priya   21    priya@example.com

1 row updated.
1 row deleted.

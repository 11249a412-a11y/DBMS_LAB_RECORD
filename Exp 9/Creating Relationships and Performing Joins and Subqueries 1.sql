Aim:

To establish relationships between database tables and retrieve records using joins and subqueries.

Algorithm:
1. Create department and employee tables.
2. Establish their relationship using a foreign key.
3. Insert sample records.
4. Perform INNER JOIN, LEFT JOIN and RIGHT JOIN.
5. Execute a subquery using aggregate functions.
6. Display the results.
Code:CREATE TABLE e9_departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(30)
);

CREATE TABLE e9_employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(30),
    salary NUMBER,
    dept_id NUMBER,
    FOREIGN KEY (dept_id)
        REFERENCES e9_departments(dept_id)
);

INSERT INTO e9_departments VALUES (10, 'CSE');
INSERT INTO e9_departments VALUES (20, 'ECE');
INSERT INTO e9_departments VALUES (30, 'IT');

INSERT INTO e9_employees VALUES (1, 'Ravi', 40000, 10);
INSERT INTO e9_employees VALUES (2, 'Priya', 50000, 20);
INSERT INTO e9_employees VALUES (3, 'Arun', 65000, 20);
INSERT INTO e9_employees VALUES (4, 'Sara', 60000, NULL);

-- INNER JOIN
SELECT e.emp_name, d.dept_name
FROM e9_employees e
INNER JOIN e9_departments d
ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

-- LEFT JOIN
SELECT e.emp_name, d.dept_name
FROM e9_employees e
LEFT JOIN e9_departments d
ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

-- RIGHT JOIN
SELECT e.emp_name, d.dept_name
FROM e9_employees e
RIGHT JOIN e9_departments d
ON e.dept_id = d.dept_id
ORDER BY d.dept_id, e.emp_id;

-- SUBQUERY
SELECT emp_name, salary
FROM e9_employees
WHERE salary > (
    SELECT AVG(salary) FROM e9_employees
)
ORDER BY salary DESC;

output:
CREATE TABLE e9_departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(30)
);

CREATE TABLE e9_employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(30),
    salary NUMBER,
    dept_id NUMBER,
    FOREIGN KEY (dept_id)
        REFERENCES e9_departments(dept_id)
);

INSERT INTO e9_departments VALUES (10, 'CSE');
INSERT INTO e9_departments VALUES (20, 'ECE');
INSERT INTO e9_departments VALUES (30, 'IT');

INSERT INTO e9_employees VALUES (1, 'Ravi', 40000, 10);
INSERT INTO e9_employees VALUES (2, 'Priya', 50000, 20);
INSERT INTO e9_employees VALUES (3, 'Arun', 65000, 20);
INSERT INTO e9_employees VALUES (4, 'Sara', 60000, NULL);

-- INNER JOIN
SELECT e.emp_name, d.dept_name
FROM e9_employees e
INNER JOIN e9_departments d
ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

-- LEFT JOIN
SELECT e.emp_name, d.dept_name
FROM e9_employees e
LEFT JOIN e9_departments d
ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

-- RIGHT JOIN
SELECT e.emp_name, d.dept_name
FROM e9_employees e
RIGHT JOIN e9_departments d
ON e.dept_id = d.dept_id
ORDER BY d.dept_id, e.emp_id;

-- SUBQUERY
SELECT emp_name, salary
FROM e9_employees
WHERE salary > (
    SELECT AVG(salary) FROM e9_employees
)
ORDER BY salary DESC;

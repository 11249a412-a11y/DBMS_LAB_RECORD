Aim:

To perform SQL queries using ANY, ALL, IN, EXISTS, NOT EXISTS, UNION and INTERSECT operators.

Algorithm:
1. Create an employee table.
2. Insert employee details.
3. Use ANY and ALL to compare values.
4. Use IN to select matching values.
5. Use EXISTS and NOT EXISTS to check conditions.
6. Use UNION and INTERSECT to combine query results.
7. Display the output.
Code:
CREATE TABLE e5_employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(30),
    dept_id NUMBER,
    salary NUMBER
);

INSERT INTO e5_employees VALUES (1, 'Asha', 10, 40000);
INSERT INTO e5_employees VALUES (2, 'Bala', 20, 50000);
INSERT INTO e5_employees VALUES (3, 'Charan', 20, 60000);
INSERT INTO e5_employees VALUES (4, 'Divya', 30, 70000);

-- ANY
SELECT emp_name FROM e5_employees
WHERE salary > ANY
(SELECT salary FROM e5_employees WHERE dept_id = 20);

-- ALL
SELECT emp_name FROM e5_employees
WHERE salary > ALL
(SELECT salary FROM e5_employees WHERE dept_id = 20);

-- IN
SELECT emp_name FROM e5_employees
WHERE dept_id IN (10, 30);

-- EXISTS
SELECT emp_name FROM e5_employees e
WHERE EXISTS (
    SELECT 1 FROM e5_employees x
    WHERE x.dept_id = e.dept_id
    AND x.salary > e.salary
);

-- NOT EXISTS
SELECT emp_name FROM e5_employees e
WHERE NOT EXISTS (
    SELECT 1 FROM e5_employees x
    WHERE x.dept_id = e.dept_id
    AND x.salary > e.salary
);

-- UNION
SELECT dept_id FROM e5_employees WHERE salary < 60000
UNION
SELECT dept_id FROM e5_employees WHERE salary >= 60000;

-- INTERSECT
SELECT dept_id FROM e5_employees WHERE salary <= 50000
INTERSECT
SELECT dept_id FROM e5_employees WHERE salary >= 50000;

Output:

ANY:
Charan
Divya

ALL:
Divya

IN:
Asha
Divya

EXISTS:
Bala

NOT EXISTS:
Asha
Charan
Divya

UNION:
10
20
30

INTERSECT:
20

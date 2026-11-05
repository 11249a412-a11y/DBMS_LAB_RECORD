Aim:

To perform SQL queries using aggregate functions such as COUNT, SUM, AVG, MIN, MAX, GROUP BY and HAVING.

Algorithm:
1. Create an employee table.
2. Insert employee details.
3. Use aggregate functions to calculate values.
4. Group employees using GROUP BY.
5. Filter groups using HAVING.
6. Display the result.
Code:CREATE TABLE e6_employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(30),
    dept_id NUMBER,
    salary NUMBER
);

INSERT INTO e6_employees VALUES (1, 'Ravi', 10, 40000);
INSERT INTO e6_employees VALUES (2, 'Priya', 10, 60000);
INSERT INTO e6_employees VALUES (3, 'Arun', 20, 50000);
INSERT INTO e6_employees VALUES (4, 'Sara', 20, 70000);
INSERT INTO e6_employees VALUES (5, 'John', 30, 90000);

SELECT
    dept_id,
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM e6_employees
GROUP BY dept_id
HAVING COUNT(*) >= 2 AND AVG(salary) >= 60000;

Output:
DEPT_ID          20
TOTAL_EMPLOYEES  2
TOTAL_SALARY     120000
AVG_SALARY       60000
MIN_SALARY       50000
MAX_SALARY       70000


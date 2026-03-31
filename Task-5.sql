-- Active: 1774963934418@@127.0.0.1@3306@presidio
-- Subquery
SELECT * FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- Subquery in WHERE Clause
SELECT name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary) FROM Employees
);

-- Subquery with GROUP
SELECT e.name, e.department, e.salary
FROM Employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE department = e.department
);

-- Subquery in SELECT
SELECT name, salary,
       (SELECT AVG(salary) FROM Employees) AS avg_salary
FROM Employees;

-- Subquery with IN
SELECT name
FROM Employees
WHERE department IN (
    SELECT department FROM Employees WHERE department = 'IT'
);


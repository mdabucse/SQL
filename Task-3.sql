-- Active: 1774963934418@@127.0.0.1@3306@presidio
-- Count total employees
SELECT COUNT(*) AS total_employees  -- In this count(*) can calculate null values also 
FROM Employees;

--Avg salary
SELECT AVG(salary) AS avg_salary
FROM Employees;

-- Avg salary dept wise
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department;

-- Count of employees by dept wise
SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department;

-- more than one employee in each dept
SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department
HAVING COUNT(*) > 1;  -- for the aggregating fuctions if we want to use filter condition that time we use the HAVING

-- Only include employees with salary > 40000, then group
SELECT department, AVG(salary) AS avg_salary
FROM Employees
WHERE salary > 40000
GROUP BY department
HAVING AVG(salary) > 50000;
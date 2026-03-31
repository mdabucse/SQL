-- Active: 1774963934418@@127.0.0.1@3306@presidio
-- Filter dept wise
SELECT * FROM Employees
WHERE department = 'IT';

-- Filter dept wise + Orderwise
SELECT * FROM Employees
WHERE department = 'IT'
ORDER BY salary ASC;

-- Sort by salary
SELECT * FROM Employees
ORDER BY salary DESC;

--Multiple conditions with AND
SELECT * FROM Employees
WHERE department = 'IT' AND salary > 60000;

--Multiple conditions with OR
SELECT * FROM Employees
WHERE department = 'HR' OR department = 'Marketing';

-- Combine Filtering + Sorting
SELECT * FROM Employees
WHERE salary >= 50000
ORDER BY age ASC;




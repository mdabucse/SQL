-- CTE (Commen Table Expression)

-- without CTE
SELECT department, AVG(salary)
FROM Employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- with CTE
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department
)
SELECT *
FROM dept_avg
WHERE avg_salary > 50000;

-- Multiple CTE
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department
),
high_paid AS (
    SELECT * FROM dept_avg WHERE avg_salary > 50000
)
SELECT * FROM high_paid;


--Alter the table
ALTER TABLE Employees
ADD manager_id INT;

UPDATE Employees SET manager_id = NULL WHERE id = 1; 
UPDATE Employees SET manager_id = 1 WHERE id = 2;   
UPDATE Employees SET manager_id = 1 WHERE id = 3;   
UPDATE Employees SET manager_id = 2 WHERE id = 4;  
UPDATE Employees SET manager_id = 2 WHERE id = 5;   ]

-- Hierarchy CTE
WITH RECURSIVE emp_hierarchy AS (
    
    SELECT id, name, manager_id
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.id, e.name, e.manager_id
    FROM Employees e
    JOIN emp_hierarchy eh
    ON e.manager_id = eh.id
)
SELECT * FROM emp_hierarchy;

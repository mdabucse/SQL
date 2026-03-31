-- row number
SELECT name, department, salary,
       ROW_NUMBER() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS row_num
FROM Employees;

-- rank
SELECT name, department, salary,
       RANK() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS ranks
FROM Employees;

-- dense rank
SELECT name, department, salary,
       DENSE_RANK() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS dense_ranks
FROM Employees;

-- lag() previous value
SELECT name, salary,
       LAG(salary) OVER (ORDER BY salary) AS prev_salary
FROM Employees;

-- lead() next value
SELECT name, salary,
       LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM Employees;


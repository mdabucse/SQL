-- Active: 1774963934418@@127.0.0.1@3306@presidio

-- I created an Database Named Presidio
CREATE DATABASE presidio;

-- Choose the database
USE presidio;

-- Created Employees Table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Insert values into Employees
INSERT INTO Employees (id, name, age, department, salary) VALUES
(1, 'Alice', 25, 'HR', 40000),
(2, 'Bob', 30, 'IT', 60000),
(3, 'Charlie', 28, 'Finance', 55000),
(4, 'David', 35, 'IT', 70000),
(5, 'Eva', 22, 'Marketing', 38000);

-- Fetch the data

SELECT * FROM Employees;
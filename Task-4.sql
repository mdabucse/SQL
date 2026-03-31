-- Active: 1774963934418@@127.0.0.1@3306@presidio

-- create customer table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- create order table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- insert values
INSERT INTO Customers VALUES
(1, 'Alice', 'Chennai'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Delhi'),
(4, 'David', 'Bangalore');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 60000),
(102, 1, 'Mouse', 500),
(103, 2, 'Keyboard', 1500),
(104, 3, 'Monitor', 12000);

-- Inner Join -> If both tables are having the same column then only it merge
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- Left join
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- Right Join
SELECT Customers.name, Orders.product
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;




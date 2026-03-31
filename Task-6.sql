-- Active: 1774963934418@@127.0.0.1@3306@presidio
-- create table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Insert values
INSERT INTO Orders VALUES
(1, 'Alice', '2026-03-01', 5000),
(2, 'Bob', '2026-03-15', 7000),
(3, 'Charlie', '2026-02-20', 3000),
(4, 'David', '2026-01-10', 9000);

-- current date
SELECT CURDATE();

-- date difference
SELECT DATEDIFF(CURDATE(), '2026-03-01') AS days_difference;

-- add date
SELECT DATE_ADD('2026-03-01', INTERVAL 10 DAY);

-- filter by date 
SELECT * FROM Orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY;

-- filter b/w 2 days
SELECT * FROM Orders
WHERE order_date BETWEEN '2026-03-01' AND '2026-03-31';

--format date
SELECT DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_date
FROM Orders;

-- orders in last 7 days
SELECT * FROM Orders
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

-- orders older than 30 days
SELECT * FROM Orders
WHERE DATEDIFF(CURDATE(), order_date) > 30;

-- add delivery date
SELECT order_id, order_date,
       DATE_ADD(order_date, INTERVAL 5 DAY) AS delivery_date
FROM Orders;

select * from employees;
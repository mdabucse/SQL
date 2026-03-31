-- Active: 1774963934418@@127.0.0.1@3306@ecommerce_db
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Creation of Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT CHECK (stock >= 0)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert values
INSERT INTO Customers (name, email) VALUES
('Alice', 'alice@gmail.com'),
('Bob', 'bob@gmail.com');
INSERT INTO Products (name, price, stock) VALUES
('Laptop', 60000, 10),
('Mouse', 500, 50),
('Keyboard', 1500, 30);


-- Indexing
CREATE INDEX idx_customer ON Orders(customer_id);
CREATE INDEX idx_product ON OrderDetails(product_id);


-- Operations using user defined funtions
DELIMITER //

CREATE TRIGGER reduce_stock
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END //DELIMITER ;

START TRANSACTION;

-- Step 1: Create Order
INSERT INTO Orders (customer_id, order_date)
VALUES (1, CURDATE());

-- Step 2: Get last order id
SET @order_id = LAST_INSERT_ID();

-- Step 3: Add order items
INSERT INTO OrderDetails (order_id, product_id, quantity, price)
VALUES
(@order_id, 1, 1, 60000),
(@order_id, 2, 2, 500);

-- If everything OK
COMMIT;

-- If error
-- ROLLBACK;

CREATE VIEW OrderSummary AS
SELECT o.order_id, c.name AS customer_name,
       p.name AS product_name,
       od.quantity, od.price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id;


SELECT * FROM OrderSummary;
SELECT * FROM Products;
SELECT SUM(price * quantity) AS total_sales
FROM OrderDetails;
SELECT SUM(price * quantity) AS total_sales
FROM OrderDetails;
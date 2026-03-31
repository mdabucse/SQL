DELIMITER //
-- user defined functions
CREATE PROCEDURE GetTotalSales(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT SUM(amount) AS total_sales
    FROM Orders
    WHERE order_date BETWEEN start_date AND end_date;
END //DELIMITER ;

CALL GetTotalSales('2026-03-01', '2026-03-31');


DELIMITER //

CREATE FUNCTION CalculateDiscount(price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN price * 0.10;
END //DELIMITER ;

SELECT order_id,
       amount,
       amount - CalculateDiscount(amount) AS final_price
FROM Orders;
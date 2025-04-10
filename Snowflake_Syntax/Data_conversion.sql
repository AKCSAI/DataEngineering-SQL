-- Convert order_id to VARCHAR aliasing to order_id_string
SELECT CAST (order_id AS VARCHAR) AS order_id_string
FROM orders

SELECT price, 
-- Convert price to NUMBER data type
    price::NUMBER AS price_dollars
FROM pizzas


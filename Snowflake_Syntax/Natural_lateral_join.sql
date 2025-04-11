-- Count total orders, average pizza price, and total revenue per pizza type
SELECT 
    COUNT(o.order_id) AS total_orders,        -- Total number of orders per pizza
    AVG(p.price) AS average_price,            -- Average price of the pizza
    SUM(p.price * od.quantity) AS total_revenue, -- Total revenue = price * quantity ordered
    name AS pizza_name                        -- Name of the pizza from pizza_type table

FROM orders AS o
-- Join orders with order_details using LEFT JOIN to include all orders
LEFT JOIN order_details AS od
    ON o.order_id = od.order_id

-- Join pizzas with order_details using RIGHT JOIN to include all pizzas (even if not ordered)
RIGHT JOIN pizzas p
    ON od.pizza_id = p.pizza_id

-- NATURAL JOIN pizza_type using automatically matched columns (likely pizza_type_id)
NATURAL JOIN pizza_type AS pt

-- Group the results by pizza name and category
GROUP BY pt.name, pt.category

-- Sort results by highest revenue, then by number of orders
ORDER BY total_revenue DESC, total_orders DESC;

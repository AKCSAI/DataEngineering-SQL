-- Select the current date, current time
SELECT CURRENT_DATE, CURRENT_TIME

-- Count the number of orders per day
SELECT COUNT(*) AS orders_per_day, 
-- Extract the day of the week and alias to order_day
	EXTRACT(weekday FROM order_date) AS order_day
FROM orders
GROUP BY order_day
ORDER BY orders_per_day DESC

-- Get the month from order_date
SELECT EXTRACT(month FROM order_date) AS order_month, 
    p.pizza_size, 
    -- Calculate revenue
    SUM(p.price * od.quantity) AS revenue
FROM orders o
INNER JOIN order_details od USING(order_id)
INNER JOIN pizzas p USING(pizza_id)
-- Appropriately group the query
GROUP BY ALL
-- Sort by revenue in descending order
ORDER BY revenue DESC;
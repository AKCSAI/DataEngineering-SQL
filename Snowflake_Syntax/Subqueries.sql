-- Select pizza name, category, and total orders for each pizza type
SELECT pt.name,
       pt.category,
       SUM(od.quantity) AS total_orders
FROM pizza_type pt

-- Join pizza_type with pizzas to get pizza IDs per type
JOIN pizzas p
    ON pt.pizza_type_id = p.pizza_type_id

-- Join pizzas with order_details to get quantities ordered
JOIN order_details od
    ON p.pizza_id = od.pizza_id

-- Group by all non-aggregated columns (name, category)
GROUP BY ALL

-- Filter only those pizzas ordered less than the average total per pizza
HAVING SUM(od.quantity) < (
  -- Subquery: calculate the average number of orders across all pizzas
  SELECT AVG(total_quantity)
  FROM (
    -- Inner subquery: get total quantity ordered per pizza
    SELECT SUM(od.quantity) AS total_quantity
    FROM pizzas p
    JOIN order_details od 
        ON p.pizza_id = od.pizza_id
    GROUP BY p.pizza_id
  ) AS subquery
)

-- (Optional) You can add an ORDER BY if you want to sort results
-- ORDER BY total_orders ASC;

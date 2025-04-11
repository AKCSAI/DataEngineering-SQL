-- Create two Common Table Expressions (CTEs):
-- 1. most_ordered: finds the pizza with the highest total quantity ordered
-- 2. cheapest_pizza: finds the pizza with the lowest price

WITH most_ordered AS (
    SELECT 
        pizza_id, 
        SUM(quantity) AS total_qty   -- Sum up quantities to get total orders per pizza
    FROM order_details
    GROUP BY pizza_id               -- Group by each unique pizza
    ORDER BY total_qty DESC         -- Sort by quantity ordered, highest first
    LIMIT 1                         -- Keep only the top result
),

cheapest_pizza AS (
    SELECT 
        pizza_id, 
        price                       -- Get the pizza ID and price
    FROM pizzas 
    WHERE price = (SELECT MIN(price) FROM pizzas)  -- Filter to the lowest price
    LIMIT 1                         -- Keep only one in case multiple pizzas share the min price
)

-- Combine the results from both CTEs using UNION ALL to preserve both rows
SELECT 
    pizza_id, 
    'Most Ordered' AS description, -- Label this row as 'Most Ordered'
    total_qty AS metric            -- Show total orders as the metric
FROM most_ordered

UNION ALL

SELECT 
    pizza_id, 
    'Cheapest' AS description,     -- Label this row as 'Cheapest'
    price AS metric                -- Show the price as the metric
FROM cheapest_pizza;

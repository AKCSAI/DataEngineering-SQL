-- Step 1: Create a CTE to filter only orders placed after November 1, 2015
WITH filtered_orders AS (
  SELECT order_id, order_date 
  FROM orders 
  -- Include only orders where the order date is after '2015-11-01'
  WHERE order_date > '2015-11-01'
),

-- Step 2: Create a CTE to filter only veggie pizza types
filtered_pizza_type AS (
  SELECT name, pizza_type_id 
  FROM pizza_type 
  -- Include only pizza types categorized as 'Veggie'
  WHERE category = 'Veggie'
)

-- Step 3: Retrieve the final result by joining all relevant tables/CTEs
SELECT 
  fo.order_id,         -- ID of the filtered order
  fo.order_date,       -- Date of the filtered order
  fpt.name,            -- Name of the veggie pizza
  od.quantity          -- Quantity of that pizza in the order

-- Join filtered orders with order_details to get pizza IDs and quantities
FROM filtered_orders AS fo
JOIN order_details AS od 
  ON fo.order_id = od.order_id

-- Join with pizzas table to get pizza_type_id
JOIN pizzas AS p 
  ON od.pizza_id = p.pizza_id

-- Join with the filtered list of veggie pizza types
JOIN filtered_pizza_type AS fpt 
  ON p.pizza_type_id = fpt.pizza_type_id;

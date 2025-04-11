-- Combine the name and category columns
SELECT CONCAT(name, ' - ', category) AS name_and_category
FROM pizza_type
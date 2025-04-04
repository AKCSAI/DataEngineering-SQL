-- Cross Join
-- Cross join is used to combine all rows from two or more tables
-- without any condition. It returns the Cartesian product of the two tables.
SELECT c.name AS country, l.name AS language
FROM countries AS c        
-- Perform a cross join to languages (alias as l)
CROSS JOIN languages AS l 
WHERE c.code in ('PAK','IND')
	AND l.code in ('PAK','IND');
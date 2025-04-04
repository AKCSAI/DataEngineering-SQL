-- Return all cities with the same name as a country
SELECT name 
FROM cities 
INTERSECT
SELECT name 
FROM countries; 

-- Return all cities that do not have the same name as a country
SELECT name
FROM cities 
EXCEPT
SELECT name
FROM countries
ORDER BY name;
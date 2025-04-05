-- Find records from 2015 with life_expectancy above 1.15 * avg_life_expectancy
SELECT *
FROM populations
WHERE year = 2015
-- Populations where life expectancy is 1.15 times higher than average
  AND life_expectancy > 1.15 *
    (SELECT AVG(life_expectancy)
    FROM populations
    WHERE year = 2015);

-- Find in which capital cities do the most people live?
-- Select relevant fields from cities table
SELECT name, country_code, urbanarea_pop
FROM cities 
-- Filter using a subquery on the countries table
WHERE name IN
    (SELECT capital
     FROM countries
     WHERE cities.country_code = countries.code )
ORDER BY urbanarea_pop DESC;

-- Subquery inside SELECT
-- Find top nine countries with the most cities
SELECT countries.name AS cities_num
FROM cities 
LEFT JOIN countries
ON cities.country_code = countries.code
-- Order by count of cities as cities_num
GROUP BY countries.name
ORDER BY cities_num DESC
-- Limit the results
LIMIT 9; 

SELECT countries.name AS country,
-- Subquery that provides the count of cities   
  (SELECT COUNT (*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;
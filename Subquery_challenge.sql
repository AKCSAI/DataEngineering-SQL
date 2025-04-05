-- analyzing inflation and unemployment rate for certain countries in 2015. 
-- You are interested in countries with "Republic" or "Monarchy" as their form of government.
-- Select relevant fields
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE year = 2015 
  AND code IN
-- Subquery returning country codes filtered on gov_form
	(SELECT code 
   FROM countries 
   WHERE gov_form LIKE '%Republic%' OR gov_form LIKE '%Monarchy%')
ORDER BY inflation_rate;

-- Determine the top 10 capital cities in Europe and the Americas by city_perc
-- Select fields from cities
SELECT name, country_code, city_proper_pop, metroarea_pop, (city_proper_pop / metroarea_pop * 100) AS city_perc
FROM cities
-- Use subquery to filter city name
WHERE name IN
    (SELECT capital
     FROM countries
     WHERE continent LIKE '%America' OR continent = 'Europe'
    )
-- Add filter condition such that metroarea_pop does not have null values
AND metroarea_pop IS NOT NULL
-- Sort and limit the result
ORDER BY city_perc DESC
LIMIT 10; 



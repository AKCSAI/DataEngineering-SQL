--Perform an inner join with cities AS c1 on the left and countries as c2 on the right. 
--Use code as the field to merge your tables on.
SELECT 
    c1.name AS city,
    code,
    c2.name AS country,
    region,
    city_proper_pop
FROM cities AS c1
-- Perform an inner join with cities as c1 and countries as c2 on country code
INNER JOIN countries as c2
ON c1.country_code = c2.code
ORDER BY code DESC;

--Change the code to perform a LEFT JOIN instead of an INNER JOIN.
SELECT 
	c1.name AS city, 
    code, 
    c2.name AS country,
    region, 
    city_proper_pop
FROM cities AS c1
-- Join right table (with alias)
LEFT JOIN countries as c2
ON c1.country_code = c2.code
ORDER BY code DESC;

--Complete the LEFT JOIN with the countries table on the left and the economies table on the right on the code field.
--Filter the records from the year 2010.
SELECT name, region, gdp_percapita
FROM countries AS c
LEFT JOIN economies AS e
-- Match on code fields
ON c.code = e.code
-- Filter for the year 2010
WHERE year = 2010;

-- Select region, and average gdp_percapita as avg_gdp
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
-- Group by region
GROUP BY region;

--Order the result set by the average GDP per capita from highest to lowest
--Return only the first 10 records in your result.
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
GROUP BY region
-- Order by descending avg_gdp
ORDER BY avg_gdp DESC
-- Return only first 10 records
LIMIT 10; 


-- Modify this query to use RIGHT JOIN instead of LEFT JOIN
--SELECT countries.name AS country, languages.name AS language, percent
--FROM countries
--LEFT JOIN languages
--USING(code)
--ORDER BY language;

SELECT countries.name AS country, languages.name AS language, percent
FROM languages  --languages and countries are switched
RIGHT JOIN countries
USING(code)
ORDER BY language; 



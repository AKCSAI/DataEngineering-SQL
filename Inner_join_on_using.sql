-- INNER JOIN cities in two tables based ON code
SELECT * 
FROM cities
-- Inner join to countries
INNER JOIN countries
-- Match on country codes
ON cities.country_code = countries.code

-- Select name fields (with alias) and region 
SELECT cities.name AS city, countries.name AS country, countries.region
FROM cities 
INNER JOIN countries 
ON cities.country_code = countries.code;

-- Select fields with aliases
SELECT c.code AS country_code, c.name, e.year, e.inflation_rate
FROM countries AS c
-- Join to economies (alias e)
INNER JOIN economies AS e
-- Match on code field using table aliases
ON e.code = c.code;

--Finding countries with Official languages                                                       
SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
-- Match using the code column
USING(code)

-- Inner join of countries AS c (left) with populations AS p (right), on code. Select name and fertility_rate
Select name and fertility_rate
SELECT c.name, p.fertility_rate
FROM countries as c
-- Inner join countries and populations, aliased, on code
INNER JOIN populations as p
ON c.code = p.country_code;

-- Join tables to return the country name, year, fertility rate, and unemployment rate in a single result from the countries, populations and economies tables.
SELECT name, e.year, fertility_rate, e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
-- Join to economies (as e)
INNER JOIN economies AS e 
-- Match on country code
ON e.code = c.code AND e.code = p.country_code;
-- Add an additional joining condition such that you are also joining on year
	AND p.year = e.year;
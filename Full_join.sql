-- Full join countries and currencies tables
SELECT name AS country, code, region, basic_unit
FROM countries
-- Join to currencies
FULL JOIN currencies
USING (code)
-- Where region is North America or name is null
WHERE region = 'North America' OR region IS NULL
ORDER BY region;

-- Chaining FULL JOINs
SELECT 
	c1.name AS country, 
    region, 
    l.name AS language,
	basic_unit, 
    frac_unit
FROM countries as c1 
-- Full join with languages (alias as l)
FULL JOIN languages as l 
USING (code)
-- Full join with currencies (alias as c2)
FULL JOIN currencies as c2 
USING (code)
WHERE region LIKE 'M%esia';
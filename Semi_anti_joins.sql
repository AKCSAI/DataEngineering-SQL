-- The query below shows the names of distinct country codes that speak Arabic
-- Example of a semi-join
SELECT DISTINCT name
FROM languages
-- Add syntax to use bracketed subquery below as a filter
WHERE code IN
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;

-- The query below shows contries in Oceania that are not present in the currencies table
-- Example of an anti-join
SELECT code, name
FROM countries
WHERE continent = 'Oceania'
-- Filter for countries not included in the bracketed subquery
  AND code NOT IN 
    (SELECT code
    FROM currencies);

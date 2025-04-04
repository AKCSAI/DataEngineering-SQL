-- Perform a set operation to stack all records in these two tables on top of each other, excluding duplicates
-- Select all fields from economies2015
SELECT *
FROM economies2015
-- Set operation
UNION 
-- Select all fields from economies2019
SELECT *
FROM economies2019
ORDER BY code, year;

-- Returning Country Codes and Years with UNION ALL
SELECT code, year
FROM economies
-- Set theory clause
UNION ALL
SELECT country_code, year
FROM populations
ORDER BY code, year;


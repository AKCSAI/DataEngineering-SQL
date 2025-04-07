-- Count the number of rows in universities
SELECT COUNT (*)
FROM universities;

-- Count the number of distinct values in the university_city column
SELECT COUNT(DISTINCT(university_city)) 
FROM universities;

-- Identify keys with SELECT COUNT DISTINCT
SELECT COUNT(DISTINCT(firstname, lastname)) 
FROM professors;


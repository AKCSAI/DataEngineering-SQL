-- Query the right table in information_schema
-- information_schema is a meta-database that holds information about your current database. 
-- information_schema has multiple tables you can query with the known SELECT * FROM syntax
-- tables: information about all tables in your current database
-- columns: information about all columns in all of the tables in your current database
SELECT table_name 
FROM information_schema.tables
-- Specify the correct table_schema value
WHERE table_schema = 'public';

-- Query the right table in information_schema to get columns
SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'university_professors' AND table_schema = 'public';

-- Count the number of columns in the table
SELECT COUNT (column_name)
FROM information_schema.columns
WHERE table_name = 'university_professors' AND table_schema = 'public';




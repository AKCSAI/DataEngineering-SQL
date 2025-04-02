--Limiting Results in SQL Server--
SELECT genre
FROM books
LIMIT 10;

--Limiting Results in PostgreSQL--
SELECT LIMIT(10) genre
FROM book;
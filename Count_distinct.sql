-- Select unique authors from the books table
SELECT DISTINCT author
FROM books;

-- Select unique authors and genre combinations from the books table
SELECT DISTINCT author, genre
FROM books;

-- Alias author so that it becomes unique_author
SELECT DISTINCT author AS unique_author
FROM books;

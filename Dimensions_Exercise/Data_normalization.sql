-- Create a new dimension table named dim_author
-- It will store unique author names as part of data normalization
CREATE TABLE dim_author (
    author VARCHAR(256) NOT NULL
);

-- Insert distinct author names from the existing dim_book_star table
-- This avoids duplicate author entries
INSERT INTO dim_author
SELECT DISTINCT author 
FROM dim_book_star;

-- Add a new column called author_id as the primary key
-- The SERIAL keyword automatically assigns a unique ID to each author
ALTER TABLE dim_author 
ADD COLUMN author_id SERIAL PRIMARY KEY;

-- Display the contents of the dim_author table
-- Useful to verify that authors were inserted and IDs assigned correctly
SELECT * FROM dim_author;

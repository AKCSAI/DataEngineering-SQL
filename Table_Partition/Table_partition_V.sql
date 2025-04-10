CREATE TABLE film (
  film_id INT PRIMARY KEY,
  title TEXT NOT NULL,
  release_year TEXT,
  description TEXT,
  review TEXT
);

-- Table for frequently accessed fields
CREATE TABLE film_main (
  film_id INT PRIMARY KEY,
  title TEXT NOT NULL,
  release_year TEXT
);

-- Table for rarely accessed fields
CREATE TABLE film_extended (
  film_id INT PRIMARY KEY,
  description TEXT,
  review TEXT
);

-- Insert core info into film_main
INSERT INTO film_main (film_id, title, release_year)
SELECT film_id, title, release_year FROM film;

-- Insert extended info into film_extended
INSERT INTO film_extended (film_id, description, review)
SELECT film_id, description, review FROM film;

-- Get full film data when needed
SELECT *
FROM film_main
JOIN film_extended USING(film_id);

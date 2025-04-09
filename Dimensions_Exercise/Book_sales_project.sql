-- This query returns the total sales amount for books in the 'novel' genre,
-- aggregated by U.S. state based on store location.
-- 
-- It uses the fact_booksales table as the base (fact) table and performs
-- INNER JOINs with two dimension tables:
--   - dim_book_star: to access the genre of each book
--   - dim_store_star: to access the state information of each store
--
-- The WHERE clause filters the results to include only books classified
-- under the 'novel' genre.
--
-- The data is grouped by state (from dim_store_star), and the SUM function
-- is used to calculate the total sales amount for each state.

-- Output each state and their total sales_amount for books in the 'novel' genre - STAR SCHEMA
SELECT 
    dim_store_star.state, 
    SUM(fact_booksales.sales_amount)
FROM fact_booksales -- made a mistake here originally used dim_store_star
    -- Join to get book information
    JOIN dim_book_star 
        ON dim_book_star.book_id = fact_booksales.book_id
    -- Join to get store information
    JOIN dim_store_star 
        ON dim_store_star.store_id = fact_booksales.store_id
-- Filter for only books that belong to the 'novel' genre
WHERE dim_book_star.genre = 'novel'
-- Group the results by state so we get one row per state
GROUP BY dim_store_star.state;


-- This query calculates the total sales amount for books classified as 'novel',
-- grouped by U.S. state based on the store's location.
--
-- The query uses the `fact_booksales` table as the central fact table and performs
-- the following joins to gather dimension data:
--   - Joins with `dim_book_sf` to get book details.
--   - Joins with `dim_genre_sf` to filter by the 'novel' genre.
--   - Joins with `dim_store_sf` to trace the store where each sale occurred.
--   - Joins with `dim_city_sf` and `dim_state_sf` to determine the state each store is located in.
--
-- It filters only for books that belong to the 'novel' genre using the WHERE clause,
-- then groups the results by state and sums the sales_amount to produce the total
-- sales of novels per state.

-- Output each state and their total sales_amount - SNOWFLAKE SCHEMA
SELECT dim_state_sf.state, SUM(sales_amount)
FROM fact_booksales
    -- Joins for genre
    JOIN dim_book_sf on fact_booksales.book_id = dim_book_sf.book_id
    JOIN dim_genre_sf on dim_book_sf.genre_id = dim_genre_sf.genre_id
    -- Joins for state 
    JOIN dim_store_sf on fact_booksales.store_id = dim_store_sf.store_id
    JOIN dim_city_sf on dim_store_sf.city_id = dim_city_sf.city_id
	JOIN dim_state_sf on  dim_city_sf.state_id = dim_state_sf.state_id 
-- Get all books with in the novel genre and group the results by state
WHERE dim_genre_sf.genre = 'novel'
-- Group the results by state so we get one row per state
GROUP BY dim_state_sf.state;


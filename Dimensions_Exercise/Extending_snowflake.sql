-- This script updates the `dim_country_sf` table by adding a new column and a foreign key constraint:
--
-- 1. Adds a new column named `continent_id` of type INTEGER to the `dim_country_sf` table.
--    - This column is marked as NOT NULL, meaning every country must belong to a continent.
--    - A DEFAULT value of 1 is assigned, so all existing rows will automatically receive the value 1 unless otherwise specified.
--
-- 2. Adds a FOREIGN KEY constraint named `country_continent` on the `continent_id` column.
--    - This constraint enforces referential integrity between `dim_country_sf` and `dim_continent_sf`.
--    - It ensures that any `continent_id` value in `dim_country_sf` must exist in the `continent_id` column of `dim_continent_sf`.
--
-- 3. Outputs the updated contents of the `dim_country_sf` table, including the newly added `continent_id` values.

-- Add a continent_id column with default value of 1
ALTER TABLE dim_country_sf
ADD continent_id int NOT NULL DEFAULT(1);

-- Add the foreign key constraint
ALTER TABLE dim_country_sf ADD CONSTRAINT country_continent
   FOREIGN KEY (continent_id) REFERENCES dim_continent_sf(continent_id);
   
-- Output updated table
SELECT * FROM dim_country_sf;
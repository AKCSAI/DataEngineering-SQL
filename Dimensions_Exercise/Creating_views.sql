-- Get all non-systems views
SELECT * FROM information_schema.views
WHERE table_schema NOT IN ('pg_catalog', 'information_schema');

-- Create a view for reviews with a score above 9
CREATE VIEW high_scores AS
SELECT * FROM REVIEWS
WHERE score > 9;

-- Count the number of self-released works in high_scores
SELECT COUNT(*) 
FROM high_scores
INNER JOIN labels ON high_scores.reviewid = labels.reviewid
WHERE label = 'self-released';

--Creating a view from other views
-- Create the view with top artists from 2017
CREATE VIEW top_artists_2017 AS
SELECT artist_title.artist
FROM top_15_2017
INNER JOIN artist_title 
  ON top_15_2017.reviewid = artist_title.reviewid;

-- Output the result of the new view
SELECT * FROM top_artists_2017;
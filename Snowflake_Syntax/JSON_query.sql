SELECT business_id, name 
FROM yelp_business_data 

-- Filter for businesses that include 'Restaurant' in their categories
WHERE categories ILIKE '%Restaurant%' 

-- Filter where DogsAllowed is '%True%' (as a string in the attributes column)
AND attributes:DogsAllowed ILIKE '%True%' 

-- Filter where BusinessAcceptsCreditCards is '%True%' (as a string in the attributes column)
AND attributes:BusinessAcceptsCreditCards ILIKE '%True%' 

-- Filter for businesses located in Philadelphia (case-insensitive match)
AND city ILIKE '%Philadelphia%' 

-- Filter for businesses with a perfect 5-star rating
AND stars = 5;

-- This query retrieves, for organizations in the 'Media & communication' sector, 
-- a count of how many affiliation records exist per professor and the corresponding university city.
-- It does this by joining four tables: 
--   affiliations (which links professors and organizations), 
--   professors (providing the professor id and their university affiliation),
--   organizations (to get the organization sector), and
--   universities (to obtain the university city).
-- The WHERE clause filters the results to only include rows where the organization sector is 'Media & communication'.
-- The results are then grouped by organization sector, professor id, and university city,
-- and finally sorted in descending order based on the count of affiliations.
SELECT COUNT(*), organizations.organization_sector, 
       professors.id, universities.university_city
FROM affiliations
JOIN professors
  ON affiliations.professor_id = professors.id
JOIN organizations
  ON affiliations.organization_id = organizations.id
JOIN universities
  ON professors.university_id = universities.id
WHERE organizations.organization_sector = 'Media & communication'
GROUP BY organizations.organization_sector, 
         professors.id, universities.university_city
ORDER BY COUNT(*) DESC;

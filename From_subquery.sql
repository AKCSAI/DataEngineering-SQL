-- Select local_name and lang_num from appropriate tables
SELECT countries.local_name, sub.lang_num
FROM countries,
     (
       SELECT code, COUNT(*) AS lang_num
       FROM languages
       GROUP BY code
     ) AS sub
WHERE countries.code = sub.code
ORDER BY sub.lang_num DESC;
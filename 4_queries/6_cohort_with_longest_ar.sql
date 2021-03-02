/* Nested SELECT method */

-- Finds largests of subqueried avgs
SELECT cohorts.name, AVG(completed_at - started_at) AS average_assistance_time
FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING AVG(completed_at - started_at) >= ALL (
                                              -- Finds all avg
                                              SELECT AVG(completed_at - started_at) AS average_assistance_time
                                              FROM assistance_requests
                                              JOIN students ON students.id = assistance_requests.student_id
                                              JOIN cohorts ON cohorts.id = cohort_id
                                              GROUP BY cohorts.name
                                              );

/* ORDER BY and LIMIT method (Compass) */
/*
SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
FROM assistance_requests 
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;
*/
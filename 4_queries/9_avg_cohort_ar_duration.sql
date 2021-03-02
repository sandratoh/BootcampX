-- Query to find avg of all total
SELECT AVG(total_duration) AS average_total_duration
FROM (
      -- Subquery to find prev cohort total duration
      SELECT cohorts.name, SUM(completed_at - started_at) AS total_duration
      FROM assistance_requests
      JOIN students ON students.id = student_id
      JOIN cohorts ON cohorts.id = cohort_id
      GROUP BY cohorts.name
    ) AS total_durations;
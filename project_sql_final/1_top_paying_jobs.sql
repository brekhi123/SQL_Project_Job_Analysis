/*
Focuses on the top 10 data analyst or data engineer jobs in Canada
*/

SELECT 
    job_id,
    cd.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE
FROM 
    job_postings_fact jf
LEFT JOIN company_dim cd 
ON cd.company_id = jf.company_id
WHERE 
    job_title_short LIKE '%Data%Analyst%' 
    AND
    job_location = 'Canada' 
    AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10






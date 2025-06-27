WITH top_da_jobs AS 
(
    SELECT 
        job_id,
        cd.name AS company_name,
        job_title,
        salary_year_avg
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
)

SELECT
    top_da_jobs.*,
    skills AS skills_required

FROM top_da_jobs
INNER JOIN skills_job_dim ON top_da_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC

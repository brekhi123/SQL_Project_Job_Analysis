-- Practice Problem 1
SELECT
    job_schedule_type,
    AVG(salary_hour_avg) AS average_salary_hourly, 
    AVG(salary_year_avg) AS average_salary_yearly
FROM 
    job_postings_fact
WHERE
    job_posted_date::DATE > '2023-06-01'
GROUP BY
    job_schedule_type
HAVING AVG(salary_hour_avg) IS NOT NULL
AND AVG(salary_year_avg) IS NOT NULL



-- Practice Problem 2

SELECT
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'  AS date_time

FROM job_postings_fact
LIMIT 5;

SELECT
COUNT(job_id),
-- job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'  AS date_time,
EXTRACT(MONTH FROM job_posted_date) AS date_month

FROM 
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY
    date_month
ORDER BY
    date_month

-- Practice Problem 3
SELECT 
    c.name AS company_name
FROM 
    job_postings_fact AS j
    JOIN company_dim AS c 
    ON j.company_id = c.company_id
WHERE 
    j.job_health_insurance = true
    AND
    EXTRACT(YEAR FROM j.job_posted_date) = 2023
    AND
    EXTRACT(MONTH FROM j.job_posted_date) BETWEEN 4 AND 6;


-- Practice Problem 4

CREATE TABLE jan_2023_jobs AS
    SELECT
        *
    FROM 
        job_postings_fact
    WHERE  
        EXTRACT(YEAR FROM job_posted_date) = 2023
        AND
        EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE feb_2023_jobs AS
    SELECT
        *
    FROM 
        job_postings_fact
    WHERE  
        EXTRACT(YEAR FROM job_posted_date) = 2023
        AND
        EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE mar_2023_jobs AS
    SELECT
        *
    FROM 
        job_postings_fact
    WHERE  
        EXTRACT(YEAR FROM job_posted_date) = 2023
        AND
        EXTRACT(MONTH FROM job_posted_date) = 3;

    
-- Practice Problem 5
SELECT MIN(salary_year_avg)
FROM job_postings_fact

-- Max: 960000.0
-- Min: 15000.0
-- Low: 15000 - 75000
-- Standard: 76000- 250000
-- High: 251000 - 960000

SELECT
    job_id,
    job_location,
    CASE
        WHEN salary_year_avg BETWEEN 15000 AND 75000 THEN 'Low'
        WHEN salary_year_avg BETWEEN 76000 AND 250000 THEN 'Standard'
        WHEN salary_year_avg BETWEEN 251000 AND 960000 THEN 'High'
    END AS salary_bins
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
LIMIT 5;

-- Practice Problem 6

WITH skills_table AS 
(
    SELECT
        COUNT(*) AS number_of_postings,
        skill_id
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN 
        job_postings_fact AS job_postings 
        ON job_postings.job_id = skills_to_job.job_id
    WHERE 
        job_postings.job_work_from_home = True
    GROUP BY 
        skill_id
)


SELECT 
    skills_dim.skills,
    skills_table.number_of_postings,
    skills_table.skill_id
FROM 
    skills_table
INNER JOIN 
    skills_dim 
    ON skills_table.skill_id = skills_dim.skill_id
ORDER BY
    skills_table.number_of_postings DESC
LIMIT 5
;

-- Practice Problem 7
SELECT
    skills_dim.skill_id,
    COUNT(*) AS count,
    skills_dim.skills
FROM 
    skills_job_dim
JOIN 
skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id 
GROUP BY 
    skills_dim.skill_id
ORDER BY
    count DESC
LIMIT 5


-- Practice Problem 8

SELECT
    ad.company_id,
    cd.name,
    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        WHEN job_count > 50 THEN 'Large'
    END AS company_size
FROM
(
    SELECT
        company_id,
        COUNT(*) AS job_count
    FROM
        job_postings_fact
    GROUP BY
        company_id
) AS ad
JOIN company_dim cd ON cd.company_id = ad.company_id


-- Practice Problem 9
SELECT 
    q1_jobs.job_title_short,
    q1_jobs.job_location,
    q1_jobs.job_via,
    q1_jobs.job_posted_date::DATE,
    q1_jobs.salary_year_avg

FROM (
    SELECT *
    FROM jan_2023_jobs
    UNION
    SELECT *
    FROM feb_2023_jobs
    UNION
    SELECT *
    FROM mar_2023_jobs
) AS q1_jobs
WHERE
    salary_year_avg > 70000
    AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC
;
















    

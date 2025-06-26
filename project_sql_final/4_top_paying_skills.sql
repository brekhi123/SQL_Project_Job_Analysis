SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_yearly_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short LIKE '%Data%Analyst%'
    AND
    job_location = 'Canada'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY avg_yearly_salary DESC

/* - **Niche and cloud skills lead salaries**: Unify and GCP top the list at $120,000, with specialized tools like Cognos ($111,175) and TypeScript ($108,415) also commanding high pay, indicating a premium for less common, technical skills in data analyst roles.
- **Big data tools remain lucrative**: Spark ($107,479) and Hadoop ($107,167) are among the top-paying skills, reflecting strong demand for expertise in large-scale data processing within the Canadian market in 2023.
- **Core analytics skills are lower-paid**: Widely used skills like SQL ($94,868), Python ($96,177), and Power BI ($90,838) offer competitive but lower salaries compared to niche skills, while basic tools like PowerPoint, Word, and Outlook ($49,567) are the least paid, suggesting less value for general office skills.
*/
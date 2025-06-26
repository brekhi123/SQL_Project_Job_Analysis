/*
Focuses on the top 10 high paying data analyst or data engineer jobs in Canada
*/


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
        (
        job_title_short LIKE '%Data%Analyst%' 
        OR
        job_title_short LIKE '%Data%Engineer%' 
        )
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


/*
AWS and Python are the most in-demand skills, appearing in 7 and 6 of the top 10 data job postings in Canada (2023), reflecting their widespread use in data engineering.
Scala, Spark, and Hadoop command the highest salaries (up to $188,000), despite lower frequency, indicating a premium for specialized skills.
Cloud platforms (AWS, Azure) and tools like Snowflake dominate, with versatile skill sets combining programming, cloud, and data tools being essential for top roles.
*/
/*
[
  {
    "job_id": 315422,
    "company_name": "Grammarly",
    "job_title": "Data Engineer, Data Platform",
    "salary_year_avg": "188000.0",
    "skills_required": "python"
  },
  {
    "job_id": 315422,
    "company_name": "Grammarly",
    "job_title": "Data Engineer, Data Platform",
    "salary_year_avg": "188000.0",
    "skills_required": "scala"
  },
  {
    "job_id": 315422,
    "company_name": "Grammarly",
    "job_title": "Data Engineer, Data Platform",
    "salary_year_avg": "188000.0",
    "skills_required": "java"
  },
  {
    "job_id": 315422,
    "company_name": "Grammarly",
    "job_title": "Data Engineer, Data Platform",
    "salary_year_avg": "188000.0",
    "skills_required": "azure"
  },
  {
    "job_id": 315422,
    "company_name": "Grammarly",
    "job_title": "Data Engineer, Data Platform",
    "salary_year_avg": "188000.0",
    "skills_required": "aws"
  },
  {
    "job_id": 217430,
    "company_name": "CIBC",
    "job_title": "Director, Data Engineering Analysis, Design and Strategy",
    "salary_year_avg": "175000.0",
    "skills_required": "azure"
  },
  {
    "job_id": 217430,
    "company_name": "CIBC",
    "job_title": "Director, Data Engineering Analysis, Design and Strategy",
    "salary_year_avg": "175000.0",
    "skills_required": "spark"
  },
  {
    "job_id": 217430,
    "company_name": "CIBC",
    "job_title": "Director, Data Engineering Analysis, Design and Strategy",
    "salary_year_avg": "175000.0",
    "skills_required": "hadoop"
  },
  {
    "job_id": 217430,
    "company_name": "CIBC",
    "job_title": "Director, Data Engineering Analysis, Design and Strategy",
    "salary_year_avg": "175000.0",
    "skills_required": "express"
  },
  {
    "job_id": 217430,
    "company_name": "CIBC",
    "job_title": "Director, Data Engineering Analysis, Design and Strategy",
    "salary_year_avg": "175000.0",
    "skills_required": "docker"
  },
  {
    "job_id": 233989,
    "company_name": "BMO",
    "job_title": "Sr Data Engineer",
    "salary_year_avg": "155904.5",
    "skills_required": "sql"
  },
  {
    "job_id": 233989,
    "company_name": "BMO",
    "job_title": "Sr Data Engineer",
    "salary_year_avg": "155904.5",
    "skills_required": "python"
  },
  {
    "job_id": 233989,
    "company_name": "BMO",
    "job_title": "Sr Data Engineer",
    "salary_year_avg": "155904.5",
    "skills_required": "r"
  },
  {
    "job_id": 233989,
    "company_name": "BMO",
    "job_title": "Sr Data Engineer",
    "salary_year_avg": "155904.5",
    "skills_required": "sas"
  },
  {
    "job_id": 233989,
    "company_name": "BMO",
    "job_title": "Sr Data Engineer",
    "salary_year_avg": "155904.5",
    "skills_required": "azure"
  },
  {
    "job_id": 233989,
    "company_name": "BMO",
    "job_title": "Sr Data Engineer",
    "salary_year_avg": "155904.5",
    "skills_required": "aws"
  },
  {
    "job_id": 233989,
    "company_name": "BMO",
    "job_title": "Sr Data Engineer",
    "salary_year_avg": "155904.5",
    "skills_required": "power bi"
  },
  {
    "job_id": 233989,
    "company_name": "BMO",
    "job_title": "Sr Data Engineer",
    "salary_year_avg": "155904.5",
    "skills_required": "dax"
  },
  {
    "job_id": 233989,
    "company_name": "BMO",
    "job_title": "Sr Data Engineer",
    "salary_year_avg": "155904.5",
    "skills_required": "sas"
  },
  {
    "job_id": 244873,
    "company_name": "Babylist",
    "job_title": "Data Engineer",
    "salary_year_avg": "154000.0",
    "skills_required": "python"
  },
  {
    "job_id": 244873,
    "company_name": "Babylist",
    "job_title": "Data Engineer",
    "salary_year_avg": "154000.0",
    "skills_required": "aws"
  },
  {
    "job_id": 244873,
    "company_name": "Babylist",
    "job_title": "Data Engineer",
    "salary_year_avg": "154000.0",
    "skills_required": "snowflake"
  },
  {
    "job_id": 244873,
    "company_name": "Babylist",
    "job_title": "Data Engineer",
    "salary_year_avg": "154000.0",
    "skills_required": "airflow"
  },
  {
    "job_id": 162505,
    "company_name": "Kinaxis",
    "job_title": "Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "azure"
  },
  {
    "job_id": 162505,
    "company_name": "Kinaxis",
    "job_title": "Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "snowflake"
  },
  {
    "job_id": 162505,
    "company_name": "Kinaxis",
    "job_title": "Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "tableau"
  },
  {
    "job_id": 162505,
    "company_name": "Kinaxis",
    "job_title": "Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "power bi"
  },
  {
    "job_id": 34631,
    "company_name": "3Pillar Global",
    "job_title": "Technical Architect (Data Engineering)",
    "salary_year_avg": "147500.0",
    "skills_required": "aws"
  },
  {
    "job_id": 34631,
    "company_name": "3Pillar Global",
    "job_title": "Technical Architect (Data Engineering)",
    "salary_year_avg": "147500.0",
    "skills_required": "excel"
  },
  {
    "job_id": 50161,
    "company_name": "Block",
    "job_title": "Senior Platform Data Engineer, People Analytics",
    "salary_year_avg": "147500.0",
    "skills_required": "python"
  },
  {
    "job_id": 50161,
    "company_name": "Block",
    "job_title": "Senior Platform Data Engineer, People Analytics",
    "salary_year_avg": "147500.0",
    "skills_required": "go"
  },
  {
    "job_id": 50161,
    "company_name": "Block",
    "job_title": "Senior Platform Data Engineer, People Analytics",
    "salary_year_avg": "147500.0",
    "skills_required": "aws"
  },
  {
    "job_id": 50161,
    "company_name": "Block",
    "job_title": "Senior Platform Data Engineer, People Analytics",
    "salary_year_avg": "147500.0",
    "skills_required": "redshift"
  },
  {
    "job_id": 50161,
    "company_name": "Block",
    "job_title": "Senior Platform Data Engineer, People Analytics",
    "salary_year_avg": "147500.0",
    "skills_required": "snowflake"
  },
  {
    "job_id": 50161,
    "company_name": "Block",
    "job_title": "Senior Platform Data Engineer, People Analytics",
    "salary_year_avg": "147500.0",
    "skills_required": "gcp"
  },
  {
    "job_id": 50161,
    "company_name": "Block",
    "job_title": "Senior Platform Data Engineer, People Analytics",
    "salary_year_avg": "147500.0",
    "skills_required": "looker"
  },
  {
    "job_id": 214777,
    "company_name": "3Pillar Global",
    "job_title": "Senior Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "java"
  },
  {
    "job_id": 214777,
    "company_name": "3Pillar Global",
    "job_title": "Senior Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "c#"
  },
  {
    "job_id": 214777,
    "company_name": "3Pillar Global",
    "job_title": "Senior Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "typescript"
  },
  {
    "job_id": 214777,
    "company_name": "3Pillar Global",
    "job_title": "Senior Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "rust"
  },
  {
    "job_id": 214777,
    "company_name": "3Pillar Global",
    "job_title": "Senior Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "aws"
  },
  {
    "job_id": 214777,
    "company_name": "3Pillar Global",
    "job_title": "Senior Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "redshift"
  },
  {
    "job_id": 214777,
    "company_name": "3Pillar Global",
    "job_title": "Senior Data Engineer",
    "salary_year_avg": "147500.0",
    "skills_required": "spark"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "sql"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "python"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "java"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "go"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "ruby"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "aws"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "bigquery"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "redshift"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "snowflake"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "gcp"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "airflow"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "ruby"
  },
  {
    "job_id": 160308,
    "company_name": "Block",
    "job_title": "Data Engineer, Hardware",
    "salary_year_avg": "147500.0",
    "skills_required": "git"
  },
  {
    "job_id": 1088342,
    "company_name": "Chainalysis",
    "job_title": "Data Engineer II",
    "salary_year_avg": "147500.0",
    "skills_required": "sql"
  },
  {
    "job_id": 1088342,
    "company_name": "Chainalysis",
    "job_title": "Data Engineer II",
    "salary_year_avg": "147500.0",
    "skills_required": "python"
  },
  {
    "job_id": 1088342,
    "company_name": "Chainalysis",
    "job_title": "Data Engineer II",
    "salary_year_avg": "147500.0",
    "skills_required": "java"
  },
  {
    "job_id": 1088342,
    "company_name": "Chainalysis",
    "job_title": "Data Engineer II",
    "salary_year_avg": "147500.0",
    "skills_required": "databricks"
  },
  {
    "job_id": 1088342,
    "company_name": "Chainalysis",
    "job_title": "Data Engineer II",
    "salary_year_avg": "147500.0",
    "skills_required": "aws"
  },
  {
    "job_id": 1088342,
    "company_name": "Chainalysis",
    "job_title": "Data Engineer II",
    "salary_year_avg": "147500.0",
    "skills_required": "redshift"
  },
  {
    "job_id": 1088342,
    "company_name": "Chainalysis",
    "job_title": "Data Engineer II",
    "salary_year_avg": "147500.0",
    "skills_required": "snowflake"
  },
  {
    "job_id": 1088342,
    "company_name": "Chainalysis",
    "job_title": "Data Engineer II",
    "salary_year_avg": "147500.0",
    "skills_required": "airflow"
  },
  {
    "job_id": 1088342,
    "company_name": "Chainalysis",
    "job_title": "Data Engineer II",
    "salary_year_avg": "147500.0",
    "skills_required": "kafka"
  },
  {
    "job_id": 1088342,
    "company_name": "Chainalysis",
    "job_title": "Data Engineer II",
    "salary_year_avg": "147500.0",
    "skills_required": "kubernetes"
  }
]
*/

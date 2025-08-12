/*
    **QUESTION: WHTA ARE THE TOP SKILLS BASED ON SALARY**
1.LOOK AT THE AVERAGE SALARY ASSOCIATED  WITH EACH SKILLS FOR DATA ANALYST POSITIONS
2.FOCUSES ON ROLES WITH SPECIIFED SALARIES,REGARDLESS OF LOCATION
3.WHY? IT REVEALS HOW DIFFERENT SKILLS IMPACT SALARY LEVELS FOR DATA ANALYSTS AND HELPS IDENTIFY THE MOST FINANCIALLY REWARDING SKILL TO ACQUIRE OR IMPROVE 
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
WHERE job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        -- job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
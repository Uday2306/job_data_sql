/*
    **QUESTION: WHAT ARE THE MOST IN-DEMAND SKILLS FOR DATA ANALYST**
1.JOIN JOB POSTINGS TO INNER JOIN TABLE SIMILAR QUERY 2
2.IDENTIFY THE TOP 5-IN-DEMAND SKILLS FOR A DATA ANALYST
3.FOCUS ON ALL JOB PSOSTINGS 
4. WHY? RETIREVES THE TOP 5 SKILLS WITH THE HIGHEST DEMNAD IN THE JOB MARKET, PROVDING INSIGHTS INTO THE MOST VALUABLE SKILLS FOR JOB SEEKERS 
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
WHERE job_title_short = 'Data Analyst' AND
        job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
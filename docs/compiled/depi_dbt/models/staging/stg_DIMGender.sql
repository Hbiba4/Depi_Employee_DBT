

WITH distinct_genders AS (
    SELECT DISTINCT
        
    NULLIF(LTRIM(RTRIM(gender)), '')
 AS unique_gender
    FROM "DEPI_EmployeeDB"."dbo"."stg_employees"
)
SELECT
    ROW_NUMBER() OVER (ORDER BY unique_gender) AS id,
    unique_gender
FROM distinct_genders
WHERE unique_gender IS NOT NULL
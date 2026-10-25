

WITH distinct_countries AS (
    SELECT DISTINCT
        
    NULLIF(LTRIM(RTRIM(country)), '')
 AS unique_country
    FROM "DEPI_EmployeeDB"."dbo"."stg_employees"
)
SELECT
    ROW_NUMBER() OVER (ORDER BY unique_country) AS id,
    unique_country
FROM distinct_countries
WHERE unique_country IS NOT NULL
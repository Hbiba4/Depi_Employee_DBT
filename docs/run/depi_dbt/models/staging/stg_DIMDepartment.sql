USE "DEPI_EmployeeDB";
    
    

    

    USE "DEPI_EmployeeDB";
    EXEC('
        CREATE OR ALTER VIEW "dbo"."stg_DIMDepartment" AS 

WITH distinct_departments AS (
    SELECT DISTINCT
        
    NULLIF(LTRIM(RTRIM(department)), '''')
 AS unique_department
    FROM "DEPI_EmployeeDB"."dbo"."stg_employees"
)
SELECT
    ROW_NUMBER() OVER (ORDER BY unique_department) AS id,
    unique_department
FROM distinct_departments
WHERE unique_department IS NOT NULL;
    ')


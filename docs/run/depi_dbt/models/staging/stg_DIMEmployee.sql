USE "DEPI_EmployeeDB";
    
    

    

    USE "DEPI_EmployeeDB";
    EXEC('
        CREATE OR ALTER VIEW "dbo"."stg_DIMEmployee" AS 

SELECT DISTINCT
    ID AS id,
    
    NULLIF(LTRIM(RTRIM(first_name)), '''')
 AS first_name,
    
    NULLIF(LTRIM(RTRIM(last_name)), '''')
 AS last_name,
    
    NULLIF(LTRIM(RTRIM(email)), '''')
 AS email
FROM "DEPI_EmployeeDB"."dbo"."stg_employees";
    ')


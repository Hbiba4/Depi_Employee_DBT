USE "DEPI_EmployeeDB";
    
    

    

    USE "DEPI_EmployeeDB";
    EXEC('
        CREATE OR ALTER VIEW "dbo"."stg_employees__dbt_tmp" AS 

SELECT
    ID,
    first_name,
    last_name,
    gender,
    email,
    DOB,
    salary,
    department,
    country
FROM "DEPI_EmployeeDB"."dbo"."datadbt1";
    ')


USE "DEPI_EmployeeDB";
    
    

    

    USE "DEPI_EmployeeDB";
    EXEC('
        CREATE OR ALTER VIEW "dbo"."OBT__dbt_tmp" AS 

SELECT
    e.ID AS id,
    e.first_name,
    e.last_name,
    e.email,
    e.salary,
    e.DOB,
    e.gender,
    e.department,
    e.country,
    g.id AS id_dimgender,
    d.id AS id_dimdepartment,
    c.id AS id_dimcountry
FROM "DEPI_EmployeeDB"."dbo"."stg_employees" AS e
LEFT JOIN "DEPI_EmployeeDB"."dbo"."stg_DIMGender" AS g
    ON 
    NULLIF(LTRIM(RTRIM(e.gender)), '''')
 = g.unique_gender
LEFT JOIN "DEPI_EmployeeDB"."dbo"."stg_DIMDepartment" AS d
    ON 
    NULLIF(LTRIM(RTRIM(e.department)), '''')
 = d.unique_department
LEFT JOIN "DEPI_EmployeeDB"."dbo"."stg_DIMCountry" AS c
    ON 
    NULLIF(LTRIM(RTRIM(e.country)), '''')
 = c.unique_country;
    ')


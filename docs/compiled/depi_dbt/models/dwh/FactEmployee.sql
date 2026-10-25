

SELECT
    ROW_NUMBER() OVER (ORDER BY e.ID) AS id,
    emp.id AS id_dimemployee,
    c.id AS id_dimcountry,
    g.id AS id_dimgender,
    d.id AS id_dimdepartment,
    e.salary
FROM "DEPI_EmployeeDB"."dbo"."stg_employees" AS e
LEFT JOIN "DEPI_EmployeeDB"."dbo"."DIMEmployee" AS emp
    ON e.ID = emp.id
LEFT JOIN "DEPI_EmployeeDB"."dbo"."DIMCountry" AS c
    ON 
    NULLIF(LTRIM(RTRIM(e.country)), '')
 = c.unique_country
LEFT JOIN "DEPI_EmployeeDB"."dbo"."DIMGender" AS g
    ON 
    NULLIF(LTRIM(RTRIM(e.gender)), '')
 = g.unique_gender
LEFT JOIN "DEPI_EmployeeDB"."dbo"."DIMDepartment" AS d
    ON 
    NULLIF(LTRIM(RTRIM(e.department)), '')
 = d.unique_department
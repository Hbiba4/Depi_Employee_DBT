USE "DEPI_EmployeeDB";
    USE "DEPI_EmployeeDB";
    
    

    

    USE "DEPI_EmployeeDB";
    EXEC('
        CREATE OR ALTER VIEW "dbo"."FactEmployee__dbt_tmp__dbt_tmp_vw" AS 

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
    NULLIF(LTRIM(RTRIM(e.country)), '''')
 = c.unique_country
LEFT JOIN "DEPI_EmployeeDB"."dbo"."DIMGender" AS g
    ON 
    NULLIF(LTRIM(RTRIM(e.gender)), '''')
 = g.unique_gender
LEFT JOIN "DEPI_EmployeeDB"."dbo"."DIMDepartment" AS d
    ON 
    NULLIF(LTRIM(RTRIM(e.department)), '''')
 = d.unique_department;
    ')

EXEC('IF OBJECT_ID(''"dbo"."FactEmployee__dbt_tmp"'', ''U'') IS NOT NULL
            EXEC(''DROP TABLE "DEPI_EmployeeDB"."dbo"."FactEmployee__dbt_tmp"'');SELECT TOP 0 * INTO "DEPI_EmployeeDB"."dbo"."FactEmployee__dbt_tmp" FROM "DEPI_EmployeeDB"."dbo"."FactEmployee__dbt_tmp__dbt_tmp_vw"
        UNION ALL
        SELECT TOP 0 * FROM "DEPI_EmployeeDB"."dbo"."FactEmployee__dbt_tmp__dbt_tmp_vw"')
EXEC('INSERT INTO "DEPI_EmployeeDB"."dbo"."FactEmployee__dbt_tmp" WITH (TABLOCK)
        SELECT * FROM "DEPI_EmployeeDB"."dbo"."FactEmployee__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');
')

    

    
    USE "DEPI_EmployeeDB";
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_FactEmployee_cci'
        AND object_id=object_id('"dbo"."FactEmployee__dbt_tmp"')
    )
    DROP index "dbo"."FactEmployee__dbt_tmp"."dbo_FactEmployee_cci"
    CREATE CLUSTERED COLUMNSTORE INDEX "dbo_FactEmployee_cci"
    ON "dbo"."FactEmployee__dbt_tmp"

   
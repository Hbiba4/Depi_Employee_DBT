USE "DEPI_EmployeeDB";
    USE "DEPI_EmployeeDB";
    
    

    

    USE "DEPI_EmployeeDB";
    EXEC('
        CREATE OR ALTER VIEW "dbo"."DIMGender__dbt_tmp__dbt_tmp_vw" AS 

SELECT *
FROM "DEPI_EmployeeDB"."dbo"."stg_DIMGender";
    ')

EXEC('IF OBJECT_ID(''"dbo"."DIMGender__dbt_tmp"'', ''U'') IS NOT NULL
            EXEC(''DROP TABLE "DEPI_EmployeeDB"."dbo"."DIMGender__dbt_tmp"'');SELECT TOP 0 * INTO "DEPI_EmployeeDB"."dbo"."DIMGender__dbt_tmp" FROM "DEPI_EmployeeDB"."dbo"."DIMGender__dbt_tmp__dbt_tmp_vw"
        UNION ALL
        SELECT TOP 0 * FROM "DEPI_EmployeeDB"."dbo"."DIMGender__dbt_tmp__dbt_tmp_vw"')
EXEC('INSERT INTO "DEPI_EmployeeDB"."dbo"."DIMGender__dbt_tmp" WITH (TABLOCK)
        SELECT * FROM "DEPI_EmployeeDB"."dbo"."DIMGender__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');
')

    

    
    USE "DEPI_EmployeeDB";
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_DIMGender_cci'
        AND object_id=object_id('"dbo"."DIMGender__dbt_tmp"')
    )
    DROP index "dbo"."DIMGender__dbt_tmp"."dbo_DIMGender_cci"
    CREATE CLUSTERED COLUMNSTORE INDEX "dbo_DIMGender_cci"
    ON "dbo"."DIMGender__dbt_tmp"

   
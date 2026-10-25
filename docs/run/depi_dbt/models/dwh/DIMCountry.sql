USE "DEPI_EmployeeDB";
    USE "DEPI_EmployeeDB";
    
    

    

    USE "DEPI_EmployeeDB";
    EXEC('
        CREATE OR ALTER VIEW "dbo"."DIMCountry__dbt_tmp__dbt_tmp_vw" AS 

SELECT *
FROM "DEPI_EmployeeDB"."dbo"."stg_DIMCountry";
    ')

EXEC('IF OBJECT_ID(''"dbo"."DIMCountry__dbt_tmp"'', ''U'') IS NOT NULL
            EXEC(''DROP TABLE "DEPI_EmployeeDB"."dbo"."DIMCountry__dbt_tmp"'');SELECT TOP 0 * INTO "DEPI_EmployeeDB"."dbo"."DIMCountry__dbt_tmp" FROM "DEPI_EmployeeDB"."dbo"."DIMCountry__dbt_tmp__dbt_tmp_vw"
        UNION ALL
        SELECT TOP 0 * FROM "DEPI_EmployeeDB"."dbo"."DIMCountry__dbt_tmp__dbt_tmp_vw"')
EXEC('INSERT INTO "DEPI_EmployeeDB"."dbo"."DIMCountry__dbt_tmp" WITH (TABLOCK)
        SELECT * FROM "DEPI_EmployeeDB"."dbo"."DIMCountry__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');
')

    

    
    USE "DEPI_EmployeeDB";
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_DIMCountry_cci'
        AND object_id=object_id('"dbo"."DIMCountry__dbt_tmp"')
    )
    DROP index "dbo"."DIMCountry__dbt_tmp"."dbo_DIMCountry_cci"
    CREATE CLUSTERED COLUMNSTORE INDEX "dbo_DIMCountry_cci"
    ON "dbo"."DIMCountry__dbt_tmp"

   
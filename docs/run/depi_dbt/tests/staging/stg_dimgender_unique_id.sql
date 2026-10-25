
    
    -- Create target schema if it does not exist
  USE "DEPI_EmployeeDB";
  DECLARE @dbt_schema_lock int;
  EXEC @dbt_schema_lock = sp_getapplock
    @Resource = 'dbt_create_schema_dbo',
    @LockMode = 'Exclusive',
    @LockOwner = 'Session',
    @LockTimeout = 30000;
  BEGIN TRY
    IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dbo')
    BEGIN
      EXEC('CREATE SCHEMA "dbo"')
    END
  END TRY
  BEGIN CATCH
    IF @dbt_schema_lock >= 0
      EXEC sp_releaseapplock @Resource = 'dbt_create_schema_dbo', @LockOwner = 'Session';
    THROW;
  END CATCH
  IF @dbt_schema_lock >= 0
    EXEC sp_releaseapplock @Resource = 'dbt_create_schema_dbo', @LockOwner = 'Session';

  
  

  
  EXEC('create view 
    "dbo"."testview_7a25a6da5c7d934e4ee79e2196778d07_13970"
   as 
    SELECT id
FROM "DEPI_EmployeeDB"."dbo"."stg_DIMGender"
GROUP BY id
HAVING COUNT(*) > 1
  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    "dbo"."testview_7a25a6da5c7d934e4ee79e2196778d07_13970"
  
  ) dbt_internal_test;

  EXEC('drop view 
    "dbo"."testview_7a25a6da5c7d934e4ee79e2196778d07_13970"
  ;')
SELECT id
FROM "DEPI_EmployeeDB"."dbo"."stg_DIMCountry"
GROUP BY id
HAVING COUNT(*) > 1
SELECT id
FROM "DEPI_EmployeeDB"."dbo"."stg_DIMEmployee"
GROUP BY id
HAVING COUNT(*) > 1
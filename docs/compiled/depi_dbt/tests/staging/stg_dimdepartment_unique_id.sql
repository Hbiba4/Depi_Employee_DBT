SELECT id
FROM "DEPI_EmployeeDB"."dbo"."stg_DIMDepartment"
GROUP BY id
HAVING COUNT(*) > 1
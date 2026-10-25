SELECT id
FROM "DEPI_EmployeeDB"."dbo"."stg_DIMGender"
GROUP BY id
HAVING COUNT(*) > 1
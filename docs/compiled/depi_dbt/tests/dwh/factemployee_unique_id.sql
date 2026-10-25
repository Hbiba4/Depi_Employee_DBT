SELECT id
FROM "DEPI_EmployeeDB"."dbo"."FactEmployee"
GROUP BY id
HAVING COUNT(*) > 1
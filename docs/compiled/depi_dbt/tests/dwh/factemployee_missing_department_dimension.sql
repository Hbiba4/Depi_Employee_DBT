SELECT f.id
FROM "DEPI_EmployeeDB"."dbo"."FactEmployee" AS f
LEFT JOIN "DEPI_EmployeeDB"."dbo"."DIMDepartment" AS d
    ON f.id_dimdepartment = d.id
WHERE f.id_dimdepartment IS NULL OR d.id IS NULL
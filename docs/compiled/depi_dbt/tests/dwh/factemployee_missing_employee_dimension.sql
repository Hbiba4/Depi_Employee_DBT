SELECT f.id
FROM "DEPI_EmployeeDB"."dbo"."FactEmployee" AS f
LEFT JOIN "DEPI_EmployeeDB"."dbo"."DIMEmployee" AS d
    ON f.id_dimemployee = d.id
WHERE f.id_dimemployee IS NULL OR d.id IS NULL
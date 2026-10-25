SELECT f.id
FROM "DEPI_EmployeeDB"."dbo"."FactEmployee" AS f
LEFT JOIN "DEPI_EmployeeDB"."dbo"."DIMGender" AS d
    ON f.id_dimgender = d.id
WHERE f.id_dimgender IS NULL OR d.id IS NULL
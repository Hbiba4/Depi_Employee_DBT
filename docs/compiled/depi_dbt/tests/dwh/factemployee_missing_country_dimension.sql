SELECT f.id
FROM "DEPI_EmployeeDB"."dbo"."FactEmployee" AS f
LEFT JOIN "DEPI_EmployeeDB"."dbo"."DIMCountry" AS d
    ON f.id_dimcountry = d.id
WHERE f.id_dimcountry IS NULL OR d.id IS NULL
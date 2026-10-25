SELECT id
FROM {{ ref('stg_DIMDepartment') }}
GROUP BY id
HAVING COUNT(*) > 1

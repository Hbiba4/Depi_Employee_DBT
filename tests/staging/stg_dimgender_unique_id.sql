SELECT id
FROM {{ ref('stg_DIMGender') }}
GROUP BY id
HAVING COUNT(*) > 1

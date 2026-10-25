SELECT id
FROM {{ ref('stg_DIMEmployee') }}
GROUP BY id
HAVING COUNT(*) > 1

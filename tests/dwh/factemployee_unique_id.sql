SELECT id
FROM {{ ref('FactEmployee') }}
GROUP BY id
HAVING COUNT(*) > 1

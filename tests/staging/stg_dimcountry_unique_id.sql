SELECT id
FROM {{ ref('stg_DIMCountry') }}
GROUP BY id
HAVING COUNT(*) > 1

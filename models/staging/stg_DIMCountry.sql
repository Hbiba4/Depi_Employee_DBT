{{ config(materialized='view') }}

WITH distinct_countries AS (
    SELECT DISTINCT
        {{ clean_string('country') }} AS unique_country
    FROM {{ ref('stg_employees') }}
)
SELECT
    ROW_NUMBER() OVER (ORDER BY unique_country) AS id,
    unique_country
FROM distinct_countries
WHERE unique_country IS NOT NULL

{{ config(materialized='view') }}

SELECT
    ID,
    first_name,
    last_name,
    gender,
    email,
    DOB,
    salary,
    department,
    country
FROM {{ source('employee_source', 'datadbt1') }}

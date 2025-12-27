{{ config(
    materialized='dynamic_table',
    snowflake_warehouse='COMPUTE_WH',
    refresh_mode='INCREMENTAL'
) }}

SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CASE 
        WHEN EMAIL LIKE '%@%.%' THEN EMAIL 
        ELSE NULL 
    END AS EMAIL,
    TO_DATE(SIGNUP_DATE, 'YYYY-MM-DD') AS SIGNUP_DATE
FROM {{ source('bronze', 'raw_customers') }}
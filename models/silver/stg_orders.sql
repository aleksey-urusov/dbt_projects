{{ config(materialized='table') }}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    TO_DATE(ORDER_DATE, 'YYYY-MM-DD') AS ORDER_DATE,
    CAST(NULLIF(AMOUNT, '') AS FLOAT) AS AMOUNT,
    UPPER(STATUS) AS STATUS
FROM {{ source('bronze', 'raw_orders') }}
WHERE ORDER_ID IS NOT NULL
{{ config(
    materialized='dynamic_table',
    snowflake_warehouse='COMPUTE_WH',
    refresh_mode='INCREMENTAL'    
) }}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    TO_DATE(ORDER_DATE, 'YYYY-MM-DD') AS ORDER_DATE,
    CAST(NULLIF(AMOUNT, '') AS NUMBER) AS AMOUNT,
    UPPER(STATUS) AS STATUS
FROM {{ source('bronze', 'raw_orders') }}
WHERE ORDER_ID IS NOT NULL
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY ORDER_ID 
    ORDER BY ORDER_DATE DESC  -- Or any column that indicates recency (e.g., event_ts, ingestion_ts)
) = 1
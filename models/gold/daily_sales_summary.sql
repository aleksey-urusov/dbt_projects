{{ config(
    materialized='dynamic_table',
    snowflake_warehouse='COMPUTE_WH',
    refresh_mode='INCREMENTAL'
) }}

SELECT
    o.ORDER_DATE,
    COUNT(DISTINCT o.ORDER_ID) AS TOTAL_ORDERS,
    COUNT(DISTINCT o.CUSTOMER_ID) AS UNIQUE_CUSTOMERS,
    SUM(o.AMOUNT) AS TOTAL_SALES_AMOUNT,
    AVG(o.AMOUNT) AS AVG_ORDER_AMOUNT
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_customers') }} c ON o.CUSTOMER_ID = c.CUSTOMER_ID
WHERE o.STATUS = 'COMPLETED'
  AND o.AMOUNT IS NOT NULL
GROUP BY o.ORDER_DATE
ORDER BY o.ORDER_DATE DESC
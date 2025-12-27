{{ config(materialized='table') }}
{{ config(schema='MART') }}

SELECT
  ORDER_NUM
, CUSTOMER_ID
, CAST(AMOUNT AS DECIMAL(10, 2)) AS ORDER_TOTAL_USD
, SKU
, ORDER_DATE 
FROM {{ source('ecomm', 'order_raw') }}


  
    

        create or replace transient table ANALYTICS_DB.silver.stg_orders
         as
        (

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    TO_DATE(ORDER_DATE, 'YYYY-MM-DD') AS ORDER_DATE,
    CAST(NULLIF(AMOUNT, '') AS FLOAT) AS AMOUNT,
    UPPER(STATUS) AS STATUS
FROM ANALYTICS_DB.bronze.raw_orders
WHERE ORDER_ID IS NOT NULL
        );
      
  
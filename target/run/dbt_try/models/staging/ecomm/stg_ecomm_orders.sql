
  
    

        create or replace transient table DBT.DBT_PROJECTS_GOLD.stg_ecomm_orders
         as
        (


SELECT
  ORDER_NUM
, CUSTOMER_ID
, CAST(AMOUNT AS DECIMAL(10, 2)) AS ORDER_TOTAL_USD
, SKU
, ORDER_DATE 
FROM DBT.ecomm.order_raw
        );
      
  
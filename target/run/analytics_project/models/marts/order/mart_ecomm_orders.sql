
  
    

        create or replace transient table ANALYTICS_DB.silver_MART.mart_ecomm_orders
         as
        (


SELECT
  ORDER_NUM
, CUSTOMER_ID
, CAST(AMOUNT AS DECIMAL(10, 2)) AS ORDER_TOTAL_USD
, SKU
, ORDER_DATE 
FROM ANALYTICS_DB.ecomm.order_raw
        );
      
  
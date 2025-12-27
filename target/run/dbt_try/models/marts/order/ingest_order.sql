
  
    

        create or replace transient table DBT.DBT_PROJECTS.ingest_order
         as
        (

SELECT
  ORDER_NUM
, CUSTOMER_ID
, AMOUNT
, SKU
, ORDER_DATE 
FROM DBT.ecomm.order_raw
        );
      
  

  
    

        create or replace transient table ANALYTICS_DB.silver.stg_customers
         as
        (

SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CASE 
        WHEN EMAIL LIKE '%@%.%' THEN EMAIL 
        ELSE NULL 
    END AS EMAIL,
    TO_DATE(SIGNUP_DATE, 'YYYY-MM-DD') AS SIGNUP_DATE
FROM ANALYTICS_DB.bronze.raw_customers
        );
      
  
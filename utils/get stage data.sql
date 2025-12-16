
SELECT t.$1, t.$2, t.$3, t.$4, t.$5 
FROM @DBT.PUBLIC.ECOMM_MY_LOCAL_STAGE (file_format => 'dbt.public.ECOMM_ORDERS') AS t



DBT.ECOMM.ECOMM_STAGE_CUSTOMERCREATE OR REPLACE FILE FORMAT dbt.ecomm.hobbot
     TYPE = 'CSV'
     FIELD_DELIMITER = ','
     SKIP_HEADER = 1

--drop file format dbt.ecomm.ecomm_customer_file_format
--drop file format dbt.ecomm.hobbot

use dbt.ecomm;
show file formats;
SHOW STAGES;

use dbt.public;
show file formats;

SELECT
    $1,$2,$3     
FROM @DBT.ECOMM.ECOMM_STAGE_CUSTOMER

select * from  ecomm.customer_raw

copy into ecomm.customer_raw

COPY INTO ecomm.customer_raw
FROM @DBT.ECOMM.ECOMM_STAGE_CUSTOMER
FILE_FORMAT = DBT.ECOMM.ECOMM_STAGE_CUSTOMER
use dbt;

CREATE OR REPLACE FILE FORMAT ecomm_customer
  TYPE = CSV
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  NULL_IF = ('NULL', 'null', '')
  EMPTY_FIELD_AS_NULL = TRUE;

CREATE OR REPLACE STAGE ecomm_my_local_stage_customer
  FILE_FORMAT = ecomm_customer;

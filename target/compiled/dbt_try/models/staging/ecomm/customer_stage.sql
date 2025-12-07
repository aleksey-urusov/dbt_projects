{
  config(
    materialized = 'table',
    pre_hook = [
        "CREATE FILE FORMAT IF NOT EXISTS dbt.ecomm.ecomm_customer TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1 NULL_IF = ('NULL', 'null', '') EMPTY_FIELD_AS_NULL = TRUE;",
        "CREATE STAGE IF NOT EXISTS dbt.ecomm.ecomm_local_stage_customer FILE_FORMAT = dbt.ecomm.ecomm_customer;" ]
        )
}}
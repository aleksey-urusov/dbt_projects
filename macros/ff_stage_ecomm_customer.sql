{% macro ff_stage_ecomm_customer(file_format_name) %}
  CREATE OR REPLACE FILE FORMAT {{ file_format_name }}
    TYPE = 'CSV'
    FIELD_DELIMITER = ','
    SKIP_HEADER = 1
    TRIM_SPACE = TRUE
    EMPTY_FIELD_AS_NULL = TRUE
{% endmacro %}
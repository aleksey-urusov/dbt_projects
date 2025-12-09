{% macro sfstage_stage_ecomm_customer(stage_name) %}
  CREATE OR REPLACE STAGE {{ stage_name }}
  FILE_FORMAT = {{ stage_name }};  
{% endmacro %}
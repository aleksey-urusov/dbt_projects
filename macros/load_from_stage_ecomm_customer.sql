{% macro load_data_from_stage(target_table, source_stage, file_format_name) %}
  COPY INTO {{ target_table }}
  FROM @{{ source_stage }}
  FILE_FORMAT = (FORMAT_NAME = {{ file_format_name }})
  PURGE = TRUE -- Optional: Deletes files from stage after successful load
{% endmacro %}

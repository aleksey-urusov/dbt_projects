
  create or replace   view DBT.DBT_PROJECTS.stg_file_format.sql
  
   as (
    CREATE OR REPLACE FILE FORMAT 
  TYPE = 'CSV'
  FIELD_DELIMITER = '|'
  SKIP_HEADER = 1
  -- Add other specific options as needed
;
  );


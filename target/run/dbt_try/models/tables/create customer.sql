
  create or replace   view DBT.DBT_PROJECTS.create customer
  
   as (
    create or replace table customer (customer_id int primary key, customer_name varchar);
  );


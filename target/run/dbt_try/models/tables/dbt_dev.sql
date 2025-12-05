
  create or replace   view DBT.DBT_PROJECTS.dbt_dev
  
   as (
    create or replace table dbt_projects.customer (customer_id int primary key, customer_name varchar);
create table dbt_projects.bank_account 
(accound_id int,account_num varchar,routing_num varchar,customer_id int,CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES dbt.dbt_projects.customer(customer_id)
);
  );


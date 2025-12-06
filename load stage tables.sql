use dbt;
create schema ecomm;
use dbt.ecomm;

create or replace table order_raw(order_num varchar,customer_id varchar, amount decimal(18,5), sku varchar, order_date date);
create table customer_raw(customer_id varchar, customer_name varchar, created_at timestamp);
      
      
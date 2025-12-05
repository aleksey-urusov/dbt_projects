use dbt;
create schema ecomm;
use dbt.ecomm;

create table order_raw(order_id varchar, order_num varchar, created_at timestamp);
create table customer_raw(customer_id varchar, customer_name varchar, created_at timestamp);
      
      
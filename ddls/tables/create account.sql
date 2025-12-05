create table dbt_projects.bank_account(accound_id int,account_num varchar,routing_num varchar,customer_id int,CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id));


  create or replace   view DBT.DBT_PROJECTS_customer.customer_view
  
   as (
    

select c.customer_name, ba.account_num, ba.routing_num
from dbt.dbt_projects.customer c
join dbt.dbt_projects.bank_account ba
on c.customer_id=ba.customer_id
  );


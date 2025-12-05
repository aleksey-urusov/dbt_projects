use dbt.dbt_projects;

truncate table customer;
insert into customer values(1,'Donald Trump');
truncate table bank_account;
insert into bank_account values(1,'acc number','rt number',1);

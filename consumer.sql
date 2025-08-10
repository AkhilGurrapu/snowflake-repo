use role accountadmin;
create role if not exists snowsarva_consumer;
grant role snowsarva_consumer to role accountadmin;

create warehouse if not exists wh_snowsarva_consumer with warehouse_size='xsmall';
grant usage on warehouse wh_snowsarva_consumer to role snowsarva_consumer with grant option;

grant imported privileges on database snowflake to role snowsarva_consumer;
grant create database on account to role snowsarva_consumer;
grant bind service endpoint on account to role snowsarva_consumer with grant option;
grant create compute pool on account to role snowsarva_consumer;
grant create application on account to role snowsarva_consumer;


use role snowsarva_consumer;


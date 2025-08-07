-- Create the snowsarva_role user/role
create user snowsarva_user;
CREATE ROLE snowsarva_role;

-- Grant the snowsarva_role to the user 
GRANT ROLE snowsarva_role TO USER snowsarva_user;
ALTER USER snowsarva_user ADD PROGRAMMATIC ACCESS TOKEN test_token;
ALTER USER snowsarva_user SET NETWORK_POLICY = my_ip;

-- Grant required privileges to the role
GRANT CREATE INTEGRATION ON ACCOUNT TO ROLE snowsarva_role;
GRANT CREATE WAREHOUSE ON ACCOUNT TO ROLE snowsarva_role;
GRANT CREATE DATABASE ON ACCOUNT TO ROLE snowsarva_role;
GRANT CREATE APPLICATION PACKAGE ON ACCOUNT TO ROLE snowsarva_role;
GRANT CREATE APPLICATION ON ACCOUNT TO ROLE snowsarva_role;
GRANT CREATE COMPUTE POOL ON ACCOUNT TO ROLE snowsarva_role WITH GRANT OPTION;
GRANT BIND SERVICE ENDPOINT ON ACCOUNT TO ROLE snowsarva_role WITH GRANT OPTION;


-- Set the current context to use the snowsarva_role
USE ROLE snowsarva_role;
-- Create or replace the warehouse for the app
CREATE OR REPLACE WAREHOUSE snowsarva_warehouse
  WITH WAREHOUSE_SIZE = 'X-SMALL'
  AUTO_SUSPEND = 180
  AUTO_RESUME = true
  INITIALLY_SUSPENDED = false;

-- Create the image repository used by the app
CREATE DATABASE snowsarva_image_database;
CREATE SCHEMA snowsarva_image_schema;
CREATE IMAGE REPOSITORY snowsarva_image_repo;

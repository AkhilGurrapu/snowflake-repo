create user if not exists akhil;
alter user akhil set password = 'AKHIL@1997';
CREATE ROLE tutorial1_role;

GRANT ROLE tutorial1_role TO USER akhil;


GRANT ALL PRIVILEGES ON warehouse compute_wh TO ROLE tutorial1_role;
GRANT CREATE APPLICATION PACKAGE ON ACCOUNT TO ROLE tutorial1_role;
GRANT CREATE APPLICATION ON ACCOUNT TO ROLE tutorial1_role;
create database admin_db;
create schema admin_sch;

-- 1. Role with the right privileges
USE ROLE ACCOUNTADMIN;      -- or a delegated admin role

-- 2. Secret with PAT
CREATE OR REPLACE SECRET my_git_secret
  TYPE = PASSWORD
  USERNAME = 'AkhilGurrapu'
  PASSWORD = '<token>';

-- 3. API integration
CREATE OR REPLACE API INTEGRATION my_git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/AkhilGurrapu')
  ALLOWED_AUTHENTICATION_SECRETS = (my_git_secret)
  ENABLED = TRUE;

-- 4. Optional: clone a repository
CREATE OR REPLACE GIT REPOSITORY my_repo
  API_INTEGRATION = my_git_api_integration
  GIT_CREDENTIALS = my_git_secret
  ORIGIN = 'https://github.com/AkhilGurrapu/snowflake-repo.git';

SHOW GIT REPOSITORIES;

ALTER GIT REPOSITORY my_repo FETCH;
use role accountadmin;
GRANT USAGE ON COMPUTE POOL CP_SNOWSARVA TO APPLICATION snowsarva_akhilgurrapu;
GRANT USAGE ON WAREHOUSE WH_SNOWSARVA_CONSUMER TO APPLICATION snowsarva_akhilgurrapu;
GRANT BIND SERVICE ENDPOINT ON ACCOUNT TO APPLICATION snowsarva_akhilgurrapu;

use role snowsarva_consumer;
use warehouse wh_snowsarva_consumer;
CALL snowsarva_akhilgurrapu.app_public.start_app('CP_SNOWSARVA', 'WH_SNOWSARVA_CONSUMER');
CALL snowsarva_akhilgurrapu.app_public.app_url();


CALL snowsarva_akhilgurrapu.app_public.stop_app();
CALL snowsarva_akhilgurrapu.app_public.start_app('CP_SNOWSARVA', 'WH_SNOWSARVA_CONSUMER');
CALL snowsarva_akhilgurrapu.app_public.app_url();
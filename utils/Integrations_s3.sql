--- create policy and role in AWS

CREATE OR REPLACE STORAGE INTEGRATION integration_s3_aws_hobbot
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::146896944477:role/s3_snowflake_integration'
  STORAGE_ALLOWED_LOCATIONS = ('s3://aurusov/data/');

  DESC INTEGRATION integration_s3_aws_hobbot;

  --- update trust policy in AWS Role:
  storage_aws_iam_user_arn -->  arn:aws:iam::990117462990:user/y1zc1000-s
  "Principal": {"AWS": "<storage_aws_iam_user_arn>"}
  
  storage_aws_external_id  -->  FDC14467_SFCRole=4_mhWuSp8/8FkHNcJY055hCvzI/TE= 
  "Action": "sts:AssumeRole","Condition": {"StringEquals": {"sts:ExternalId": "<storage_aws_external_id>"}}

  -- This is a regular S3 stage
  CREATE STAGE dbt.ecomm.hobbot_s3_stage
  URL = 's3://aurusov/data/'
  STORAGE_INTEGRATION = integration_s3_aws_hobbot
  FILE_FORMAT = (TYPE = CSV);  -- or PARQUET, JSON, etc.

  -- This is the external table/ICEBERG part
  CREATE EXTERNAL VOLUME s3_external_volume_hob
  STORAGE_LOCATIONS = (
    (
      NAME = 's3_external_volume_hob'
      STORAGE_PROVIDER = 'S3'
      STORAGE_BASE_URL = 's3://aurusov/data/'
      STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::146896944477:role/s3_snowflake_integration'
      STORAGE_AWS_EXTERNAL_ID = 'FDC14467_SFCRole=4_mhWuSp8/8FkHNcJY055hCvzI/TE='
    )
  );
  --- https://grok.com/c/14103df8-f6e0-4f45-8f0c-046b821fbd8c?rid=a70a284f-3cec-4384-9347-424474b4d2d7

DESCRIBE EXTERNAL VOLUME s3_external_volume_hob
{"NAME":"s3_external_volume_hob","STORAGE_PROVIDER":"S3","STORAGE_BASE_URL":"s3://aurusov/data/","STORAGE_ALLOWED_LOCATIONS":["s3://aurusov/data/*"],
"STORAGE_AWS_ROLE_ARN":"arn:aws:iam::146896944477:role/s3_snowflake_integration",
"STORAGE_AWS_IAM_USER_ARN":"arn:aws:iam::990117462990:user/y1zc1000-s",
"STORAGE_AWS_EXTERNAL_ID":"FDC14467_SFCRole=4_mhWuSp8/8FkHNcJY055hCvzI/TE=","ENCRYPTION_TYPE":"NONE","ENCRYPTION_KMS_KEY_ID":""}



--load data into stade using Snowflake UI

--copy from stage to staging table,validate and show errors
COPY INTO TABLE STAGING_TABLE
FROM @MY_STAGE/patients.csv
FILE_FORMAT =(TYPE = CSV)
VALIDATION_MODE = 'RETURN_ERRORS';

--copy into staging table and choose how to handle errors(error handling)
COPY INTO TABLE STAGING_TABLE
FROM @MY_STAGE/patients.csv
FILE_FORMAT =(TYPE = CSV)
ON_ERROR = 'CONTINUE';

--insert from staging table into final table,in RAW schema
INSERT INTO PATIENTS
SELECT *
FROM STAGING_TABLE;

--Drop staging table
DROP TABLE STAGING_TABLE;

--Recreate staging table and match with appointments.csv columns
--Create Appointmaents table in Raw schema
-- Repeat data load process and insert into final table

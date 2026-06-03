--create main database and schemas
CREATE DATABASE HEALTH;
CREATE SCHEMA RAW;
CREATE SCHEMA CLEAN;

-- creation of stage to load dataset into before copying to staging table
CREATE STAGE my_stage;

-- staging table created for patients.csv,truncated after use and recreated for appointment.csv dataset
CREATE TABLE STAGING_TABLE(
PATIENT_ID STRING,
NAME STRING,
GENDER STRING,
DOB STRING,
CITY STRING,
)
;

-- create final table in Raw schema
CREATE TABLE PATIENTS(
PATIENT_ID STRING,
NAME STRING,
GENDER STRING,
DOB STRING,
CITY STRING,
)
;


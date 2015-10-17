--create table based on stage_hospitals

DROP TABLE Hospital;

CREATE TABLE Hospital 
row format delimited
fields terminated by '\t'
STORED AS RCFILE
AS SELECT 
Provider_ID as hospital_id, 
Hospital_Name as hospital_name, 
State as state_cd
FROM stage_hospitals;

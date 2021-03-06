DROP TABLE stage_measure_dates;

CREATE EXTERNAL TABLE stage_measure_dates 
(Measure_Name varchar(500), 
Measure_ID varchar(50), 
Measure_Start_Quarter varchar(500), 
Measure_Start_Date DATE, 
Measure_End_Quarter varchar(500), 
Measure_End_Date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/stage_measure_dates';

DROP TABLE stage_hospitals;

CREATE EXTERNAL TABLE stage_hospitals
(Provider_ID varchar(10),
Hospital_Name varchar(500),
Address varchar(500),
City varchar(500),
State varchar(500),
ZIP varchar(500),
County varchar(500),
Phone varchar(500),
Hospital_Type varchar(500),
Ownership varchar(500),
Emergency varchar(500))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/stage_hospitals';

DROP TABLE stage_readmissions;

CREATE EXTERNAL TABLE stage_readmissions
(Provider_ID  varchar(10),
Hospital_Name  varchar(500),
Address varchar(500),
City varchar(500),
State varchar(5),
ZIP varchar(20),
County varchar(500),
Phone varchar(500),
Measure_Name varchar(500),
Measure_ID varchar(50),
Compared_National  varchar(500),
Denominator varchar(500),
Score varchar(500),
Lower_Estimate   varchar(500),
Higher_Estimate   varchar(500),
Footnote varchar(500),
Measure_Start_Date varchar(500),
Measure_End_Date varchar(500))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/stage_readmissions';

DROP TABLE stage_effective_care;

CREATE EXTERNAL TABLE stage_effective_care
(Provider_ID  varchar(500),
Hospital_Name  varchar(500),
Address varchar(500),
City varchar(500),
State varchar(500),
ZIP varchar(500),
County varchar(500),
Phone varchar(500),
Condition varchar(500),
Measure_ID varchar(50),
Measure_Name varchar(500),
Score varchar(500),
Sample varchar(500),
Footnote varchar(500),
Measure_Start_Date varchar(500),
Measure_End_Date varchar(500))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/stage_effective_care';


DROP TABLE stage_survey_responses;

CREATE EXTERNAL TABLE stage_survey_responses
(Provider_ID  varchar(500),
Hospital_Name  varchar(500),
Address varchar(500),
City varchar(500),
State varchar(500),
ZIP varchar(500),
County varchar(500),
Comm_Nurse_Achieve_Pts varchar(500),
Comm_Nurse_Improve_Pts varchar(500),
Comm_Nurse_Dimension_Score varchar(500),
Comm_Doctor_Achieve_Pts varchar(500),
Comm_Doctor_Improve_Pts varchar(500),
Comm_Doctor_Dimension_Score varchar(500),
Response_Staff_Achieve_Pts varchar(500),
Response_Staff_Improve_Pts varchar(500),
Response_Staff_Dimension_Score varchar(500),
Pain_Mgmt_Achieve_Pts varchar(500),
Pain_Mgmt_Improve_Pts varchar(500),
Pain_Mgmt_Dimension_Score varchar(500),
Comm_Med_Achieve_Pts varchar(500),
Comm_Med_Improve_Pts varchar(500),
Comm_Med_Dimension_Score varchar(500),
Clean_Quiet_Achieve_Pts varchar(500),
Clean_Quiet_Improve_Pts varchar(500),
Clean_Quiet_Dimension_Score varchar(500),
Discharge_Info_Achieve_Pts varchar(500),
Discharge_Info_Improve_Pts varchar(500),
Discharge_Info_Dimension_Score varchar(500),
Overall_Achieve_Pts varchar(500),
Overall_Improve_Pts varchar(500),
Overall_Dimension_Score varchar(500),
Base_Score varchar(500),
Consistency_Score varchar(500))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/stage_survey_responses';


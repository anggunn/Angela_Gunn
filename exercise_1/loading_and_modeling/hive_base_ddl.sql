DROP TABLE Stage_Measure_Dates;

CREATE TABLE Stage_Measure_Dates 
(Measure_Name varchar(500), 
Measure_ID varchar(500), 
Measure_Start_Quarter varchar(500), 
Measure_Start_Date DATE, 
Measure_End_Quarter varchar(500), 
Measure_End_Date DATE)
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

DROP TABLE Stage_Hospital_General;

CREATE TABLE Stage_Hospital_General
(Provider_ID varchar(500),
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
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

DROP TABLE Stage_Readmissions;

CREATE TABLE Stage_Readmissions
(Provider_ID  varchar(500),
Hospital_Name  varchar(500),
Address varchar(500),
City varchar(500),
State varchar(500),
ZIP varchar(500),
County varchar(500),
Phone varchar(500),
Measure_Name varchar(500),
Measure_ID varchar(500),
Compared_National  varchar(500),
Denominator varchar(500),
Score varchar(500),
Lower_Estimate  varchar(500),
Higher_Estimate  varchar(500),
Footnote varchar(500),
Measure_Start_Date varchar(500),
Measure_End_Date varchar(500))
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

DROP TABLE Stage_Effictive_Care;

CREATE TABLE Stage_Effictive_Care
(Provider_ID  varchar(500),
Hospital_Name  varchar(500),
Address varchar(500),
City varchar(500),
State varchar(500),
ZIP varchar(500),
County varchar(500),
Phone varchar(500),
Condition varchar(500),
Measure_ID varchar(500),
Measure_Name varchar(500),
Score varchar(500),
Sample varchar(500),
Footnote varchar(500),
Measure_Start_Date varchar(500),
Measure_End_Date varchar(500))
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

DROP TABLE Stage_Surveys;

CREATE TABLE Stage_Surveys
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
Consistence_Score varchar(500))
row format delimited
fields terminated by '\t'
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare';

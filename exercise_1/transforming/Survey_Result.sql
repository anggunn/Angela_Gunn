--create table based on stage_survey_responses
--note we create a patient_experience_score as the sum of consistency_score and base_score
--as per data definition. (http://www.hcahpsonline.org/Files/Hospital%20VBP%20Domain%20Score%20Calculation%20Step-by-Step%20Guide_V2.pdf)
--scores that are text base are stored as NULL

DROP TABLE Survey_Result;

CREATE TABLE Survey_Result
row format delimited
fields terminated by '\t'
STORED AS RCFILE
AS 
SELECT 
Provider_ID as hospital_id,
CAST (Base_Score as int) as base_score,
CAST (Consistency_Score as int) as consistency_score,
CAST (Base_Score as int) + CAST (Consistency_Score as int) as patient_experience_score
FROM stage_survey_responses;
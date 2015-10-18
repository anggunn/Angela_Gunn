
--create view with a rank for each hospital based on patient_experience_score
DROP VIEW vw_hospital_survey_rank;
CREATE VIEW vw_hospital_survey_rank AS
SELECT hospital_id, patient_experience_score, base_score, consistency_score,
RANK() OVER (ORDER by patient_experience_score desc) as rank_order
FROM Survey_Result;


--select hospitals with rank 1 in survey_rank
SELECT HSR.hospital_id, HSR.rank_order, H.hospital_name
FROM vw_hospital_survey_rank HSR
JOIN Hospital H on (HSR.hospital_id = H.hospital_id)
WHERE rank_order = 1;

--create a view filtered to have only the hospital_prime hospitals.
DROP VIEW vw_Hospital_Survey_Rank_Prime;
CREATE VIEW vw_Hospital_Survey_Rank_Prime AS
SELECT HP.hospital_id, patient_experience_score,
base_score, consistency_score,
RANK() OVER (ORDER by patient_experience_score desc) as rank_order
FROM Survey_Result
JOIN vw_Hospital_Prime HP ON (HP.hospital_id = Survey_Result.hospital_id);

--view based on vw_Hospital_Rank, but with the rank function.
DROP VIEW vw_Hospital_Procedure_Rank;
CREATE VIEW vw_Hospital_Procedure_Rank AS
SELECT HR.hospital_id, 
RANK() OVER (ORDER BY HR.mean_rank) as rank_order
FROM vw_Hospital_Rank HR;

DROP VIEW vw_Hospital_Pairs_Prime;
CREATE VIEW vw_Hospital_Pairs_Prime as 
SELECT HSR.hospital_id,
HPR.rank_order as procedure_rank,
HSR.rank_order as survey_rank, 
HSR.base_score, HSR.consistency_score
FROM vw_Hospital_Survey_Rank_Prime HSR
JOIN vw_Hospital_Procedure_Rank HPR ON (HSR.hospital_id = HPR.hospital_id);

--select top 10 hospitals  in survey_rank (prime)
SELECT HSR.hospital_id, HSR.rank_order, 
HSR.base_score, HSR.consistency_score,
H.hospital_name
FROM vw_Hospital_Survey_Rank_Prime HSR
JOIN Hospital H on (HSR.hospital_id = H.hospital_id)
LIMIT 10;

--select hospitals top 10 procedure ranks, with survey_rank ranks shown.
SELECT 
HP.hospital_id, HP.procedure_rank,HP.survey_rank, 
HP.base_score, HP.consistency_score,
H.hospital_name
FROM vw_Hospital_Pairs_Prime HP
JOIN hospital H on (H.hospital_id = HP.hospital_id)
ORDER BY HP.procedure_rank
LIMIT 10;


-- determine the Pearson correlation
SELECT ROUND(CORR(procedure_rank,survey_rank),2)
FROM vw_Hospital_Pairs_Prime;
			
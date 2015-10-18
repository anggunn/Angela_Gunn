-- this script returns the top 10 hospitals based on measured ranks.



-- Create a view to list only the hospitals with a high number of measures;
-- we don't want to compare hospitals with only a couple measures
-- to those with many.
-- 45 was determined outside of this script to capture many hospitals.
DROP VIEW vw_Hospital_Prime;
CREATE VIEW vw_Hospital_Prime AS
SELECT hospital_id, COUNT(DISTINCT measure_id) as num_measures
FROM procedures
GROUP BY hospital_id
HAVING num_measures >= 45;


--Create table for ranking the procedure scores, taking only the hospitals we identified as prime
--Note we use a union here since we want to rank in reverse order if lower numbers are better 
--(such as measures of how much time before patient is seen by doctor - lower is better!)
--so in effect the use of rank() here makes all our measures work the same way, where 1 is the
--best score.
DROP VIEW vw_Procedure_Measure_Rank;
CREATE VIEW vw_Procedure_Measure_Rank
AS 
SELECT P.hospital_id, P.measure_id,
rank() OVER (PARTITION BY P.measure_id ORDER BY P.score DESC) as measure_rank
FROM Procedures P
JOIN vw_Hospital_Prime HP on (P.hospital_id = HP.hospital_id)
JOIN Measure M ON (M.measure_id = P.measure_id)
WHERE M.lower_better_flg = 0
UNION ALL
SELECT P.hospital_id, P.measure_id,
rank() OVER (PARTITION BY P.measure_id ORDER BY P.score ASC) as measure_rank
FROM Procedures P
JOIN vw_Hospital_Prime HP on (P.hospital_id = HP.hospital_id)
JOIN Measure M ON (M.measure_id = P.measure_id)
WHERE M.lower_better_flg = 1;

--select hospitals by averaging their ranks. 
--Top hospitals will have more measure ranks closer to 1, so order by the average.
DROP VIEW vw_Hospital_Rank;
CREATE VIEW vw_Hospital_Rank AS
SELECT
PMR.hospital_id,
ROUND(AVG(PMR.measure_rank),2) as mean_rank,
ROUND(stddev_pop (PMR.measure_rank),2) as stddev_rank
FROM vw_Procedure_Measure_Rank PMR
GROUP BY PMR.hospital_id;

--select top 10
SELECT 
HR.hospital_id, 
HR.mean_rank, HR.stddev_rank,
H.hospital_name
FROM vw_Hospital_Rank HR
JOIN Hospital H ON (HR.hospital_id = H.hospital_id)
ORDER BY HR.mean_rank, HR.stddev_rank
LIMIT 10;


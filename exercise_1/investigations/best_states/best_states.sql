--this script returns the top 10 hospitals based on measured ranks.


-- The problem here is a state with 3 hospitals may all be top performing, but a state with 10 hospitals may have 3 top performing but 
-- 7 average or lower. So since we are looking at states, we should get the average scores for the measures for all hospitals.
-- A state with a model of high standards should have those standards reflect everywhere.
-- NY should not be a better model because it has more hospitals than Rhode Island.

-- A view to list only the measures used most frequently (top 30).
DROP VIEW vw_Measure_Prime;
CREATE VIEW vw_Measure_Prime AS
SELECT measure_id, COUNT(DISTINCT hospital_id) as num_measures
FROM procedures
GROUP BY measure_id
ORDER BY num_measures desc
LIMIT 30;


-- view of all procedures with associated state, filtered to just the prime ones.
DROP VIEW vw_State_Procedures;
CREATE VIEW vw_State_Procedures AS
SELECT H.state_cd, P.measure_id, P.score
FROM Hospital H
JOIN Procedures P on (H.hospital_id = P.hospital_id)
JOIN vw_Measure_Prime MP on (P.measure_id = MP.measure_id);


-- view of all measures assigned to a state. one measure per state per row
DROP VIEW vw_State_Measure_Rank;
CREATE VIEW vw_State_Measure_Rank
AS    
SELECT UnionQuery1.state_cd, UnionQuery1.measure_id, 
AVG(UnionQuery1.measure_rank ) as avg_score ---get the average 
FROM 

--- rank the measures where higher values are better
(SELECT P.state_cd, P.measure_id,
rank() OVER (PARTITION BY P.measure_id ORDER BY P.score DESC) as measure_rank
FROM 
vw_State_Procedures P
JOIN Measure M ON (M.measure_id = P.measure_id)
WHERE M.lower_better_flg = 0
UNION ALL
--- rank the measures where lower values are better
SELECT P.state_cd, P.measure_id,
rank() OVER (PARTITION BY P.measure_id ORDER BY P.score ASC) as measure_rank
FROM vw_State_Procedures P
JOIN Measure M ON (M.measure_id = P.measure_id)
WHERE M.lower_better_flg = 1) UnionQuery1
GROUP BY  UnionQuery1.state_cd, UnionQuery1.measure_id;

-- re-rank the measures across states.
DROP VIEW vw_State_Avg_Ranks;
CREATE VIEW vw_State_Avg_Ranks AS
SELECT SMR.state_cd, SMR.measure_id,
rank() over (PARTITION BY SMR.measure_id ORDER BY SMR.avg_score) as measure_rank
FROM vw_State_Measure_Rank SMR;

--- select states with highest average of measure ranks
SELECT SAR.state_cd, 
ROUND(AVG(SAR.measure_rank),2) as mean_rank,
ROUND(stddev_pop(SAR.measure_rank),2) as stddev_rank
FROM vw_State_Avg_Ranks SAR
group by SAR.state_cd
order by mean_rank, stddev_rank
LIMIT 10;
--create a table based on the stage_effective_care and stage_readmissions
--unioned together to create one table;

DROP TABLE Procedures;

CREATE TABLE Procedures
row format delimited
fields terminated by '\t'
STORED AS RCFILE
AS 
SELECT
Provider_ID as hospital_id,
Measure_ID as measure_id,
CAST(Score as int) as score,
0 as readmin_flg
FROM stage_effective_care
WHERE CAST(Score as int) is not NULL
UNION ALL
SELECT
Provider_ID as hospital_id,
Measure_ID as measure_id,
CAST(Score as int) as score,
1 as readmin_flg
FROM stage_readmissions
WHERE CAST(Score as int) is not NULL;

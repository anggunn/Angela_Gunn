--create a table based on the stage_measure_dates table.
--note that we look at specific measures to identify their type and how they should be handled.

DROP TABLE Measure;

CREATE TABLE Measure
row format delimited
fields terminated by '\t'
STORED AS RCFILE
AS 
SELECT 
Measure_ID as measure_id,
Measure_Name as measure_name,
CASE WHEN measure_id LIKE 'MORT%' THEN 1
WHEN measure_id LIKE 'READM%' THEN 1
WHEN measure_id LIKE 'OP_22' THEN 1
WHEN measure_id LIKE 'ED%'  THEN 1
WHEN measure_id LIKE 'OP_18b%' THEN 1
WHEN measure_id LIKE 'OB_20%' THEN 1
WHEN measure_id LIKE 'OB_21%' THEN 1
WHEN measure_id LIKE 'OB_3b%' THEN 1
WHEN measure_id LIKE 'OB_5%' THEN 1
WHEN measure_id LIKE 'OB_20%' THEN 1
ELSE 0
END as lower_better_flg,
CASE WHEN measure_id LIKE 'ED%'  THEN 1
WHEN measure_id LIKE 'OP_18b%' THEN 1
WHEN measure_id LIKE 'OB_20%' THEN 1
WHEN measure_id LIKE 'OB_21%' THEN 1
WHEN measure_id LIKE 'OB_3b%' THEN 1
WHEN measure_id LIKE 'OB_5%' THEN 1
WHEN measure_id LIKE 'OB_20%' THEN 1
WHEN measure_id LIKE 'PC_01' THEN 1
WHEN measure_id LIKE 'VTE_0' THEN 1
ELSE 0
END as as_time_flg
FROM stage_measure_dates;

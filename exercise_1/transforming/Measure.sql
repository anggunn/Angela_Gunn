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
CASE WHEN measure_id LIKE 'MORT%' THEN 1  --death rates
WHEN measure_id LIKE 'READM%' THEN 1 --unplanned readmission
WHEN measure_id LIKE 'OP_22' THEN 1  --percentage patients leave without being seen
WHEN measure_id LIKE 'ED%'  THEN 1  --time (shorter better)
WHEN measure_id LIKE 'OP_18b' THEN 1 --time (shorter better)
WHEN measure_id LIKE 'OP_20' THEN 1 --time (shorter better)
WHEN measure_id LIKE 'OP_21' THEN 1 --time (shorter better)
WHEN measure_id LIKE 'OP_3b' THEN 1  --time (shorter better)
WHEN measure_id LIKE 'OP_5' THEN 1  --time (shorter better)
WHEN measure_id LIKE 'OP_1' THEN 1   --time (shorter better)
WHEN measure_id LIKE 'PC_01' THEN 1 --percent newborns scheduled early but not medically necessary
WHEN measure_id LIKE 'OP_8' THEN 1 --high number means facility doing too many unnecessary MRI
WHEN measure_id LIKE 'OP_11' THEN 1 --high number means too many double scans
WHEN measure_id LIKE 'OP_10' THEN 1  -- high number means too many double scans
WHEN measure_id LIKE 'OP_13' THEN 1 --high number means too many scans
WHEN measure_id LIKE 'OP_14' THEN 1 --high number means too many scans
ELSE 0
END as lower_better_flg,
CASE WHEN measure_id LIKE 'ED%'  THEN 1
WHEN measure_id LIKE 'OP_18b' THEN 1
WHEN measure_id LIKE 'OP_20' THEN 1
WHEN measure_id LIKE 'OP_21' THEN 1
WHEN measure_id LIKE 'OP_3b' THEN 1
WHEN measure_id LIKE 'OP_5' THEN 1
WHEN measure_id LIKE 'OP_1' THEN 1
ELSE 0
END as as_time_flg
FROM stage_measure_dates;

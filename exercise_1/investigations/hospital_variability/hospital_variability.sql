--this script returns the variance between measure scores.			

--Sript to return the top 10 hospitals by procedure score
SELECT P.measure_id, 
ROUND(VARIANCE(score),2) as score_var,
ROUND(stddev_pop(score),2) as score_stddev,
ROUND(AVG(score),2) as score_mean,
M.measure_name
FROM 
Procedures P
JOIN Measure M on (P.measure_id = M.measure_id)
GROUP BY P.measure_id, M.measure_name
order by score_var desc
LIMIT 10;

-- return just those based on time
SELECT P.measure_id, 
ROUND(VARIANCE(score),2) as score_var,
ROUND(stddev_pop(score),2) as score_stddev,
ROUND(AVG(score),2) as score_mean,
M.measure_name
FROM 
Procedures P
JOIN Measure M on (P.measure_id = M.measure_id)
WHERE M.as_time_flg = 1
GROUP BY P.measure_id, M.measure_name
order by score_var desc 
LIMIT 10;

-- return just those not based on time
SELECT P.measure_id, 
ROUND(VARIANCE(score),2) as score_var,
ROUND(stddev_pop(score),2) as score_stddev,
ROUND(AVG(score),2) as score_mean,
M.measure_name
FROM 
Procedures P
JOIN Measure M on (P.measure_id = M.measure_id)
WHERE M.as_time_flg = 0
GROUP BY P.measure_id, M.measure_name
order by score_var desc 
LIMIT 10;
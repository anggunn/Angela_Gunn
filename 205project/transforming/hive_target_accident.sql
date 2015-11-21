USE accident_project;

DROP TABLE ACCIDENT;
CREATE EXTERNAL TABLE ACCIDENT
(
case_number varchar(500), 
file_year int, 
month varchar(500),
Day_of_Week varchar(500),
Hour int,
Region varchar(500),
Num_Vehicles int,
Num_ParkWork int,
Persons_Ped int,
Persons_NotTransit int,
Persons_Transit int,
First_Harm_Event varchar(500),
Manner_Collision varchar(500),
Within_Interchange varchar(500),
Relation_to_Junction varchar(500),
Intersection_Type varchar(500),
Work_Zone varchar(500),
Weather1 varchar(500),
Weather2 varchar(500),
Weather3 varchar(500),
Max_Injury varchar(500),
Num_Injury int,
Alcohol_Involved varchar(500)
)
PARTITIONED BY (year string) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/data/ACCIDENT';

--alter table ACCIDENT add partition(year='2013') location '/user/w205/accident_project/data/ACCIDENT/2013'



add FILE /data/205project/pyscripts/2013Accident.py;

insert into table accident PARTITION (year = '2013')
select TRANSFORM(
CaseNum, 2013, month, Day_Week, Hour, Region, Ve_Total, ve_Forms, 
Peds, PerNotMVIT, PERMVIT, Harm_EV, MAN_COLL,
RelJct1, RelJct2, Typ_Int,Wrk_Zone,
Weather, Weather1, Weather2,
max_sev, num_Inj,alcohol) 
using "python 2013Accident.py" 
as (case_number varchar(500), 
file_year int, 
month varchar(500),
Day_of_Week varchar(500),
Hour int,
Region varchar(500),
Num_Vehicles int,
Num_ParkWork int,
Persons_Ped int,
Persons_NotTransit int,
Persons_Transit int,
First_Harm_Event varchar(500),
Manner_Collision varchar(500),
Within_Interchange varchar(500),
Relation_to_Junction varchar(500),
Intersection_Type varchar(500),
Work_Zone varchar(500),
Weather1 varchar(500),
Weather2 varchar(500),
Weather3 varchar(500),
Max_Injury varchar(500),
Num_Injury int,
Alcohol_Involved varchar(500)
)
FROM accident_project.accident_2013;


add FILE /data/205project/pyscripts/2012Accident.py;

alter table accident drop if exists partition (year = '2012');

insert into table accident PARTITION (year = '2012')
select TRANSFORM(
CaseNum, 2012, month, Day_Week, Hour, Region, Ve_Total, ve_Forms, 
Peds, PerNotMVIT, PERMVIT, Harm_EV, MAN_COLL,
RelJct1, RelJct2, Typ_Int,Wrk_Zone,
Weather, Weather1, Weather2,
max_sev, num_Inj,alcohol) 
using "python 2012Accident.py" 
as (case_number varchar(500), 
file_year int, 
month varchar(500),
Day_of_Week varchar(500),
Hour int,
Region varchar(500),
Num_Vehicles int,
Num_ParkWork int,
Persons_Ped int,
Persons_NotTransit int,
Persons_Transit int,
First_Harm_Event varchar(500),
Manner_Collision varchar(500),
Within_Interchange varchar(500),
Relation_to_Junction varchar(500),
Intersection_Type varchar(500),
Work_Zone varchar(500),
Weather1 varchar(500),
Weather2 varchar(500),
Weather3 varchar(500),
Max_Injury varchar(500),
Num_Injury int,
Alcohol_Involved varchar(500)
)
FROM accident_project.accident_2012;


add FILE /data/205project/pyscripts/2011Accident.py;

insert into table accident PARTITION (year = '2011')
select TRANSFORM(
CaseNum, 2011, month, Day_Week, Hour, Region, Ve_Total, ve_Forms, 
Peds, PerNotMVIT, PERMVIT, Harm_EV, MAN_COLL,
RelJct1, RelJct2, Typ_Int,Wrk_Zone,
Weather, Weather1, Weather2,
max_sev, num_Inj,alcohol) 
using "python 2011Accident.py" 
as (case_number varchar(500), 
file_year int, 
month varchar(500),
Day_of_Week varchar(500),
Hour int,
Region varchar(500),
Num_Vehicles int,
Num_ParkWork int,
Persons_Ped int,
Persons_NotTransit int,
Persons_Transit int,
First_Harm_Event varchar(500),
Manner_Collision varchar(500),
Within_Interchange varchar(500),
Relation_to_Junction varchar(500),
Intersection_Type varchar(500),
Work_Zone varchar(500),
Weather1 varchar(500),
Weather2 varchar(500),
Weather3 varchar(500),
Max_Injury varchar(500),
Num_Injury int,
Alcohol_Involved varchar(500)
)
FROM accident_project.accident_2011;


add FILE /data/205project/pyscripts/2010Accident.py;

insert into table accident PARTITION (year = '2010')
select TRANSFORM(
CaseNum, 2010, month, Day_Week, Hour, Region, 999, veh_invl, 
999, non_invl, 999, Event1, MAN_COL,
RelJct1, RelJct2, Typ_Int,Wrk_Zone,
Weather, Weather1, Weather2,
max_sev, num_Inj,alcohol) 
using "python 2010Accident.py" 
as (case_number varchar(500), 
file_year int, 
month varchar(500),
Day_of_Week varchar(500),
Hour int,
Region varchar(500),
Num_Vehicles int,
Num_ParkWork int,
Persons_Ped int,
Persons_NotTransit int,
Persons_Transit int,
First_Harm_Event varchar(500),
Manner_Collision varchar(500),
Within_Interchange varchar(500),
Relation_to_Junction varchar(500),
Intersection_Type varchar(500),
Work_Zone varchar(500),
Weather1 varchar(500),
Weather2 varchar(500),
Weather3 varchar(500),
Max_Injury varchar(500),
Num_Injury int,
Alcohol_Involved varchar(500)
)
FROM accident_project.accident_2010;


add FILE /data/205project/pyscripts/2009Accident.py;

insert into table accident PARTITION (year = '2009')
select TRANSFORM(
CaseNum, 2009, month, Day_Week, Hour, Region, 999, veh_invl, 
999, non_invl, 999, Event1, MAN_COL,
9, Rel_Jct, 9,Wrk_Zone,
Weather, 
max_sev, num_Inj,alcohol) 
using "python 2009Accident.py" 
as (case_number varchar(500), 
file_year int, 
month varchar(500),
Day_of_Week varchar(500),
Hour int,
Region varchar(500),
Num_Vehicles int,
Num_ParkWork int,
Persons_Ped int,
Persons_NotTransit int,
Persons_Transit int,
First_Harm_Event varchar(500),
Manner_Collision varchar(500),
Within_Interchange varchar(500),
Relation_to_Junction varchar(500),
Intersection_Type varchar(500),
Work_Zone varchar(500),
Weather1 varchar(500),
Weather2 varchar(500),
Weather3 varchar(500),
Max_Injury varchar(500),
Num_Injury int,
Alcohol_Involved varchar(500)
)
FROM accident_project.accident_2009;
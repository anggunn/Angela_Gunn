USE accident_project;

CREATE EXTERNAL TABLE VEHICLE
(
case_number varchar(500), 
vehicle_number int,
file_year int, 
num_occupants int,
body_type varchar(500),
model_year int,
extent_damage varchar(500),
most_harm_event varchar(500),
num_injury int,
max_injury varchar(500),
driver_drinking varchar(500),
speeding varchar(500),
pre_event_movement varchar(500),
critical_event_precrash varchar(500)
)
PARTITIONED BY (year string) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/data/VEHICLE';


add FILE /data/205project/pyscripts/2013Vehicle.py;

insert into table vehicle PARTITION (year = '2013')
select TRANSFORM(
CaseNum, veh_no, '2013', numoccs, body_typ, mod_year, deformed, m_harm,
max_vsev, veh_alch, speedrel, trav_sp, p_crash1, p_crash2) 
using "python 2013Vehicle.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
num_occupants int,
body_type varchar(500),
model_year int,
extent_damage varchar(500),
most_harm_event varchar(500),
num_injury int,
max_injury varchar(500),
driver_drinking varchar(500),
speeding varchar(500),
pre_event_movement varchar(500),
critical_event_precrash varchar(500)
)
FROM accident_project.vehicle_2013;


add FILE /data/205project/pyscripts/2012Vehicle.py;

insert into table vehicle PARTITION (year = '2012')
select TRANSFORM(
CaseNum, veh_no, '2012', numoccs, body_typ, mod_year, deformed, m_harm,
max_vsev, veh_alch, speedrel, trav_sp, p_crash1, p_crash2) 
using "python 2012Vehicle.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
num_occupants int,
body_type varchar(500),
model_year int,
extent_damage varchar(500),
most_harm_event varchar(500),
num_injury int,
max_injury varchar(500),
driver_drinking varchar(500),
speeding varchar(500),
pre_event_movement varchar(500),
critical_event_precrash varchar(500)
)
FROM accident_project.vehicle_2012;


add FILE /data/205project/pyscripts/2011Vehicle.py;

insert into table vehicle PARTITION (year = '2011')
select TRANSFORM(
CaseNum, veh_no, '2011', numoccs, body_typ, mod_year, deformed, m_harm,
max_vsev, veh_alch, speedrel, trav_sp, p_crash1, p_crash2) 
using "python 2011Vehicle.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
num_occupants int,
body_type varchar(500),
model_year int,
extent_damage varchar(500),
most_harm_event varchar(500),
num_injury int,
max_injury varchar(500),
driver_drinking varchar(500),
speeding varchar(500),
pre_event_movement varchar(500),
critical_event_precrash varchar(500)
)
FROM accident_project.vehicle_2011;


add FILE /data/205project/pyscripts/2010Vehicle.py;

insert into table vehicle PARTITION (year = '2010')
select TRANSFORM(
CaseNum, vehno, '2010', numoccs, body_typ, MODEL_YR, deformed, V_EVENT,
max_vsev, veh_alch, speedrel, trav_sp, p_crash1, p_crash2) 
using "python 2010Vehicle.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
num_occupants int,
body_type varchar(500),
model_year int,
extent_damage varchar(500),
most_harm_event varchar(500),
num_injury int,
max_injury varchar(500),
driver_drinking varchar(500),
speeding varchar(500),
pre_event_movement varchar(500),
critical_event_precrash varchar(500)
)
FROM accident_project.vehicle_2010;


add FILE /data/205project/pyscripts/2009Vehicle.py;
 
insert into table vehicle PARTITION (year = '2009')
select TRANSFORM(
CaseNum, vehno, '2009', numoccs, body_typ, MODEL_YR, deformed, V_EVENT,
max_vsev, veh_alch, speedrel, trav_sp, p_crash1, p_crash2) 
using "python 2009Vehicle.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
num_occupants int,
body_type varchar(500),
model_year int,
extent_damage varchar(500),
most_harm_event varchar(500),
num_injury int,
max_injury varchar(500),
driver_drinking varchar(500),
speeding varchar(500),
pre_event_movement varchar(500),
critical_event_precrash varchar(500)
)
FROM accident_project.vehicle_2009;
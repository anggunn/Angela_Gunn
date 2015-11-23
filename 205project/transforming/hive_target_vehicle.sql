USE accident_project;

DROP TABLE VEHICLE;
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
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


add file hdfs:///user/w205/accident_project/pyscripts/2013Vehicle.py;

insert into table vehicle PARTITION (year = '2013')
select TRANSFORM(
CaseNum, veh_no, '2013', numoccs, body_typ, mod_year, deformed, m_harm,
max_vsev, veh_alch, speedrel, trav_sp, p_crash1, p_crash2,ACC_TYPE) 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)

)
FROM accident_project.vehicle_2013;


add file hdfs:///user/w205/accident_project/pyscripts/2012Vehicle.py;

insert into table vehicle PARTITION (year = '2012')
select TRANSFORM(
CaseNum, veh_no, '2012', numoccs, body_typ, mod_year, deformed, m_harm,
max_vsev, veh_alch, speedrel, trav_sp, p_crash1, p_crash2,ACC_TYPE) 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2012;

add file hdfs:///user/w205/accident_project/pyscripts/2012Vehicle.py;


insert into table vehicle PARTITION (year = '2011')
select TRANSFORM(
CaseNum, veh_no, '2011', numoccs, body_typ, mod_year, deformed, m_harm,
max_vsev, veh_alch, speedrel, trav_sp, p_crash1, p_crash2,ACC_TYPE) 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2011;

add file hdfs:///user/w205/accident_project/pyscripts/2010Vehicle.py;


insert into table vehicle PARTITION (year = '2010')
select TRANSFORM(
CaseNum, VEHNO, '2010', numoccs, body_typ, MODEL_YR, deformed, V_EVENT,
max_vsev, veh_alch, speedrel, trav_sp, p_crash1, p_crash2,ACC_TYPE) 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2010;

add file hdfs:///user/w205/accident_project/pyscripts/2009Vehicle.py;

 
insert into table vehicle PARTITION (year = '2009')
select TRANSFORM(
CaseNum, vehno, '2009', numoccs, body_typ, MODEL_YR, deformed, V_EVENT,
max_vsev, veh_alch, speedrel, trav_sp, p_crash1, p_crash2,ACC_TYPE) 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2009;

add file hdfs:///user/w205/accident_project/pyscripts/2008Vehicle.py;

 
insert into table vehicle PARTITION (year = '2008')
select TRANSFORM(
CaseNum, vehno, '2008', numoccs, body_typ, MODEL_YR, VEH_SEV, V_EVENT,
max_vsev, veh_alch, speedrel, speed, p_crash1, p_crash2,ACC_TYPE) 
using "python 2008Vehicle.py" 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2008;

add file hdfs:///user/w205/accident_project/pyscripts/2007Vehicle.py;

 
insert into table vehicle PARTITION (year = '2007')
select TRANSFORM(
CaseNum, vehno, '2007', numoccs, body_typ, MODEL_YR, VEH_SEV, V_EVENT,
max_vsev, veh_alch, speedrel, speed, p_crash1, p_crash2,ACC_TYPE) 
using "python 2007Vehicle.py" 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2008;


add file hdfs:///user/w205/accident_project/pyscripts/2006Vehicle.py;

 
insert into table vehicle PARTITION (year = '2006')
select TRANSFORM(
CaseNum, vehno, '2006', numoccs, body_typ, MODEL_YR, VEH_SEV, V_EVENT,
max_vsev, veh_alch, speedrel, speed, p_crash1, p_crash2,ACC_TYPE) 
using "python 2006Vehicle.py" 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2006;


add file hdfs:///user/w205/accident_project/pyscripts/2005Vehicle.py;

 
insert into table vehicle PARTITION (year = '2005')
select TRANSFORM(
CaseNum, vehno, '2005', numoccs, body_typ, MODEL_YR, VEH_SEV, V_EVENT,
max_vsev, veh_alch, speedrel, speed, p_crash1, p_crash2,ACC_TYPE) 
using "python 2005Vehicle.py" 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2008;


add file hdfs:///user/w205/accident_project/pyscripts/2004Vehicle.py;

 
insert into table vehicle PARTITION (year = '2004')
select TRANSFORM(
CaseNum, vehno, '2004', numoccs, body_typ, MODEL_YR, VEH_SEV, V_EVENT,
max_vsev, veh_alch, speedrel, speed, p_crash1, p_crash2,ACC_TYPE) 
using "python 2004Vehicle.py" 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2004;


add file hdfs:///user/w205/accident_project/pyscripts/2003Vehicle.py;

 
insert into table vehicle PARTITION (year = '2003')
select TRANSFORM(
CaseNum, vehno, '2003', numoccs, body_typ, MODEL_YR, VEH_SEV, V_EVENT,
max_vsev, veh_alch, speedrel, speed, p_crash1, p_crash2,ACC_TYPE) 
using "python 2003Vehicle.py" 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2003;


add file hdfs:///user/w205/accident_project/pyscripts/2002Vehicle.py;

 
insert into table vehicle PARTITION (year = '2002')
select TRANSFORM(
CaseNum, vehno, '2002', numoccs, body_typ, MODEL_YR, VEH_SEV, V_EVENT,
max_vsev, veh_alch, speedrel, speed, p_crash1, p_crash2,ACC_TYPE) 
using "python 2002Vehicle.py" 
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
critical_event_precrash varchar(500),
accident_category varchar(500),
accident_type varchar(500)
)
FROM accident_project.vehicle_2002;



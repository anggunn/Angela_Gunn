USE accident_project;

DROP TABLE PERSON;
CREATE EXTERNAL TABLE PERSON
(
case_number varchar(500), 
vehicle_number int,
person_number int,
file_year int, 
age int,
sex varchar(500),
person_type varchar(500),
injury_severity varchar(500),
seating_row varchar(500),
seating_position varchar(500),
restraint_use varchar(500),
drinking varchar(500),
drugs varchar(500),
striking_vehicle_number int
)
PARTITIONED BY (year string) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/data/PERSON';


add FILE /data/205project/pyscripts/2013Person.py;

insert into table person PARTITION (year = '2013')
select TRANSFORM(
casenum, veh_no, per_no, 2013,
age, sex, per_typ, inj_sev, seat_pos, rest_use, 
drinking, drugs, str_veh) 
using "python 2013Person.py" 
as (
case_number varchar(500), 
vehicle_number int,
person_number int,
file_year int, 
age int,
sex varchar(500),
person_type varchar(500),
injury_severity varchar(500),
seating_row varchar(500),
seating_position varchar(500),
restraint_use varchar(500),
drinking varchar(500),
drugs varchar(500),
striking_vehicle_number int
)
FROM accident_project.person_2013;


add FILE /data/205project/pyscripts/2012Person.py;

insert into table person PARTITION (year = '2012')
select TRANSFORM(
casenum, veh_no, per_no, 2012,
age, sex, per_typ, inj_sev, seat_pos, rest_use, 
drinking, drugs, str_veh) 
using "python 2012Person.py" 
as (
case_number varchar(500), 
vehicle_number int,
person_number int,
file_year int, 
age int,
sex varchar(500),
person_type varchar(500),
injury_severity varchar(500),
seating_row varchar(500),
seating_position varchar(500),
restraint_use varchar(500),
drinking varchar(500),
drugs varchar(500),
striking_vehicle_number int
)
FROM accident_project.person_2012;


add FILE /data/205project/pyscripts/2011Person.py;

insert into table person PARTITION (year = '2011')
select TRANSFORM(
casenum, veh_no, per_no, 2011,
age, sex, per_typ, inj_sev, seat_pos, rest_use, 
drinking, drugs, str_veh) 
using "python 2011Person.py" 
as (
case_number varchar(500), 
vehicle_number int,
person_number int,
file_year int, 
age int,
sex varchar(500),
person_type varchar(500),
injury_severity varchar(500),
seating_row varchar(500),
seating_position varchar(500),
restraint_use varchar(500),
drinking varchar(500),
drugs varchar(500),
striking_vehicle_number int
)
FROM accident_project.person_2011;


add FILE /data/205project/pyscripts/2010Person.py;

insert into table person PARTITION (year = '2010')
select TRANSFORM(
casenum, vehno, perno, 2010,
age, sex, per_typ, inj_sev, seat_pos, rest_sys, 
per_alch, per_drug, str_veh) 
using "python 2010Person.py" 
as (
case_number varchar(500), 
vehicle_number int,
person_number int,
file_year int, 
age int,
sex varchar(500),
person_type varchar(500),
injury_severity varchar(500),
seating_row varchar(500),
seating_position varchar(500),
restraint_use varchar(500),
drinking varchar(500),
drugs varchar(500),
striking_vehicle_number int
)
FROM accident_project.person_2010;


add FILE /data/205project/pyscripts/2009Person.py;
 
insert into table person PARTITION (year = '2009')
select TRANSFORM(
casenum, vehno, perno, 2010,
age, sex, per_typ, inj_sev, seat_pos, rest_sys, 
per_alch, per_drug, str_veh) 
using "python 2009Person.py" 
as (
case_number varchar(500), 
vehicle_number int,
person_number int,
file_year int, 
age int,
sex varchar(500),
person_type varchar(500),
injury_severity varchar(500),
seating_row varchar(500),
seating_position varchar(500),
restraint_use varchar(500),
drinking varchar(500),
drugs varchar(500),
striking_vehicle_number int
)
FROM accident_project.person_2009;
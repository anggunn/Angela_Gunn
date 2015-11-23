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
casenum, vehno, perno, 2009,
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

add FILE /data/205project/pyscripts/2008Person.py;
 
insert into table person PARTITION (year = '2008')
select TRANSFORM(
casenum, vehno, perno, 2008,
age, sex, per_typ, inj_sev, seat_pos, rest_sys, 
per_alch, per_drug, str_veh) 
using "python 2008Person.py" 
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
FROM accident_project.person_2008;

add FILE /data/205project/pyscripts/2007Person.py;
 
insert into table person PARTITION (year = '2007')
select TRANSFORM(
casenum, vehno, perno, 2007,
age, sex, per_type, inj_sev, seat_pos, rest_sys, 
per_alch, per_drug, str_veh) 
using "python 2007Person.py" 
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
FROM accident_project.person_2007;


add FILE /data/205project/pyscripts/2006Person.py;
 
insert into table person PARTITION (year = '2006')
select TRANSFORM(
casenum, vehno, perno, 2006,
age, sex, per_type, inj_sev, seat_pos, rest_sys, 
per_alch, per_drug, str_veh) 
using "python 2006Person.py" 
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
FROM accident_project.person_2006;


add FILE /data/205project/pyscripts/2005Person.py;
 
insert into table person PARTITION (year = '2005')
select TRANSFORM(
casenum, vehno, perno, 2005,
age, sex, per_type, inj_sev, seat_pos, rest_sys, 
per_alch, per_drug, str_veh) 
using "python 2005Person.py" 
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
FROM accident_project.person_2005;


add FILE /data/205project/pyscripts/2004Person.py;
 
insert into table person PARTITION (year = '2004')
select TRANSFORM(
casenum, vehno, perno, 2004,
age, sex, per_type, inj_sev, seat_pos, rest_sys, 
per_alch, per_drug, str_veh) 
using "python 2004Person.py" 
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
FROM accident_project.person_2004;


add FILE /data/205project/pyscripts/2003Person.py;
 
insert into table person PARTITION (year = '2003')
select TRANSFORM(
casenum, vehno, perno, 2003,
age, sex, per_type, inj_sev, seat_pos, rest_sys, 
per_alch, per_drug, str_veh) 
using "python 2003Person.py" 
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
FROM accident_project.person_2003;


add FILE /data/205project/pyscripts/2002Person.py;
 
insert into table person PARTITION (year = '2002')
select TRANSFORM(
casenum, vehno, perno, 2002,
age, sex, per_type, inj_sev, seat_pos, rest_sys, 
per_alch, per_drug, str_veh) 
using "python 2002Person.py" 
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
FROM accident_project.person_2002;


USE accident_project;

DROP TABLE DISTRACT;
CREATE EXTERNAL TABLE DISTRACT
(
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
PARTITIONED BY (year string) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/data/DISTRACT';


add FILE /data/205project/pyscripts/2013Distract.py;

insert into table distract PARTITION (year = '2013')
select TRANSFORM(
CaseNum, veh_no, '2013', MDRDSTRD) 
using "python 2013Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2013;

add FILE /data/205project/pyscripts/2012Distract.py;

insert into table distract PARTITION (year = '2012')
select TRANSFORM(
CaseNum, veh_no, '2012', MDRDSTRD) 
using "python 2012Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2012;


add FILE /data/205project/pyscripts/2011Distract.py;

insert into table distract PARTITION (year = '2011')
select TRANSFORM(
CaseNum, veh_no, '2011', MDRDSTRD) 
using "python 2011Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2011;


add FILE /data/205project/pyscripts/2010Distract.py;

insert into table distract PARTITION (year = '2010')
select TRANSFORM(
CaseNum, vehno, '2010', MDRDSTRD) 
using "python 2010Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2010;


add FILE /data/205project/pyscripts/2009Distract.py;

insert into table distract PARTITION (year = '2009')
select TRANSFORM(
CaseNum, vehno, '2009', MDRDSTRD) 
using "python 2009Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2009;

add FILE /data/205project/pyscripts/2008Distract.py;

insert into table distract PARTITION (year = '2008')
select TRANSFORM(
CaseNum, vehno, '2008', MDRDSTRD) 
using "python 2008Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2008;



add FILE /data/205project/pyscripts/2007Distract.py;

insert into table distract PARTITION (year = '2007')
select TRANSFORM(
CaseNum, vehno, '2007', MDRDSTRD) 
using "python 2007Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2007;



add FILE /data/205project/pyscripts/2006Distract.py;

insert into table distract PARTITION (year = '2006')
select TRANSFORM(
CaseNum, vehno, '2006', MDRDSTRD) 
using "python 2006Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2006;


add FILE /data/205project/pyscripts/2005Distract.py;

insert into table distract PARTITION (year = '2005')
select TRANSFORM(
CaseNum, vehno, '2005', MDRDSTRD) 
using "python 2005Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2005;


add FILE /data/205project/pyscripts/2004Distract.py;

insert into table distract PARTITION (year = '2004')
select TRANSFORM(
CaseNum, vehno, '2004', MDRDSTRD) 
using "python 2004Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2004;


add FILE /data/205project/pyscripts/2003Distract.py;

insert into table distract PARTITION (year = '2003')
select TRANSFORM(
CaseNum, vehno, '2003', MDRDSTRD) 
using "python 2003Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2003;



add FILE /data/205project/pyscripts/2002Distract.py;

insert into table distract PARTITION (year = '2002')
select TRANSFORM(
CaseNum, vehno, '2002', MDRDSTRD) 
using "python 2002Distract.py" 
as (
case_number varchar(500), 
vehicle_number int,
file_year int, 
factor varchar(500)
)
FROM accident_project.distract_2002;
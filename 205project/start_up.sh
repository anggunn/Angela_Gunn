#!/bin/bash

#Make directories for project
mkdir accident_project
mkdir accident_project/raw_data

hdfs dfs -rm -R /user/w205/accident_project
hdfs dfs -mkdir /user/w205/accident_project

#load data
chmod 755 loading_and_modelling/*.sh

./loading_and_modelling/load_data_2013.sh
./loading_and_modelling/load_data_2012.sh
./loading_and_modelling/load_data_2011.sh
./loading_and_modelling/load_data_2010.sh
./loading_and_modelling/load_data_2009.sh
./loading_and_modelling/load_data_2008.sh
./loading_and_modelling/load_data_2007.sh
./loading_and_modelling/load_data_2006.sh
./loading_and_modelling/load_data_2005.sh
./loading_and_modelling/load_data_2004.sh
./loading_and_modelling/load_data_2003.sh
./loading_and_modelling/load_data_2002.sh


#Hive table definitions

hive -f loading_and_modelling/2013_hive_base_tables.sql
hive -f loading_and_modelling/2012_hive_base_tables.sql
hive -f loading_and_modelling/2011_hive_base_tables.sql
hive -f loading_and_modelling/2010_hive_base_tables.sql
hive -f loading_and_modelling/2009_hive_base_tables.sql
hive -f loading_and_modelling/2008_hive_base_tables.sql
hive -f loading_and_modelling/2007_hive_base_tables.sql
hive -f loading_and_modelling/2006_hive_base_tables.sql
hive -f loading_and_modelling/2005_hive_base_tables.sql
hive -f loading_and_modelling/2004_hive_base_tables.sql
hive -f loading_and_modelling/2003_hive_base_tables.sql
hive -f loading_and_modelling/2002_hive_base_tables.sql

hdfs dfs -mkdir /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2013Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2013Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2013Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2013Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2012Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2012Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2012Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2012Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2011Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2011Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2011Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2011Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2010Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2010Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2010Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2010Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2009Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2009Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2009Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2009Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2008Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2008Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2008Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2008Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2007Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2007Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2007Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2007Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2006Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2006Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2006Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2006Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2005Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2005Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2005Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2005Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2004Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2004Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2004Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2004Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2003Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2003Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2003Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2003Vehicle.py /user/w205/accident_project/pyscripts

hdfs dfs -put transforming/2002Accident.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2002Distract.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2002Person.py /user/w205/accident_project/pyscripts
hdfs dfs -put transforming/2002Vehicle.py /user/w205/accident_project/pyscripts


#hive -f transforming/hive_target_accident.sql
#hive -f transforming/hive_target_distract.sql
#hive -f transforming/hive_target_person.sql
#hive -f transforming/hive_target_vehicle.sql
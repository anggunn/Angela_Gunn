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

#hive -f transforming/hive_target_accident.sql
#hive -f transforming/hive_target_distract.sql
#hive -f transforming/hive_target_person.sql
#hive -f transforming/hive_target_vehicle.sql
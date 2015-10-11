#!/bin/bash
# load data
# assumes zip file is named Hospital_Revised_Flatfiles.zip
# assumes user is w205

# unzip required files
unzip Hospital_Revised_Flatfiles.zip "Hospital General Information.csv"
unzip Hospital_Revised_Flatfiles.zip "Timely and Effective Care - Hospital.csv"
unzip Hospital_Revised_Flatfiles.zip "Readmissions and Deaths - Hospital.csv"
unzip Hospital_Revised_Flatfiles.zip "Measure Dates.csv"
unzip Hospital_Revised_Flatfiles.zip "hvbp_hcahps_05_28_2015.csv"

# removed headers
tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 "Measure Dates.csv" > Measure_Dates.csv
tail -n +2 "hvbp_hcahps_05_28_2015.csv" > surveys_responses.csv

# remove unwanted files
rm "Hospital General Information.csv"
rm "Timely and Effective Care - Hospital.csv"
rm "Readmissions and Deaths - Hospital.csv"
rm "Measure Dates.csv"
rm "hvbp_hcahps_05_28_2015.csv"

# make project directory
hdfs dfs -mkdir /user/w205/hospital_compare

# put files there
hdfs dfs -put /data/hospital_compare/data/hospitals.csv /user/w205/hospital_compare/
hdfs dfs -put /data/hospital_compare/data/effective_care.csv /user/w205/hospital_compare/
hdfs dfs -put /data/hospital_compare/data/readmissions.csv /user/w205/hospital_compare/
hdfs dfs -put /data/hospital_compare/data/Measure_Dates.csv /user/w205/hospital_compare/
hdfs dfs -put /data/hospital_compare/data/surveys_responses.csv /user/w205/hospital_compare/

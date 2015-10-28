#!/bin/bash
# load data

rm -R hospital_data
mkdir hospital_datan

cd hospital_data

wget -O Hospital_Revised_Flatfiles.zip "https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"

# unzip required files
unzip Hospital_Revised_Flatfiles.zip "Hospital General Information.csv"
unzip Hospital_Revised_Flatfiles.zip "Timely and Effective Care - Hospital.csv"
unzip Hospital_Revised_Flatfiles.zip "Readmissions and Deaths - Hospital.csv"
unzip Hospital_Revised_Flatfiles.zip "Measure Dates.csv"
unzip Hospital_Revised_Flatfiles.zip "hvbp_hcahps_05_28_2015.csv"

# removed headers
tail -n +2 "Hospital General Information.csv" > stage_hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > stage_effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > stage_readmissions.csv
tail -n +2 "Measure Dates.csv" > stage_measure_dates.csv
tail -n +2 "hvbp_hcahps_05_28_2015.csv" > stage_surveys_responses.csv

# remove unwanted files
rm "Hospital General Information.csv"
rm "Timely and Effective Care - Hospital.csv"
rm "Readmissions and Deaths - Hospital.csv"
rm "Measure Dates.csv"
rm "hvbp_hcahps_05_28_2015.csv"

# make project directory
hdfs dfs -rm -R /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare

# put files there
hdfs dfs -mkdir /user/w205/hospital_compare/stage_hospitals
hdfs dfs -put /data/hospital_compare/loading_and_modeling/hospital_data/stage_hospitals.csv /user/w205/hospital_compare/stage_hospitals/
hdfs dfs -mkdir /user/w205/hospital_compare/stage_effective_care
hdfs dfs -put /data/hospital_compare/loading_and_modeling/hospital_data/stage_effective_care.csv /user/w205/hospital_compare/stage_effective_care/
hdfs dfs -mkdir /user/w205/hospital_compare/stage_readmissions
hdfs dfs -put /data/hospital_compare/loading_and_modeling/hospital_data/stage_readmissions.csv /user/w205/hospital_compare/stage_readmissions/
hdfs dfs -mkdir /user/w205/hospital_compare/stage_measure_dates
hdfs dfs -put /data/hospital_compare/loading_and_modeling/hospital_data/stage_measure_dates.csv /user/w205/hospital_compare/stage_measure_dates/
hdfs dfs -mkdir /user/w205/hospital_compare/stage_survey_responses
hdfs dfs -put /data/hospital_compare/loading_and_modeling/hospital_data/stage_surveys_responses.csv /user/w205/hospital_compare/stage_survey_responses/

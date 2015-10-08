#!/bin/bash
#loading data lake
#assumes in directory with the Hospital_Revised_Flatfiles.zip file

unzip Hospital_Revised_Flatfiles.zip "Hospital General Information.csv"
unzip Hospital_Revised_Flatfiles.zip "Timely and Effective Care - Hospital.csv"
unzip Hospital_Revised_Flatfiles.zip "Readmissions and Deaths - Hospital.csv"
unzip Hospital_Revised_Flatfiles.zip "Measure Dates.csv"
unzip Hospital_Revised_Flatfiles.zip "hvbp_hcahps_05_28_2015.csv"

tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 "Measure Dates.csv" > Measure_Dates.csv
tail -n +2 "hvbp_hcahps_05_28_2015.csv" > surveys_responses.csv

rm "Hospital General Information.csv"
rm "Timely and Effective Care - Hospital.csv"
rm "Readmissions and Deaths - Hospital.csv"
rm "Measure Dates.csv"
rm "hvbp_hcahps_05_28_2015.csv"

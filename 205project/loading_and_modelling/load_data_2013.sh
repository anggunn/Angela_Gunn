cd accident_project/raw_data

#2013

# unzip required files
unzip GES13.zip "ACCIDENT.TXT" 
unzip GES13.zip "PERSON.TXT" 
unzip GES13.zip "DISTRACT.TXT" 
unzip GES13.zip "PARKWORK.TXT" 
unzip GES13.zip "VEHICLE.TXT" 

# remove headers
tail -n +2 "ACCIDENT.TXT" > 2013_accident.txt
tail -n +2 "PERSON.TXT" > 2013_person.txt
tail -n +2 "DISTRACT.TXT" > 2013_distract.txt
tail -n +2 "PARKWORK.TXT" > 2013_parkwork.txt
tail -n +2 "VEHICLE.TXT" > 2013_vehicle.txt

#remove unneeded files
rm ACCIDENT.TXT 
rm PERSON.TXT 
rm DISTRACT.TXT 
rm PARKWORK.TXT 
rm VEHICLE.TXT 


# create 2013 directory
hdfs dfs -rm -R /user/w205/accident_project/2013
hdfs dfs -mkdir /user/w205/accident_project/2013
 

hdfs dfs -mkdir /user/w205/accident_project/2013/ACCIDENT
hdfs dfs -put 2013_accident.txt /user/w205/accident_project/2013/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2013/PERSON
hdfs dfs -put 2013_person.txt /user/w205/accident_project/2013/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2013/DISTRACT
hdfs dfs -put 2013_distract.txt /user/w205/accident_project/2013/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2013/PARKWORK
hdfs dfs -put 2013_parkwork.txt /user/w205/accident_project/2013/PARKWORK
hdfs dfs -mkdir /user/w205/accident_project/2013/VEHICLE
hdfs dfs -put 2013_vehicle.txt /user/w205/accident_project/2013/VEHICLE


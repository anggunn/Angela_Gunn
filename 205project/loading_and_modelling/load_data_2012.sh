cd accident_project/raw_data

#2012


wget https://s3-us-west-2.amazonaws.com/accident-project/2012/ACCIDENT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2012/DISTRACT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2012/PARKWORK.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2012/PERSON.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2012/VEHICLE.TXT

# remove headers
tail -n +2 "ACCIDENT.TXT" > 2012_accident.txt
tail -n +2 "PERSON.TXT" > 2012_person.txt
tail -n +2 "DISTRACT.TXT" > 2012_distract.txt
tail -n +2 "PARKWORK.TXT" > 2012_parkwork.txt
tail -n +2 "VEHICLE.TXT" > 2012_vehicle.txt

#remove unneeded files
rm ACCIDENT.TXT 
rm PERSON.TXT 
rm DISTRACT.TXT 
rm PARKWORK.TXT 
rm VEHICLE.TXT 


# create 2012 directory
hdfs dfs -rm -R /user/w205/accident_project/2012
hdfs dfs -mkdir /user/w205/accident_project/2012
 

hdfs dfs -mkdir /user/w205/accident_project/2012/ACCIDENT
hdfs dfs -put 2012_accident.txt /user/w205/accident_project/2012/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2012/PERSON
hdfs dfs -put 2012_person.txt /user/w205/accident_project/2012/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2012/DISTRACT
hdfs dfs -put 2012_distract.txt /user/w205/accident_project/2012/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2012/PARKWORK
hdfs dfs -put 2012_parkwork.txt /user/w205/accident_project/2012/PARKWORK
hdfs dfs -mkdir /user/w205/accident_project/2012/VEHICLE
hdfs dfs -put 2012_vehicle.txt /user/w205/accident_project/2012/VEHICLE

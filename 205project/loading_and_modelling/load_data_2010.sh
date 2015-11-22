cd accident_project/raw_data

#2010




wget https://s3-us-west-2.amazonaws.com/accident-project/2010/ACCIDENT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2010/DISTRACT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2010/PARKED.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2010/PERSON.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2010/VEHICLE.TXT



# remove headers

# remove headers
tail -n +2 "ACCIDENT.TXT" > 2010_accident.txt     
tail -n +2 "DISTRACT.TXT" > 2010_distract.txt          
tail -n +2 "PARKED.TXT" > 2010_parked.txt            
tail -n +2 "PERSON.TXT" > 2010_person.txt                
tail -n +2 "VEHICLE.TXT" > 2010_vehicle.txt      


# create 2010 directory
hdfs dfs -rm -R /user/w205/accident_project/2010
hdfs dfs -mkdir /user/w205/accident_project/2010
 

hdfs dfs -mkdir /user/w205/accident_project/2010/ACCIDENT
hdfs dfs -put 2010_accident.txt /user/w205/accident_project/2010/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2010/DISTRACT
hdfs dfs -put 2010_distract.txt /user/w205/accident_project/2010/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2010/PARKED
hdfs dfs -put 2010_parked.txt /user/w205/accident_project/2010/PARKED
hdfs dfs -mkdir /user/w205/accident_project/2010/PERSON
hdfs dfs -put 2010_person.txt /user/w205/accident_project/2010/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2010/VEHICLE
hdfs dfs -put 2010_vehicle.txt /user/w205/accident_project/2010/VEHICLE



#remove unneeded files
rm -R TXT



cd accident_project/raw_data

#2002



wget https://s3-us-west-2.amazonaws.com/accident-project/2002/ACCIDENT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2002/DISTRACT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2002/PERSON.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2002/VEHICLE.TXT




# remove headers
   
tail -n +2  "ACCIDENT.TXT" > 2002_accident.txt     
tail -n +2  "DISTRACT.TXT" > 2002_distract.txt      
tail -n +2  "PERSON.TXT" > 2002_person.txt      
tail -n +2  "VEHICLE.TXT" > 2002_vehicle.txt     


#remove unneeded files
rm ACCIDENT.TXT            
rm DISTRACT.TXT            
rm PERSON.TXT              
rm VEHICLE.TXT     

# create 2002 directory
hdfs dfs -rm -R /user/w205/accident_project/2002
hdfs dfs -mkdir /user/w205/accident_project/2002
 

hdfs dfs -mkdir /user/w205/accident_project/2002/ACCIDENT
hdfs dfs -put 2002_accident.txt /user/w205/accident_project/2002/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2002/DISTRACT
hdfs dfs -put 2002_distract.txt /user/w205/accident_project/2002/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2002/PERSON
hdfs dfs -put 2002_person.txt /user/w205/accident_project/2002/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2002/VEHICLE
hdfs dfs -put 2002_vehicle.txt /user/w205/accident_project/2002/VEHICLE



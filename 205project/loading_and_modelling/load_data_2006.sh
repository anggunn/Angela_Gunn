cd accident_project/raw_data

#2006



wget https://s3-us-west-2.amazonaws.com/accident-project/2006/ACCIDENT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2006/DISTRACT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2006/PARKED.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2006/PERSON.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2006/VEHICLE.TXT




# remove headers
   
tail -n +2  "ACCIDENT.TXT" > 2006_accident.txt     
tail -n +2  "DISTRACT.TXT" > 2006_distract.txt      
tail -n +2  "PARKED.TXT" > 2006_parked.txt           
tail -n +2  "PERSON.TXT" > 2006_person.txt      
tail -n +2  "VEHICLE.TXT" > 2006_vehicle.txt     


#remove unneeded files
rm ACCIDENT.TXT            
rm DISTRACT.TXT            
rm PARKED.TXT             
rm PERSON.TXT              
rm VEHICLE.TXT     

# create 2006 directory
hdfs dfs -rm -R /user/w205/accident_project/2006
hdfs dfs -mkdir /user/w205/accident_project/2006
 

hdfs dfs -mkdir /user/w205/accident_project/2006/ACCIDENT
hdfs dfs -put 2006_accident.txt /user/w205/accident_project/2006/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2006/DISTRACT
hdfs dfs -put 2006_distract.txt /user/w205/accident_project/2006/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2006/PARKED
hdfs dfs -put 2006_parked.txt /user/w205/accident_project/2006/PARKED
hdfs dfs -mkdir /user/w205/accident_project/2006/PERSON
hdfs dfs -put 2006_person.txt /user/w205/accident_project/2006/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2006/VEHICLE
hdfs dfs -put 2006_vehicle.txt /user/w205/accident_project/2006/VEHICLE



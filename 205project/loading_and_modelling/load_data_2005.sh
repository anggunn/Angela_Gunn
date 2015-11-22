cd accident_project/raw_data

#2005



wget https://s3-us-west-2.amazonaws.com/accident-project/2005/ACCIDENT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2005/DISTRACT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2005/PARKED.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2005/PERSON.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2005/VEHICLE.TXT




# remove headers
   
tail -n +2  "ACCIDENT.TXT" > 2005_accident.txt     
tail -n +2  "DISTRACT.TXT" > 2005_distract.txt      
tail -n +2  "PARKED.TXT" > 2005_parked.txt           
tail -n +2  "PERSON.TXT" > 2005_person.txt      
tail -n +2  "VEHICLE.TXT" > 2005_vehicle.txt     


#remove unneeded files
rm ACCIDENT.TXT            
rm DISTRACT.TXT            
rm PARKED.TXT             
rm PERSON.TXT              
rm VEHICLE.TXT     

# create 2005 directory
hdfs dfs -rm -R /user/w205/accident_project/2005
hdfs dfs -mkdir /user/w205/accident_project/2005
 

hdfs dfs -mkdir /user/w205/accident_project/2005/ACCIDENT
hdfs dfs -put 2005_accident.txt /user/w205/accident_project/2005/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2005/DISTRACT
hdfs dfs -put 2005_distract.txt /user/w205/accident_project/2005/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2005/PARKED
hdfs dfs -put 2005_parked.txt /user/w205/accident_project/2005/PARKED
hdfs dfs -mkdir /user/w205/accident_project/2005/PERSON
hdfs dfs -put 2005_person.txt /user/w205/accident_project/2005/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2005/VEHICLE
hdfs dfs -put 2005_vehicle.txt /user/w205/accident_project/2005/VEHICLE



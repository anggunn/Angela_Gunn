cd accident_project/raw_data

#2004



wget https://s3-us-west-2.amazonaws.com/accident-project/2004/ACCIDENT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2004/DISTRACT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2004/PERSON.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2004/VEHICLE.TXT




# remove headers
   
tail -n +2  "ACCIDENT.TXT" > 2004_accident.txt     
tail -n +2  "DISTRACT.TXT" > 2004_distract.txt      
tail -n +2  "PERSON.TXT" > 2004_person.txt      
tail -n +2  "VEHICLE.TXT" > 2004_vehicle.txt     


#remove unneeded files
rm ACCIDENT.TXT            
rm DISTRACT.TXT            
rm PERSON.TXT              
rm VEHICLE.TXT     

# create 2004 directory
hdfs dfs -rm -R /user/w205/accident_project/2004
hdfs dfs -mkdir /user/w205/accident_project/2004
 

hdfs dfs -mkdir /user/w205/accident_project/2004/ACCIDENT
hdfs dfs -put 2004_accident.txt /user/w205/accident_project/2004/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2004/DISTRACT
hdfs dfs -put 2004_distract.txt /user/w205/accident_project/2004/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2004/PERSON
hdfs dfs -put 2004_person.txt /user/w205/accident_project/2004/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2004/VEHICLE
hdfs dfs -put 2004_vehicle.txt /user/w205/accident_project/2004/VEHICLE



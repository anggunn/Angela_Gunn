cd accident_project/raw_data

#2003



wget https://s3-us-west-2.amazonaws.com/accident-project/2003/ACCIDENT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2003/DISTRACT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2003/PERSON.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2003/VEHICLE.TXT




# remove headers
   
tail -n +2  "ACCIDENT.TXT" > 2003_accident.txt     
tail -n +2  "DISTRACT.TXT" > 2003_distract.txt      
tail -n +2  "PERSON.TXT" > 2003_person.txt      
tail -n +2  "VEHICLE.TXT" > 2003_vehicle.txt     


#remove unneeded files
rm ACCIDENT.TXT            
rm DISTRACT.TXT            
rm PERSON.TXT              
rm VEHICLE.TXT     

# create 2003 directory
hdfs dfs -rm -R /user/w205/accident_project/2003
hdfs dfs -mkdir /user/w205/accident_project/2003
 

hdfs dfs -mkdir /user/w205/accident_project/2003/ACCIDENT
hdfs dfs -put 2003_accident.txt /user/w205/accident_project/2003/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2003/DISTRACT
hdfs dfs -put 2003_distract.txt /user/w205/accident_project/2003/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2003/PERSON
hdfs dfs -put 2003_person.txt /user/w205/accident_project/2003/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2003/VEHICLE
hdfs dfs -put 2003_vehicle.txt /user/w205/accident_project/2003/VEHICLE



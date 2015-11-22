cd accident_project/raw_data

#2007



wget https://s3-us-west-2.amazonaws.com/accident-project/2007/ACCIDENT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2007/DISTRACT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2007/PARKED.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2007/PERSON.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2007/VEHICLE.TXT




# remove headers
   
tail -n +2  "ACCIDENT.TXT" > 2007_accident.txt     
tail -n +2  "DISTRACT.TXT" > 2007_distract.txt      
tail -n +2  "PARKED.TXT" > 2007_parked.txt           
tail -n +2  "PERSON.TXT" > 2007_person.txt      
tail -n +2  "VEHICLE.TXT" > 2007_vehicle.txt     


#remove unneeded files
rm ACCIDENT.TXT            
rm DISTRACT.TXT            
rm PARKED.TXT             
rm PERSON.TXT              
rm VEHICLE.TXT     

# create 2007 directory
hdfs dfs -rm -R /user/w205/accident_project/2007
hdfs dfs -mkdir /user/w205/accident_project/2007
 

hdfs dfs -mkdir /user/w205/accident_project/2007/ACCIDENT
hdfs dfs -put 2007_accident.txt /user/w205/accident_project/2007/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2007/DISTRACT
hdfs dfs -put 2007_distract.txt /user/w205/accident_project/2007/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2007/PARKED
hdfs dfs -put 2007_parked.txt /user/w205/accident_project/2007/PARKED
hdfs dfs -mkdir /user/w205/accident_project/2007/PERSON
hdfs dfs -put 2007_person.txt /user/w205/accident_project/2007/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2007/VEHICLE
hdfs dfs -put 2007_vehicle.txt /user/w205/accident_project/2007/VEHICLE



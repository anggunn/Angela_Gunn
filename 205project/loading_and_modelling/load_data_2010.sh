cd accident_project/raw_data

#2010

# unzip required files
 
unzip GES10.zip "TXT/ACCIDENT.TXT"       
unzip GES10.zip "TXT/DISTRACT.TXT"        
unzip GES10.zip "TXT/PARKED.TXT"          
unzip GES10.zip "TXT/PERSON.TXT"      
unzip GES10.zip "TXT/VEHICLE.TXT"     

# remove headers


tail -n +2  "TXT/ACCIDENT.TXT" > 2010_accident.txt      
tail -n +2  "TXT/DISTRACT.TXT" > 2010_distract.txt       
tail -n +2  "TXT/PARKED.TXT" > 2010_parked.txt            
tail -n +2  "TXT/PERSON.TXT" > 2010_person.txt        
tail -n +2  "TXT/VEHICLE.TXT" > 2010_vehicle.txt     


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



cd accident_project/raw_data

#2008



wget https://s3-us-west-2.amazonaws.com/accident-project/2008/ACCIDENT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2008/DISTRACT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2008/PARKED.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2008/PERSON.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2008/VEHICLE.TXT



# unzip required files
#unzip GES08.zip "ACCIDENT.TXT"        
#unzip GES08.zip "DISTRACT.TXT"    
#unzip GES08.zip "PARKED.TXT"          
#unzip GES08.zip "PERSON.TXT"      
#unzip GES08.zip "VEHICLE.TXT"    

# remove headers
   
tail -n +2  "ACCIDENT.TXT" > 2008_accident.txt     
tail -n +2  "DISTRACT.TXT" > 2008_distract.txt      
tail -n +2  "PARKED.TXT" > 2008_parked.txt           
tail -n +2  "PERSON.TXT" > 2008_person.txt      
tail -n +2  "VEHICLE.TXT" > 2008_vehicle.txt     


#remove unneeded files
rm ACCIDENT.TXT            
rm DISTRACT.TXT            
rm PARKED.TXT             
rm PERSON.TXT              
rm VEHICLE.TXT     

# create 2008 directory
hdfs dfs -rm -R /user/w205/accident_project/2008
hdfs dfs -mkdir /user/w205/accident_project/2008
 

hdfs dfs -mkdir /user/w205/accident_project/2008/ACCIDENT
hdfs dfs -put 2008_accident.txt /user/w205/accident_project/2008/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2008/DISTRACT
hdfs dfs -put 2008_distract.txt /user/w205/accident_project/2008/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2008/PARKED
hdfs dfs -put 2008_parked.txt /user/w205/accident_project/2008/PARKED
hdfs dfs -mkdir /user/w205/accident_project/2008/PERSON
hdfs dfs -put 2008_person.txt /user/w205/accident_project/2008/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2008/VEHICLE
hdfs dfs -put 2008_vehicle.txt /user/w205/accident_project/2008/VEHICLE



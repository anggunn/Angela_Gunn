cd accident_project/raw_data

#2009

# unzip required files
       
unzip GES09.zip "ACCIDENT.TXT"        
unzip GES09.zip "DISTRACT.TXT"    
unzip GES09.zip "PARKED.TXT"          
unzip GES09.zip "PERSON.TXT"      
unzip GES09.zip "VEHICLE.TXT"    

# remove headers
   
tail -n +2  "ACCIDENT.TXT" > 2009_accident.txt     
tail -n +2  "DISTRACT.TXT" > 2009_distract.txt      
tail -n +2  "PARKED.TXT" > 2009_parked.txt           
tail -n +2  "PERSON.TXT" > 2009_person.txt      
tail -n +2  "VEHICLE.TXT" > 2009_vehicle.txt     


#remove unneeded files
rm ACCIDENT.TXT            
rm DISTRACT.TXT            
rm PARKED.TXT             
rm PERSON.TXT              
rm VEHICLE.TXT     

# create 2009 directory
hdfs dfs -rm -R /user/w205/accident_project/2009
hdfs dfs -mkdir /user/w205/accident_project/2009
 

hdfs dfs -mkdir /user/w205/accident_project/2009/ACCIDENT
hdfs dfs -put 2009_accident.txt /user/w205/accident_project/2009/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2009/DISTRACT
hdfs dfs -put 2009_distract.txt /user/w205/accident_project/2009/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2009/PARKED
hdfs dfs -put 2009_parked.txt /user/w205/accident_project/2009/PARKED
hdfs dfs -mkdir /user/w205/accident_project/2009/PERSON
hdfs dfs -put 2009_person.txt /user/w205/accident_project/2009/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2009/VEHICLE
hdfs dfs -put 2009_vehicle.txt /user/w205/accident_project/2009/VEHICLE



cd accident_project/raw_data

#2011



wget https://s3-us-west-2.amazonaws.com/accident-project/2011/ACCIDENT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2011/DISTRACT.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2011/PARKWORK.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2011/PERSON.TXT
wget https://s3-us-west-2.amazonaws.com/accident-project/2011/VEHICLE.TXT



# remove headers
tail -n +2 "ACCIDENT.TXT" > 2011_accident.txt     
tail -n +2 "DISTRACT.TXT" > 2011_distract.txt          
tail -n +2 "PARKWORK.TXT" > 2011_parkwork.txt            
tail -n +2 "PERSON.TXT" > 2011_person.txt                
tail -n +2 "VEHICLE.TXT" > 2011_vehicle.txt      


#remove unneeded files
rm ACCIDENT.TXT           
rm DISTRACT.TXT             
rm PARKWORK.TXT            
rm PERSON.TXT             
rm VEHICLE.TXT    


# create 2011 directory
hdfs dfs -rm -R /user/w205/accident_project/2011
hdfs dfs -mkdir /user/w205/accident_project/2011
 

hdfs dfs -mkdir /user/w205/accident_project/2011/ACCIDENT
hdfs dfs -put 2011_accident.txt /user/w205/accident_project/2011/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2011/DISTRACT
hdfs dfs -put 2011_distract.txt /user/w205/accident_project/2011/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2011/PARKWORK
hdfs dfs -put 2011_parkwork.txt /user/w205/accident_project/2011/PARKWORK
hdfs dfs -mkdir /user/w205/accident_project/2011/PERSON
hdfs dfs -put 2011_person.txt /user/w205/accident_project/2011/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2011/VEHICLE
hdfs dfs -put 2011_vehicle.txt /user/w205/accident_project/2011/VEHICLE






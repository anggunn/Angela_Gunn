cd accident_project/raw_data

#2008

# unzip required files
       
unzip GES08.zip "VISION.TXT" 
unzip GES08.zip "ACCIDENT.TXT"        
unzip GES08.zip "BIKETRAF.TXT"        
unzip GES08.zip "DISTRACT.TXT"  
unzip GES08.zip "EVENT.TXT"      
unzip GES08.zip "FACTOR.TXT"          
unzip GES08.zip "IMPAIR.TXT"          
unzip GES08.zip "MANEUVER.TXT"        
unzip GES08.zip "NMACTION.TXT"        
unzip GES08.zip "PARKED.TXT"          
unzip GES08.zip "PARKEVNT.TXT"        
unzip GES08.zip "PERSON.TXT"          
unzip GES08.zip "SAFETYEQ.TXT"
unzip GES08.zip "TRAFCON.TXT"
unzip GES08.zip "VEHICLE.TXT"         
unzip GES08.zip "VIOLATN.TXT"   

# remove headers
   
tail -n +2  "VISION.TXT" > 2008_vision.txt 
tail -n +2  "ACCIDENT.TXT" > 2008_accident.txt        
tail -n +2  "BIKETRAF.TXT" > 2008_biketraf.txt      
tail -n +2  "DISTRACT.TXT" > 2008_distract.txt        
tail -n +2  "EVENT.TXT" > 2008_event.txt            
tail -n +2  "FACTOR.TXT" > 2008_factor.txt          
tail -n +2  "IMPAIR.TXT" > 2008_impair.txt          
tail -n +2  "MANEUVER.TXT" > 2008_maneuver.txt        
tail -n +2  "NMACTION.TXT" > 2008_nmaction.txt       
tail -n +2  "PARKED.TXT" > 2008_parked.txt          
tail -n +2  "PARKEVNT.TXT" > 2008_parkevnt.txt        
tail -n +2  "PERSON.TXT" > 2008_person.txt          
tail -n +2  "SAFETYEQ.TXT" > 2008_safetyeq.txt      
tail -n +2  "TRAFCON.TXT" > 2008_trafcon.txt
tail -n +2  "VEHICLE.TXT" > 2008_vehicle.txt        
tail -n +2  "VIOLATN.TXT" > 2008_violatn.txt     


#remove unneeded files
rm VISION.TXT              
rm ACCIDENT.TXT            
rm BIKETRAF.TXT            
rm DISTRACT.TXT            
rm EVENT.TXT               
rm FACTOR.TXT              
rm IMPAIR.TXT              
rm MANEUVER.TXT            
rm NMACTION.TXT            
rm PARKED.TXT              
rm PARKEVNT.TXT            
rm PERSON.TXT              
rm SAFETYEQ.TXT            
rm TRAFCON.TXT             
rm VEHICLE.TXT             
rm VIOLATN.TXT   

# create 2008 directory
hdfs dfs -rm -R /user/w205/accident_project/2008
hdfs dfs -mkdir /user/w205/accident_project/2008
 


hdfs dfs -mkdir /user/w205/accident_project/2008/VISION
hdfs dfs -put 2008_vision.txt /user/w205/accident_project/2008/VISION
hdfs dfs -mkdir /user/w205/accident_project/2008/ACCIDENT
hdfs dfs -put 2008_accident.txt /user/w205/accident_project/2008/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2008/BIKETRAF
hdfs dfs -put 2008_biketraf.txt /user/w205/accident_project/2008/BIKETRAF
hdfs dfs -mkdir /user/w205/accident_project/2008/DISTRACT
hdfs dfs -put 2008_distract.txt /user/w205/accident_project/2008/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2008/EVENT
hdfs dfs -put 2008_event.txt /user/w205/accident_project/2008/EVENT
hdfs dfs -mkdir /user/w205/accident_project/2008/FACTOR
hdfs dfs -put 2008_factor.txt /user/w205/accident_project/2008/FACTOR
hdfs dfs -mkdir /user/w205/accident_project/2008/NMIMPAIR
hdfs dfs -put 2008_impair.txt /user/w205/accident_project/2008/IMPAIR
hdfs dfs -mkdir /user/w205/accident_project/2008/MANEUVER
hdfs dfs -put 2008_maneuver.txt /user/w205/accident_project/2008/MANEUVER
hdfs dfs -mkdir /user/w205/accident_project/2008/NMACTION
hdfs dfs -put 2008_nmaction.txt /user/w205/accident_project/2008/NMACTION
hdfs dfs -mkdir /user/w205/accident_project/2008/PARKED
hdfs dfs -put 2008_parked.txt /user/w205/accident_project/2008/PARKED
hdfs dfs -mkdir /user/w205/accident_project/2008/PARKEVNT
hdfs dfs -put 2008_parkevnt.txt /user/w205/accident_project/2008/PARKEVNT
hdfs dfs -mkdir /user/w205/accident_project/2008/PERSON
hdfs dfs -put 2008_person.txt /user/w205/accident_project/2008/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2008/SAFETYEQ
hdfs dfs -put 2008_safetyeq.txt /user/w205/accident_project/2008/SAFETYEQ
hdfs dfs -mkdir /user/w205/accident_project/2008/TRAFCON
hdfs dfs -put 2008_trafcon.txt /user/w205/accident_project/2008/TRAFCON
hdfs dfs -mkdir /user/w205/accident_project/2008/VEHICLE
hdfs dfs -put 2008_vehicle.txt /user/w205/accident_project/2008/VEHICLE
hdfs dfs -mkdir /user/w205/accident_project/2008/VIOLATN
hdfs dfs -put 2008_violatn.txt /user/w205/accident_project/2008/VIOLATN



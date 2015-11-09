cd accident_project/raw_data

#2009

# unzip required files
       
unzip GES09.zip "VISION.TXT" 
unzip GES09.zip "ACCIDENT.TXT"        
unzip GES09.zip "BIKETRAF.TXT"        
unzip GES09.zip "DISTRACT.TXT"  
unzip GES09.zip "EVENT.TXT"      
unzip GES09.zip "FACTOR.TXT"          
unzip GES09.zip "IMPAIR.TXT"          
unzip GES09.zip "MANEUVER.TXT"        
unzip GES09.zip "NMACTION.TXT"        
unzip GES09.zip "PARKED.TXT"          
unzip GES09.zip "PARKEVNT.TXT"        
unzip GES09.zip "PERSON.TXT"          
unzip GES09.zip "SAFETYEQ.TXT"
unzip GES09.zip "TRAFCON.TXT"
unzip GES09.zip "VEHICLE.TXT"         
unzip GES09.zip "VIOLATN.TXT"   

# remove headers
   
tail -n +2  "VISION.TXT" > 2009_vision.txt 
tail -n +2  "ACCIDENT.TXT" > 2009_accident.txt        
tail -n +2  "BIKETRAF.TXT" > 2009_biketraf.txt      
tail -n +2  "DISTRACT.TXT" > 2009_distract.txt        
tail -n +2  "EVENT.TXT" > 2009_event.txt            
tail -n +2  "FACTOR.TXT" > 2009_factor.txt          
tail -n +2  "IMPAIR.TXT" > 2009_impair.txt          
tail -n +2  "MANEUVER.TXT" > 2009_maneuver.txt        
tail -n +2  "NMACTION.TXT" > 2009_nmaction.txt       
tail -n +2  "PARKED.TXT" > 2009_parked.txt          
tail -n +2  "PARKEVNT.TXT" > 2009_parkevnt.txt        
tail -n +2  "PERSON.TXT" > 2009_person.txt          
tail -n +2  "SAFETYEQ.TXT" > 2009_safetyeq.txt      
tail -n +2  "TRAFCON.TXT" > 2009_trafcon.txt
tail -n +2  "VEHICLE.TXT" > 2009_vehicle.txt        
tail -n +2  "VIOLATN.TXT" > 2009_violatn.txt     


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

# create 2009 directory
hdfs dfs -rm -R /user/w205/accident_project/2009
hdfs dfs -mkdir /user/w205/accident_project/2009
 


hdfs dfs -mkdir /user/w205/accident_project/2009/VISION
hdfs dfs -put 2009_vision.txt /user/w205/accident_project/2009/VISION
hdfs dfs -mkdir /user/w205/accident_project/2009/ACCIDENT
hdfs dfs -put 2009_accident.txt /user/w205/accident_project/2009/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2009/BIKETRAF
hdfs dfs -put 2009_biketraf.txt /user/w205/accident_project/2009/BIKETRAF
hdfs dfs -mkdir /user/w205/accident_project/2009/DISTRACT
hdfs dfs -put 2009_distract.txt /user/w205/accident_project/2009/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2009/EVENT
hdfs dfs -put 2009_event.txt /user/w205/accident_project/2009/EVENT
hdfs dfs -mkdir /user/w205/accident_project/2009/FACTOR
hdfs dfs -put 2009_factor.txt /user/w205/accident_project/2009/FACTOR
hdfs dfs -mkdir /user/w205/accident_project/2009/NMIMPAIR
hdfs dfs -put 2009_impair.txt /user/w205/accident_project/2009/IMPAIR
hdfs dfs -mkdir /user/w205/accident_project/2009/MANEUVER
hdfs dfs -put 2009_maneuver.txt /user/w205/accident_project/2009/MANEUVER
hdfs dfs -mkdir /user/w205/accident_project/2009/NMACTION
hdfs dfs -put 2009_nmaction.txt /user/w205/accident_project/2009/NMACTION
hdfs dfs -mkdir /user/w205/accident_project/2009/PARKED
hdfs dfs -put 2009_parked.txt /user/w205/accident_project/2009/PARKED
hdfs dfs -mkdir /user/w205/accident_project/2009/PARKEVNT
hdfs dfs -put 2009_parkevnt.txt /user/w205/accident_project/2009/PARKEVNT
hdfs dfs -mkdir /user/w205/accident_project/2009/PERSON
hdfs dfs -put 2009_person.txt /user/w205/accident_project/2009/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2009/SAFETYEQ
hdfs dfs -put 2009_safetyeq.txt /user/w205/accident_project/2009/SAFETYEQ
hdfs dfs -mkdir /user/w205/accident_project/2009/TRAFCON
hdfs dfs -put 2009_trafcon.txt /user/w205/accident_project/2009/TRAFCON
hdfs dfs -mkdir /user/w205/accident_project/2009/VEHICLE
hdfs dfs -put 2009_vehicle.txt /user/w205/accident_project/2009/VEHICLE
hdfs dfs -mkdir /user/w205/accident_project/2009/VIOLATN
hdfs dfs -put 2009_violatn.txt /user/w205/accident_project/2009/VIOLATN



cd accident_project/raw_data

#2010

# unzip required files
 
unzip GES10.zip "TXT/ACCIDENT.TXT"        
unzip GES10.zip "TXT/BIKETRAF.TXT"        
unzip GES10.zip "TXT/CEVENT.TXT"          
unzip GES10.zip "TXT/DISTRACT.TXT"        
unzip GES10.zip "TXT/FACTOR.TXT"          
unzip GES10.zip "TXT/IMPAIR.TXT"          
unzip GES10.zip "TXT/MANEUVER.TXT"        
unzip GES10.zip "TXT/NMCRASH.TXT"         
unzip GES10.zip "TXT/NMPRIOR.TXT"         
unzip GES10.zip "TXT/PARKED.TXT"          
unzip GES10.zip "TXT/PARKEVNT.TXT"        
unzip GES10.zip "TXT/PERSON.TXT"          
unzip GES10.zip "TXT/SAFETYEQ.TXT"
unzip GES10.zip "TXT/VEHICLE.TXT"         
unzip GES10.zip "TXT/VEVENT.TXT"          
unzip GES10.zip "TXT/VIOLATN.TXT"         
unzip GES10.zip "TXT/VISION.TXT" 

# remove headers


tail -n +2  "TXT/ACCIDENT.TXT" > 2010_accident.txt        
tail -n +2  "TXT/BIKETRAF.TXT" > 2010_biketraf.txt        
tail -n +2  "TXT/CEVENT.TXT" > 2010_cevent.txt          
tail -n +2  "TXT/DISTRACT.TXT" > 2010_distract.txt        
tail -n +2  "TXT/FACTOR.TXT" > 2010_factor.txt          
tail -n +2  "TXT/IMPAIR.TXT" > 2010_impair.txt          
tail -n +2  "TXT/MANEUVER.TXT" > 2010_maneuver.txt        
tail -n +2  "TXT/NMCRASH.TXT" > 2010_nmcrash.txt         
tail -n +2  "TXT/NMPRIOR.TXT" > 2010_nmprior.txt         
tail -n +2  "TXT/PARKED.TXT" > 2010_parked.txt          
tail -n +2  "TXT/PARKEVNT.TXT" > 2010_parkevnt.txt        
tail -n +2  "TXT/PERSON.TXT" > 2010_person.txt          
tail -n +2  "TXT/SAFETYEQ.TXT" > 2010_safetyeq.txt
tail -n +2  "TXT/VEHICLE.TXT" > 2010_vehicle.txt         
tail -n +2  "TXT/VEVENT.TXT" > 2010_vevent.txt          
tail -n +2  "TXT/VIOLATN.TXT" > 2010_violatn.txt         
tail -n +2  "TXT/VISION.TXT" > 2010_vision.txt 


# create 2010 directory
hdfs dfs -rm -R /user/w205/accident_project/2010
hdfs dfs -mkdir /user/w205/accident_project/2010
 

hdfs dfs -mkdir /user/w205/accident_project/2010/ACCIDENT
hdfs dfs -put 2010_accident.txt /user/w205/accident_project/2010/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2010/BIKETRAF
hdfs dfs -put 2010_biketraf.txt /user/w205/accident_project/2010/BIKETRAF
hdfs dfs -mkdir /user/w205/accident_project/2010/CEVENT
hdfs dfs -put 2010_cevent.txt /user/w205/accident_project/2010/CEVENT
hdfs dfs -mkdir /user/w205/accident_project/2010/DISTRACT
hdfs dfs -put 2010_distract.txt /user/w205/accident_project/2010/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2010/FACTOR
hdfs dfs -put 2010_factor.txt /user/w205/accident_project/2010/FACTOR
hdfs dfs -mkdir /user/w205/accident_project/2010/NMIMPAIR
hdfs dfs -put 2010_impair.txt /user/w205/accident_project/2010/NMIMPAIR
hdfs dfs -mkdir /user/w205/accident_project/2010/MANEUVER
hdfs dfs -put 2010_maneuver.txt /user/w205/accident_project/2010/MANEUVER
hdfs dfs -mkdir /user/w205/accident_project/2010/NMCRASH
hdfs dfs -put 2010_nmcrash.txt /user/w205/accident_project/2010/NMCRASH
hdfs dfs -mkdir /user/w205/accident_project/2010/NMPRIOR
hdfs dfs -put 2010_nmprior.txt /user/w205/accident_project/2010/NMPRIOR
hdfs dfs -mkdir /user/w205/accident_project/2010/PARKED
hdfs dfs -put 2010_parked.txt /user/w205/accident_project/2010/PARKED
hdfs dfs -mkdir /user/w205/accident_project/2010/PARKEVNT
hdfs dfs -put 2010_parkevnt.txt /user/w205/accident_project/2010/PARKEVNT
hdfs dfs -mkdir /user/w205/accident_project/2010/PERSON
hdfs dfs -put 2010_person.txt /user/w205/accident_project/2010/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2010/SAFETYEQ
hdfs dfs -put 2010_safetyeq.txt /user/w205/accident_project/2010/SAFETYEQ
hdfs dfs -mkdir /user/w205/accident_project/2010/VEHICLE
hdfs dfs -put 2010_vehicle.txt /user/w205/accident_project/2010/VEHICLE
hdfs dfs -mkdir /user/w205/accident_project/2010/VEVENT
hdfs dfs -put 2010_vevent.txt /user/w205/accident_project/2010/VEVENT
hdfs dfs -mkdir /user/w205/accident_project/2010/VIOLATN
hdfs dfs -put 2010_violatn.txt /user/w205/accident_project/2010/VIOLATN
hdfs dfs -mkdir /user/w205/accident_project/2010/VISION
hdfs dfs -put 2010_vision.txt /user/w205/accident_project/2010/VISION



#remove unneeded files
rm -R TXT



cd accident_project/raw_data

#2013

# unzip required files
unzip GES13.zip "ACCIDENT.TXT" 
unzip GES13.zip "CEVENT.TXT" 
unzip GES13.zip "DAMAGE.TXT" 
unzip GES13.zip "FACTOR.TXT" 
unzip GES13.zip "NMIMPAIR.TXT" 
unzip GES13.zip "PERSON.TXT" 
unzip GES13.zip "VEVENT.TXT" 
unzip GES13.zip "VSOE.TXT" 
unzip GES13.zip "DISTRACT.TXT" 
unzip GES13.zip "MANEUVER.TXT" 
unzip GES13.zip "NMPRIOR.TXT" 
unzip GES13.zip "SAFETYEQ.TXT" 
unzip GES13.zip "VIOLATN.TXT" 
unzip GES13.zip "DRIMPAIR.TXT" 
unzip GES13.zip "NMCRASH.TXT" 
unzip GES13.zip "PARKWORK.TXT" 
unzip GES13.zip "VEHICLE.TXT" 
unzip GES13.zip "VISION.TXT" 

# remove headers
tail -n +2 "ACCIDENT.TXT" > 2013_accident.txt
tail -n +2 "CEVENT.TXT" > 2013_cevent.txt
tail -n +2 "DAMAGE.TXT" > 2013_damage.txt
tail -n +2 "FACTOR.TXT" > 2013_factor.txt
tail -n +2 "NMIMPAIR.TXT" > 2013_nmimpair.txt
tail -n +2 "PERSON.TXT" > 2013_person.txt
tail -n +2 "VEVENT.TXT" > 2013_vevent.txt
tail -n +2 "VSOE.TXT" > 2013_vsoe.txt
tail -n +2 "DISTRACT.TXT" > 2013_distract.txt
tail -n +2 "MANEUVER.TXT" > 2013_maneuver.txt
tail -n +2 "NMPRIOR.TXT" > 2013_nmprior.txt
tail -n +2 "SAFETYEQ.TXT" > 2013_safetyeq.txt
tail -n +2 "VIOLATN.TXT" > 2013_violatn.txt
tail -n +2 "DRIMPAIR.TXT" > 2013_drimpair.txt
tail -n +2 "NMCRASH.TXT" > 2013_nmcrash.txt
tail -n +2 "PARKWORK.TXT" > 2013_parkwork.txt
tail -n +2 "VEHICLE.TXT" > 2013_vehicle.txt
tail -n +2 "VISION.TXT" > 2013_vision.txt

#remove unneeded files
rm ACCIDENT.TXT 
rm CEVENT.TXT 
rm DAMAGE.TXT 
rm FACTOR.TXT 
rm NMIMPAIR.TXT 
rm PERSON.TXT 
rm VEVENT.TXT 
rm VSOE.TXT 
rm DISTRACT.TXT 
rm MANEUVER.TXT 
rm NMPRIOR.TXT 
rm SAFETYEQ.TXT 
rm VIOLATN.TXT 
rm DRIMPAIR.TXT 
rm NMCRASH.TXT 
rm PARKWORK.TXT 
rm VEHICLE.TXT 
rm VISION.TXT 


# create 2013 directory
hdfs dfs -rm -R /user/w205/accident_project/2013
hdfs dfs -mkdir /user/w205/accident_project/2013
 

hdfs dfs -mkdir /user/w205/accident_project/2013/ACCIDENT
hdfs dfs -put 2013_accident.txt /user/w205/accident_project/2013/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2013/CEVENT
hdfs dfs -put 2013_cevent.txt /user/w205/accident_project/2013/CEVENT
hdfs dfs -mkdir /user/w205/accident_project/2013/DAMAGE
hdfs dfs -put 2013_damage.txt /user/w205/accident_project/2013/DAMAGE
hdfs dfs -mkdir /user/w205/accident_project/2013/FACTOR
hdfs dfs -put 2013_factor.txt /user/w205/accident_project/2013/FACTOR
hdfs dfs -mkdir /user/w205/accident_project/2013/NMIMPAIR
hdfs dfs -put 2013_nmimpair.txt /user/w205/accident_project/2013/NMIMPAIR
hdfs dfs -mkdir /user/w205/accident_project/2013/PERSON
hdfs dfs -put 2013_person.txt /user/w205/accident_project/2013/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2013/VEVENT
hdfs dfs -put 2013_vevent.txt /user/w205/accident_project/2013/VEVENT
hdfs dfs -mkdir /user/w205/accident_project/2013/VSOE
hdfs dfs -put 2013_vsoe.txt /user/w205/accident_project/2013/VSOE
hdfs dfs -mkdir /user/w205/accident_project/2013/DISTRACT
hdfs dfs -put 2013_distract.txt /user/w205/accident_project/2013/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2013/MANEUVER
hdfs dfs -put 2013_maneuver.txt /user/w205/accident_project/2013/MANEUVER
hdfs dfs -mkdir /user/w205/accident_project/2013/NMPRIOR
hdfs dfs -put 2013_nmprior.txt /user/w205/accident_project/2013/NMPRIOR
hdfs dfs -mkdir /user/w205/accident_project/2013/SAFETYEQ
hdfs dfs -put 2013_safetyeq.txt /user/w205/accident_project/2013/SAFETYEQ
hdfs dfs -mkdir /user/w205/accident_project/2013/VIOLATN
hdfs dfs -put 2013_violatn.txt /user/w205/accident_project/2013/VIOLATN
hdfs dfs -mkdir /user/w205/accident_project/2013/DRIMPAIR
hdfs dfs -put 2013_drimpair.txt /user/w205/accident_project/2013/DRIMPAIR
hdfs dfs -mkdir /user/w205/accident_project/2013/NMCRASH
hdfs dfs -put 2013_nmcrash.txt /user/w205/accident_project/2013/NMCRASH
hdfs dfs -mkdir /user/w205/accident_project/2013/PARKWORK
hdfs dfs -put 2013_parkwork.txt /user/w205/accident_project/2013/PARKWORK
hdfs dfs -mkdir /user/w205/accident_project/2013/VEHICLE
hdfs dfs -put 2013_vehicle.txt /user/w205/accident_project/2013/VEHICLE
hdfs dfs -mkdir /user/w205/accident_project/2013/VISION
hdfs dfs -put 2013_vision.txt /user/w205/accident_project/2013/VISION


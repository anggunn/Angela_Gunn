cd accident_project/raw_data

#2012

# unzip required files
unzip GES12.zip "ACCIDENT.TXT" 
unzip GES12.zip "CEVENT.TXT" 
unzip GES12.zip "DAMAGE.TXT" 
unzip GES12.zip "FACTOR.TXT" 
unzip GES12.zip "NMIMPAIR.TXT" 
unzip GES12.zip "PERSON.TXT" 
unzip GES12.zip "VEVENT.TXT" 
unzip GES12.zip "VSOE.TXT" 
unzip GES12.zip "DISTRACT.TXT" 
unzip GES12.zip "MANEUVER.TXT" 
unzip GES12.zip "NMPRIOR.TXT" 
unzip GES12.zip "SAFETYEQ.TXT" 
unzip GES12.zip "VIOLATN.TXT" 
unzip GES12.zip "DRIMPAIR.TXT" 
unzip GES12.zip "NMCRASH.TXT" 
unzip GES12.zip "PARKWORK.TXT" 
unzip GES12.zip "VEHICLE.TXT" 
unzip GES12.zip "VISION.TXT" 

# remove headers
tail -n +2 "ACCIDENT.TXT" > 2012_accident.txt
tail -n +2 "CEVENT.TXT" > 2012_cevent.txt
tail -n +2 "DAMAGE.TXT" > 2012_damage.txt
tail -n +2 "FACTOR.TXT" > 2012_factor.txt
tail -n +2 "NMIMPAIR.TXT" > 2012_nmimpair.txt
tail -n +2 "PERSON.TXT" > 2012_person.txt
tail -n +2 "VEVENT.TXT" > 2012_vevent.txt
tail -n +2 "VSOE.TXT" > 2012_vsoe.txt
tail -n +2 "DISTRACT.TXT" > 2012_distract.txt
tail -n +2 "MANEUVER.TXT" > 2012_maneuver.txt
tail -n +2 "NMPRIOR.TXT" > 2012_nmprior.txt
tail -n +2 "SAFETYEQ.TXT" > 2012_safetyeq.txt
tail -n +2 "VIOLATN.TXT" > 2012_violatn.txt
tail -n +2 "DRIMPAIR.TXT" > 2012_drimpair.txt
tail -n +2 "NMCRASH.TXT" > 2012_nmcrash.txt
tail -n +2 "PARKWORK.TXT" > 2012_parkwork.txt
tail -n +2 "VEHICLE.TXT" > 2012_vehicle.txt
tail -n +2 "VISION.TXT" > 2012_vision.txt

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


# create 2012 directory
hdfs dfs -rm -R /user/w205/accident_project/2012
hdfs dfs -mkdir /user/w205/accident_project/2012
 

hdfs dfs -mkdir /user/w205/accident_project/2012/ACCIDENT
hdfs dfs -put 2012_accident.txt /user/w205/accident_project/2012/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2012/CEVENT
hdfs dfs -put 2012_cevent.txt /user/w205/accident_project/2012/CEVENT
hdfs dfs -mkdir /user/w205/accident_project/2012/DAMAGE
hdfs dfs -put 2012_damage.txt /user/w205/accident_project/2012/DAMAGE
hdfs dfs -mkdir /user/w205/accident_project/2012/FACTOR
hdfs dfs -put 2012_factor.txt /user/w205/accident_project/2012/FACTOR
hdfs dfs -mkdir /user/w205/accident_project/2012/NMIMPAIR
hdfs dfs -put 2012_nmimpair.txt /user/w205/accident_project/2012/NMIMPAIR
hdfs dfs -mkdir /user/w205/accident_project/2012/PERSON
hdfs dfs -put 2012_person.txt /user/w205/accident_project/2012/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2012/VEVENT
hdfs dfs -put 2012_vevent.txt /user/w205/accident_project/2012/VEVENT
hdfs dfs -mkdir /user/w205/accident_project/2012/VSOE
hdfs dfs -put 2012_vsoe.txt /user/w205/accident_project/2012/VSOE
hdfs dfs -mkdir /user/w205/accident_project/2012/DISTRACT
hdfs dfs -put 2012_distract.txt /user/w205/accident_project/2012/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2012/MANEUVER
hdfs dfs -put 2012_maneuver.txt /user/w205/accident_project/2012/MANEUVER
hdfs dfs -mkdir /user/w205/accident_project/2012/NMPRIOR
hdfs dfs -put 2012_nmprior.txt /user/w205/accident_project/2012/NMPRIOR
hdfs dfs -mkdir /user/w205/accident_project/2012/SAFETYEQ
hdfs dfs -put 2012_safetyeq.txt /user/w205/accident_project/2012/SAFETYEQ
hdfs dfs -mkdir /user/w205/accident_project/2012/VIOLATN
hdfs dfs -put 2012_violatn.txt /user/w205/accident_project/2012/VIOLATN
hdfs dfs -mkdir /user/w205/accident_project/2012/DRIMPAIR
hdfs dfs -put 2012_drimpair.txt /user/w205/accident_project/2012/DRIMPAIR
hdfs dfs -mkdir /user/w205/accident_project/2012/NMCRASH
hdfs dfs -put 2012_nmcrash.txt /user/w205/accident_project/2012/NMCRASH
hdfs dfs -mkdir /user/w205/accident_project/2012/PARKWORK
hdfs dfs -put 2012_parkwork.txt /user/w205/accident_project/2012/PARKWORK
hdfs dfs -mkdir /user/w205/accident_project/2012/VEHICLE
hdfs dfs -put 2012_vehicle.txt /user/w205/accident_project/2012/VEHICLE
hdfs dfs -mkdir /user/w205/accident_project/2012/VISION
hdfs dfs -put 2012_vision.txt /user/w205/accident_project/2012/VISION


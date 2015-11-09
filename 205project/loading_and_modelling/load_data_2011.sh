cd accident_project/raw_data

#2011

# unzip required files
unzip GES11.zip "ACCIDENT.TXT"            
unzip GES11.zip "CEVENT.TXT"              
unzip GES11.zip "DISTRACT.TXT"            
unzip GES11.zip "DRIMPAIR.TXT"            
unzip GES11.zip "FACTOR.TXT"              
unzip GES11.zip "MANEUVER.TXT"            
unzip GES11.zip "NMCRASH.TXT"             
unzip GES11.zip "NMIMPAIR.TXT"            
unzip GES11.zip "NMPRIOR.TXT"             
unzip GES11.zip "PARKWORK.TXT"            
unzip GES11.zip "PERSON.TXT"              
unzip GES11.zip "SAFETYEQ.TXT"            
unzip GES11.zip "VEHICLE.TXT"             
unzip GES11.zip "VEVENT.TXT"              
unzip GES11.zip "VIOLATN.TXT"             
unzip GES11.zip "VISION.TXT"              
unzip GES11.zip "VSOE.TXT"   


# remove headers
tail -n +2 "ACCIDENT" > 2011_accident.txt            
tail -n +2 "CEVENT" > 2011_cevent.txt
tail -n +2 "DISTRACT" > 2011_distract.txt            
tail -n +2 "DRIMPAIR" > 2011_drimpair.txt            
tail -n +2 "FACTOR" > 2011_factor.txt              
tail -n +2 "MANEUVER" > 2011_maneuver.txt            
tail -n +2 "NMCRASH" > 2011_nmcrash.txt             
tail -n +2 "NMIMPAIR" > 2011_nmimpair.txt            
tail -n +2 "NMPRIOR" > 2011_nmprior.txt             
tail -n +2 "PARKWORK" > 2011_parkwork.txt            
tail -n +2 "PERSON" > 2011_person.txt              
tail -n +2 "SAFETYEQ" > 2011_safetyeq.txt            
tail -n +2 "VEHICLE" > 2011_vehicle.txt             
tail -n +2 "VEVENT" > 2011_vevent.txt              
tail -n +2 "VIOLATN" > 2011_violatn.txt             
tail -n +2 "VISION" > 2011_vision.txt              
tail -n +2 "VSOE" > 2011_vsoe.txt  


#remove unneeded files
rm ACCIDENT.TXT            
rm CEVENT.TXT              
rm DISTRACT.TXT            
rm DRIMPAIR.TXT            
rm FACTOR.TXT              
rm MANEUVER.TXT            
rm NMCRASH.TXT             
rm NMIMPAIR.TXT            
rm NMPRIOR.TXT             
rm PARKWORK.TXT            
rm PERSON.TXT              
rm SAFETYEQ.TXT            
rm VEHICLE.TXT             
rm VEVENT.TXT              
rm VIOLATN.TXT             
rm VISION.TXT              
rm VSOE.TXT    


# create 2011 directory
hdfs dfs -rm -R /user/w205/accident_project/2011
hdfs dfs -mkdir /user/w205/accident_project/2011
 

hdfs dfs -mkdir /user/w205/accident_project/2011/ACCIDENT
hdfs dfs -put 2011_accident.txt /user/w205/accident_project/2011/ACCIDENT
hdfs dfs -mkdir /user/w205/accident_project/2011/CEVENT
hdfs dfs -put 2011_cevent.txt /user/w205/accident_project/2011/CEVENT
hdfs dfs -mkdir /user/w205/accident_project/2011/DISTRACT
hdfs dfs -put 2011_distract.txt /user/w205/accident_project/2011/DISTRACT
hdfs dfs -mkdir /user/w205/accident_project/2011/DRIMPAIR
hdfs dfs -put 2011_drimpair.txt /user/w205/accident_project/2011/DRIMPAIR
hdfs dfs -mkdir /user/w205/accident_project/2011/FACTOR
hdfs dfs -put 2011_factor.txt /user/w205/accident_project/2011/FACTOR
hdfs dfs -mkdir /user/w205/accident_project/2011/MANEUVER
hdfs dfs -put 2011_maneuver.txt /user/w205/accident_project/2011/MANEUVER
hdfs dfs -mkdir /user/w205/accident_project/2011/NMCRASH
hdfs dfs -put 2011_nmcrash.txt /user/w205/accident_project/2011/NMCRASH
hdfs dfs -mkdir /user/w205/accident_project/2011/NMIMPAIR
hdfs dfs -put 2011_nmimpair.txt /user/w205/accident_project/2011/NMIMPAIR
hdfs dfs -mkdir /user/w205/accident_project/2011/NMPRIOR
hdfs dfs -put 2011_nmprior.txt /user/w205/accident_project/2011/NMPRIOR
hdfs dfs -mkdir /user/w205/accident_project/2011/PARKWORK
hdfs dfs -put 2011_parkwork.txt /user/w205/accident_project/2011/PARKWORK
hdfs dfs -mkdir /user/w205/accident_project/2011/PERSON
hdfs dfs -put 2011_person.txt /user/w205/accident_project/2011/PERSON
hdfs dfs -mkdir /user/w205/accident_project/2011/SAFETYEQ
hdfs dfs -put 2011_safetyeq.txt /user/w205/accident_project/2011/SAFETYEQ
hdfs dfs -mkdir /user/w205/accident_project/2011/VEHICLE
hdfs dfs -put 2011_vehicle.txt /user/w205/accident_project/2011/VEHICLE
hdfs dfs -mkdir /user/w205/accident_project/2011/VEVENT
hdfs dfs -put 2011_vevent.txt /user/w205/accident_project/2011/VEVENT
hdfs dfs -mkdir /user/w205/accident_project/2011/VIOLATN
hdfs dfs -put 2011_violatn.txt /user/w205/accident_project/2011/VIOLATN
hdfs dfs -mkdir /user/w205/accident_project/2011/VISION
hdfs dfs -put 2011_vision.txt /user/w205/accident_project/2011/VISION
hdfs dfs -mkdir /user/w205/accident_project/2011/VSOE
hdfs dfs -put 2011_vsoe.txt /user/w205/accident_project/2011/VSOE






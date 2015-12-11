#!/usr/bin/python
import sys
import datetime
import string

####2005 Accident



#FUNCTION FirstHarm_to_String
#INPUT - the value from query
#OUTPUT - string description
def FirstHarm_to_String(tmpValue): 
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
		
	
	non_Collision = [1,2,3,4,5,6,7,8,9,10]
	col_not_fixed = [21,22,23,24,25,26,27,47,28,29]
	col_fixed = [31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,58,59]
	col_VinTrans = []
	unknown = [99,100]
	
	if tmpEvent in non_Collision: return 'Non-Collision'
	if tmpEvent in col_not_fixed: return 'Collision - Object Not Fixed'
	if tmpEvent in col_fixed: return 'Collision - Object Fixed'
	if tmpEvent in col_VinTrans: return 'Collisiion - Vehicle in Transport'
	if tmpEvent in unknown: return 'Unknown'
	return 'NA'
#end FirstHarm_to_String

#FUNCTION WithinInterchange_to_String
#INPUT - the value from query
#OUTPUT - string description
def WithinInterchange_to_String(tmpValue): 
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
		
	
	no = [0,1,2,3,4,5,6,7,8,9]
	yes = [10,11,12,13,14,16,17,18,19]
	unknown = [99,100]
	
	if tmpEvent in no: return 'No'
	if tmpEvent in yes: return 'Yes'
	if tmpEvent in unknown: return 'Unknown'
	return 'NA'
#end WithinInterchange_to_String


#FUNCTION RelationJunction_to_String
#INPUT - the value from query
#OUTPUT - string description
def RelationJunction_to_String(tmpValue): 
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
		
	
	nonJunct = [0,10]
	intersection = [1,11]
	intersection_r = [2,12]
	driveway = [3,13]
	entrance = [4,14]
	railway = [5]
	crossover = [6,16,7,17]
	through = [8]
	other = [18]
	unknown = [9,19,99,100]
	
	if tmpEvent in nonJunct: return 'Non-Junction'
	if tmpEvent in intersection: return 'Intersection'
	if tmpEvent in intersection_r: return 'Intersection Related'
	if tmpEvent in driveway: return "Driveway Access"
	if tmpEvent in entrance: return "Entrance or Exit Ramp Related"
	if tmpEvent in railway: return "Railway Grade Crossing"
	if tmpEvent in crossover: return "Crossover Related"
	if tmpEvent in through: return "Through Roadway"
	if tmpEvent in other: return "Other Location Within Interchange Area"
	if tmpEvent in unknown: return "Unknown"
	return 'NA'
#end WithinInterchange_to_String		
		
		
#FUNCTION Weather_outputs
#INPUT - the value from query
#OUTPUT - list of weather strings
def Weather_outputs(tmpValue): 
	weather_set = []

	Weather2String = {'0': 'No Additional Conditions',
		'1': 'Clear',
		'2': 'Rain',
		'3': 'Sleet or Hail',
		'4': 'Snow',
		'5': 'Fog or Smog or Smoke',
		'8': 'Other',
		'9': 'Unknown'}
	
	if tmpValue == '6': #put entry in for rain and fog
		weather_set.append(Weather2String['2'])
		weather_set.append(Weather2String['5'])
		weather_set.append(Weather2String['0'])
	elif tmpValue == '7': #put entry in for sleet and fog
		weather_set.append(Weather2String['3'])
		weather_set.append(Weather2String['5'])
		weather_set.append(Weather2String['0'])
	else:
		weather_set.append(Weather2String[tmpValue])
		weather_set.append(Weather2String['0'])
		weather_set.append(Weather2String['0'])
	return weather_set
#end Weather_outputs
		

#MAIN CODE
for line in sys.stdin:
	output = []
	tokens = line.strip().split("\t")
	#CaseNum
	output.append(tokens[0])
	#Year
	output.append(tokens[1])
	#Month
	Month2String = {'1': 'January',
		'2': 'February',
		'3': 'March',
		'4': 'April',
		'5': 'May',
		'6': 'June',
		'7': 'July',
		'8': 'August',
		'9': 'September',
		'10': 'October',
		'11': 'November',
		'12': 'December'}
	try:
		output.append(Month2String[tokens[2]])
	except:
		output.append('NA')
	#Day_Week
	Day2String = {'1': 'Sunday',
		'2': 'Monday',
		'3': 'Tuesday',
		'4': 'Wednesday',
		'5': 'Thursday',
		'6': 'Friday',
		'7': 'Saturday'}
	try:
		output.append(Day2String[tokens[3]])
	except:
		output.append('NA')
	#Hour
	output.append(tokens[4])
	#Region
	Region2String = {'1': 'Northeast',
		'2': 'Midwest',
		'3': 'South',
		'4': 'West'}
	try:
		output.append(Region2String[tokens[5]])
	except:
		output.append('NA')
	#Num_Vehicles
	output.append(tokens[6])
	#Num_ParkWork
	output.append(tokens[7])
	#Persons_Ped
	output.append(tokens[8])
	#Persons_NotTransit
	output.append(tokens[9])
	#Persons_Transit
	output.append(tokens[10])
	#First Harmful Event
	output.append(FirstHarm_to_String(tokens[11]))
	#Manner_Collision
	ManColl2String = {'0': 'No Collision with a Vehicle in Transport',
		'1': 'Front-to-Rear',
		'2': 'Front-to-Front',
		'3': 'Rear-to-Rear',
		'4': 'Angle',
		'5': 'Sideswipe - Same Direction',
		'6': 'Sideswipe - Opposite Direction',
		'9': 'Unknown'}
	try: 
		output.append(ManColl2String[tokens[12]])
	except:
		output.append('NA')
		
	#Within_Interchange
	#BASED ON RELATION TO JUCTION
	output.append(WithinInterchange_to_String(tokens[14]))
		
	#Relation_to_Junction
	output.append(RelationJunction_to_String(tokens[14]))
		
		
	#Intersection_Type
	IntersectionType2String = {'0': 'Not an Intersection',
		'1': 'Four-Way',
		'2': 'T-Intersection',
		'3': 'Y-Intersection',
		'4': 'Traffic Circle',
		'5': 'Roundabout',
		'6': 'Five-Point or More',
		'7': 'Unknown',
		'9': 'Unknown'}
	try: 
		output.append(IntersectionType2String[tokens[15]])
	except:
		output.append('NA')
	#Work_Zone
	WorkZone2String = {'3': 'No',
		'4': 'Yes',
		'5': 'Yes',
		'6': 'Yes',
		'9': 'Unknown'}
	try:
		output.append(WorkZone2String[tokens[16]])
	except:
		output.append('NA')
	#Weather 1-3
	#2005 had only 1 Weather field.
	#so we use logic to determine what the 3 fields should be, 
	#then add them to the output so there are 3 weather fields.
	add_fields = Weather_outputs(tokens[17])
	output.append(add_fields[0])
	output.append(add_fields[1])
	output.append(add_fields[2])
	
		
	#Max_Injury
	MaxInjury2String = {'4': '01 Fatal',
		'3': '02 Incapacitating',
		'2': '03 Non-Incapacitating',
		'1': '04 Possible Injury',
		'5': '05 Injured, Unknown Severity',
		'0': '06 No Injury',
		'6': '07 Died Prior',
		'9': '08 Unknown if Injured',
		'8': '09 No Person Involved'}
	try:
		output.append(MaxInjury2String[tokens[18]])
	except:
		output.append('NA')
	#Num_Injury
	output.append(tokens[19])

	#Alcohol_Involved
	Alcohol2String = {'1': 'Yes - Alchohol Involved',
		'2': 'No - No Alchohol Involved',
		'8': 'No - Not Applicable',
		'9': 'Unknown'}
	try:
		output.append(Alcohol2String[tokens[20]])
	except:
		output.append('NA')
	
	
	print("\t".join(output))

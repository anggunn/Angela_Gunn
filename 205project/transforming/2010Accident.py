#!/usr/bin/python
import sys
import datetime
import string


####2010 Accident

#FUNCTION FirstHarm_to_String
#INPUT - the value from query
#OUTPUT - string description
def FirstHarm_to_String(tmpValue): 
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
		
	
	non_Collision = [1,2,3,4,5,7,8,10,11,12,13]
	col_not_fixed = [21,22,23,24,49,27,28,29,30]
	col_fixed = [31,32,33,36,39,40,41,42,43,44,45,46,58,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85]
	col_VinTrans = [90,91,92]
	unknown = [97,99,100]
	
	if tmpEvent in non_Collision: return 'Non-Collision'
	if tmpEvent in col_not_fixed: return 'Collision - Object Not Fixed'
	if tmpEvent in col_fixed: return 'Collision - Object Fixed'
	if tmpEvent in col_VinTrans: return 'Collisiion - Vehicle in Transport'
	if tmpEvent in unknown: return 'Unknown'
	return 'NA'
#end FirstHarm_to_String


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
		'7': 'Rear-to-Side',
		'8': 'Other',
		'9': 'Unknown'}
	try: 
		output.append(ManColl2String[tokens[12]])
	except:
		output.append('NA')
	#Within_Interchange
	WithinInterchange2String = {'0': 'No',
		'1': 'Yes',
		'8': 'Unknown',
		'9': 'Unknown'}
	try:
		output.append(WithinInterchange2String[tokens[13]])
	except:
		output.append('NA')
	#Relation_to_Junction
	RelationJunction2String = {'1': 'Non-Junction',
		'2': 'Intersection',
		'3': 'Intersection Related',
		'4': 'Driveway Access',
		'5': 'Entrance or Exit Ramp Related',
		'6': 'Railway Grade Crossing',
		'7': 'Crossover Related',
		'8': 'Driveway Access Related',
		'16': 'Shared-Use Path or Trail',
		'17': 'Acceleration or Deceleration Lane',
		'18': 'Through Roadway',
		'19': 'Other Location Within Interchange Area',
		'98': 'Unknown',
		'99': 'Unknown'}
	try:
		output.append(RelationJunction2String[tokens[14]])
	except:
		output.append('NA')
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
	WorkZone2String = {'0': 'No',
		'1': 'Yes',
		'2': 'Yes',
		'3': 'Yes',
		'4': 'Yes',
		'7': 'Unknown'}
	try:
		output.append(WorkZone2String[tokens[16]])
	except:
		output.append('NA')
	#Weather 1-3
	Weather2String = {'0': 'No Additional Conditions',
		'1': 'Clear',
		'2': 'Rain',
		'3': 'Sleet or Hail',
		'4': 'Snow',
		'5': 'Fog or Smog or Smoke',
		'6': 'Severe Crosswinds',
		'7': 'Blowing Dirt',
		'8': 'Other',
		'10': 'Cloudy',
		'11': 'Blowing Snow',
		'98': 'Unknown',
		'99': 'Unknown'}
	try:
		output.append(Weather2String[tokens[17]])
	except:
		output.append('NA')
	try:
		output.append(Weather2String[tokens[18]])
	except:
		output.append('NA')
	try:
		output.append(Weather2String[tokens[19]])
	except:
		output.append('NA')
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
		output.append(MaxInjury2String[tokens[20]])
	except:
		output.append('NA')
	#Num_Injury
	output.append(tokens[21])

	#Alcohol_Involved
	Alcohol2String = {'1': 'Yes - Alchohol Involved',
		'2': 'No - No Alchohol Involved',
		'8': 'No - Not Applicable',
		'9': 'Unknown'}
	try:
		output.append(Alcohol2String[tokens[22]])
	except:
		output.append('NA')
	
	
	print("\t".join(output))


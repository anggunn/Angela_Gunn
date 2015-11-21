#!/usr/bin/python
import sys
import datetime
import string

#2012 Vehicle

#FUNCTION BodyType_to_String
#INPUT - the value from query
#OUTPUT - string description
def BodyType_to_String(tmpValue):
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
		
	
	Automobile = [1,2,3,4,5,6,7,17,8,9]
	Auto_Deriv = [10,11,12,13]
	Utility = [14,15,16,19]
	Van_Based = [20,21,22,28,29]
	Light_Truck = [30,31,32,33,39]
	Other_Light_Truck = [40,41,45,48,49]
	Buses = [50,51,52,55,58,59]
	Med_Heavy = [60,61,62,63,64,66,67,68,71,72,78,79]
	Motor_Home = [42,65,73]
	Motored_Cycle = [80,81,82,83,88,89,90]
	Farm_Const = [92,93]
	Other = [91,94,95,97]
	unknown = [98,99,100]
	
	if tmpEvent in Automobile: return 'Automobile'
	if tmpEvent in Auto_Deriv: return 'Automobile Derivative'
	if tmpEvent in Utility: return 'Utility Vehicle'
	if tmpEvent in Van_Based: return 'Van-Based Light Truck'
	if tmpEvent in Light_Truck: return 'Light Conventional Truck (pickup style)'
	if tmpEvent in Other_Light_Truck: return 'Other Light Truck'
	if tmpEvent in Buses: return 'Bus'
	if tmpEvent in Med_Heavy: return 'Medium or Heavy Trucks'
	if tmpEvent in Motor_Home: return 'Motor Home'
	if tmpEvent in Motored_Cycle: return 'Motored Cycles, Mopeds, All-Terrain Vehicle'
	if tmpEvent in Farm_Const: return 'Farm or Construction Vehicle'
	if tmpEvent in Other: return 'Other Vehicle'
	if tmpEvent in unknown: return 'Unknown'
		
	return 'NA'
#end BodyType_to_String

#FUNCTION MostHarm_to_String
#INPUT - the value from query
#OUTPUT - string description
def MostHarm_to_String(tmpValue):
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
		
	
	non_Collision = [1,2,3,4,51,44,7,16,6,72,73,5]
	col_not_fixed = [8,9,10,11,49,15,18,14,45]
	col_fixed = [58,19,20,25,33,35,38,39,40,41,42,17,43,50,21,23,24,52,57,26,59,46,30,31,32,34,48,53]
	col_VinTrans = [12,54,55]
	unknown = [99,100]
	
	if tmpEvent in non_Collision: return 'Non-Collision'
	if tmpEvent in col_not_fixed: return 'Collision - Object Not Fixed'
	if tmpEvent in col_fixed: return 'Collision - Object Fixed'
	if tmpEvent in col_VinTrans: return 'Collisiion - Vehicle in Transport'
	if tmpEvent in unknown: return 'Unknown'
	return 'NA'
#end MostHarm_to_String

#FUNCTION CriticalEvent_to_String
#INPUT - the value from query
#OUTPUT - string description
def CriticalEvent_to_String(tmpValue):
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
		
	
	LossControl = [1,2,3,4,5,6,8,9]
	Edge = [10,11,12,13,14]
	Turning = [15,16]
	Crossing = [17]
	Decelerating = [18]
	OtherInLane = [50,51,52,53,54,55,56,59]
	OtherEncroaching = [60,61,62,63,64,65,66,67,68,70,71,72,73,74,78]
	PedCycle = [80,81,82,83,84,85]
	Animal = [87,88,89]
	Object = [90,91,92]
	Other = [19,98]
	unknown = [99,100]
	
	if tmpEvent in LossControl: return 'Vehicle Loss of Control'
	if tmpEvent in Edge: return 'Vehicle Travelling on Road Edge'
	if tmpEvent in Turning: return 'Vehicle Turning at Junction'
	if tmpEvent in Crossing: return 'Vehicle Crossing Intersection'
	if tmpEvent in Decelerating: return 'Vehicle Decelerating'
	if tmpEvent in OtherInLane: return 'Other Motor Vehicle in Lane'
	if tmpEvent in OtherEncroaching: return 'Other Motor Vehicle Encrouching Into Lane'
	if tmpEvent in PedCycle: return 'Pedestrian, Pedacyclist or Other Non-Motorist in Road'
	if tmpEvent in Animal: return 'Animal in Road'
	if tmpEvent in Object: return 'Object in Road'
	if tmpEvent in Other: return 'Other Event'
	if tmpEvent in unknown: return 'Unknown'
		
	return 'NA'
#end CriticalEvent_to_String


#MAIN CODE
for line in sys.stdin:
	output = []
	tokens = line.strip().split("\t")
	#CaseNum
	output.append(tokens[0])
	#Vehicle Number
	output.append(tokens[1])
	#Year
	output.append(tokens[2])
	#Num_Occupants	
	output.append(tokens[3])
	#Body_type
	output.append(BodyType_to_String(tokens[4]))
	#Mod_Year
	output.append(tokens[5])
	#Extent_Damage
	Extent2String = {'0': 'No Damage',
		'2': 'Minor Damage',
		'4': 'Functional Damage',
		'6': 'Disabling Damage',
		'8': 'Unknown',
		'9': 'Unknown'}
	try:
		output.append(MaxInjury2String[tokens[6]])
	except:
		output.append('NA') 
	#Most_Harm_Event
	output.append(MostHarm_to_String(tokens[7]))
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
		output.append(MaxInjury2String[tokens[8]])
	except:
		output.append('NA')
	#Driver Drinking
	Drinking2String = {'1': 'Alchohol Involved',
		'2': 'No Alcohol Involved',
		'8': 'No Driver Present',
		'9': 'Unknown'}
	try:
		output.append(Drinking2String[tokens[9]])
	except:
		output.append('NA') 
	#Speeding
	Speeding2String = {'0': 'No',
		'1': 'Yes',
		'8': 'No Driver Present',
		'9': 'Unknown'}
	try:
		output.append(Speeding2String[tokens[10]])
	except:
		output.append('NA') 	
	#travel speed
	output.append(tokens[11])
	#Pre-Event Movement
	PreMove2String ={'0': 'No Driver Present',
		'1': 'Going Straight',
		'2': 'Decelerating in Road',
		'3': 'Accelerating in Road',
		'4': 'Starting in Travel Lane',
		'5': 'Stopped in Road',
		'6': 'Passing or Overtaking Another Vehicle',
		'7': 'Disabled or Parked in Travel Lane',
		'8': 'Leaving a Parking Position',
		'9': 'Entering a Parking Position',
		'10': 'Turning Right',
		'11': 'Turning Left',
		'12': 'Making a U-turn',
		'13': 'Backing Up',
		'14': 'Negotiating a Curve',
		'15': 'Changing Lanes',
		'16': 'Merging',
		'17': 'Successful Corrective Action to Previous Critical Event',
		'98': 'Other',
		'99': 'Unknown'}
	try:
		output.append(PreMove2String[tokens[12]])
	except:
		output.append('NA') 
	#Critical_Event_Precrash
	output.append(CriticalEvent_to_String(tokens[13]))
	
	
	print("\t".join(output))

#!/usr/bin/python
import sys
import datetime
import string

#2005 Person


#FUNCTION SeatRow_to_String
#INPUT - the value from query
#OUTPUT - string description
def SeatRow_to_String(tmpValue):
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
		
	
	NonMotor = [0]
	Front = [11,12,13,18,19]
	Second = [21,22,23,28,29]
	Third = [31,32,33,38,39]
	Fourth = [41,42,43,48,49]
	Other = [50,51,52,53]
	unknown = [99,100]
	
	if tmpEvent in NonMotor: return 'Non-Motorist'
	if tmpEvent in Front: return 'Front Seat'
	if tmpEvent in Second: return 'Second Seat'
	if tmpEvent in Third: return 'Third Seat'
	if tmpEvent in Fourth: return 'Fourth Seat'
	if tmpEvent in Other: return 'Other Seat Location'
	if tmpEvent in unknown: return 'Unknown'
		
	return 'NA'
#end SeatRow_to_String

#FUNCTION SeatPosition_to_String
#INPUT - the value from query
#OUTPUT - string description
def SeatPosition_to_String(tmpValue):
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
		
	
	NonMotor = [0]
	Left = [11,21,31,41]
	Middle = [12,22,32,42]
	Right = [13,23,33,43]
	Other = [18,19,28,29,38,39,48,49]
	Sleeper = [50]
	Cargo = [51]
	Trailer = [52]
	Exterior = [53]
	unknown = [99,100]
	
	if tmpEvent in NonMotor: return 'Non-Motorist'
	if tmpEvent in Left: return 'Left Side'
	if tmpEvent in Middle: return 'Middle'
	if tmpEvent in Right: return 'Right Side'
	if tmpEvent in Other: return 'Other'
	if tmpEvent in Sleeper: return 'Sleeper Section of Cab'
	if tmpEvent in Cargo: return 'Cargo Area'
	if tmpEvent in Trailer: return 'Trailing Unit'
	if tmpEvent in Exterior: return 'Riding on Vehicle Exterior'
	if tmpEvent in unknown: return 'Unknown'
		
	return 'NA'
#end SeatPosition_to_String

#FUNCTION Restraint_to_String
#INPUT - the value from query
#OUTPUT - string description
def Restraint_to_String(tmpValue):
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
		
	
	Belt = [1,2,3]
	NotApplicable = [0]
	NotUsed = [7]
	Child = [6]
	Helmet = [5]
	Other = [8]
	unknown = [9,100]
	
	if tmpEvent in Belt: return 'Belt Restraint'
	if tmpEvent in NotApplicable: return 'Not Applicable'
	if tmpEvent in NotUsed: return 'No Restraint Used'
	if tmpEvent in Child: return 'Child Restraint'
	if tmpEvent in Helmet: return 'Helmet Used'
	if tmpEvent in Other: return 'Other'
	if tmpEvent in unknown: return 'Unknown'
		
	return 'NA'
#end Restraint_to_String



#MAIN CODE
for line in sys.stdin:
	output = []
	tokens = line.strip().split("\t")
	#CaseNum
	output.append(tokens[0])
	#Vehicle Number
	output.append(tokens[1])
	#Person Number
	output.append(tokens[2])
	#Year
	output.append(tokens[3])
	#Age
	output.append(tokens[4])
	#Sex
	Sex2String = {'1': 'Male',
		'2': 'Female',
		'9': 'Unknown'}
	try:
		output.append(Sex2String[tokens[5]])
	except:
		output.append('NA') 
	#person type
	PersonType2String = {'1': 'Driver',
		'2': 'Passenger',
		'9': 'Occupant - Unknown',
		'3': 'Occupant - Not in Transport',
		'4': 'Occupant - Non-Motor Vehicle',
		'5': 'Pedestrian',
		'6': 'Cyclist',
		'7': 'Other or Unknown Non-Occupant or Motorist',
		'8': 'Other or Unknown Non-Occupant or Motorist'}
	try:
		output.append(PersonType2String[tokens[6]])
	except:
		output.append('NA') 
	#injury severity
	Injury2String = {'0': 'No Injury',
		'1': 'Possible Injury',
		'2': 'Minor Injury',
		'3': 'Serious Injury',
		'4': 'Fatal Injury',
		'5': 'Injured, Severity Unknown',
		'6': 'Died Prior to Crash',
		'7': 'Unknown',
		'9': 'Unknown'}
	try:
		output.append(Injury2String[tokens[7]])
	except:
		output.append('NA')
	#seating position
	#Note - element is used to determine 2 target table elements	
	output.append(SeatRow_to_String(tokens[8]))
	output.append(SeatPosition_to_String(tokens[8]))
	#restraint use	
	output.append(Restraint_to_String(tokens[9]))
	#drinking
	drinking2String = {'0': 'No Alcohol Involved',
		'1': 'No Alcohol Involved',
		'2': 'Alcohol Involved',
		'6': 'Unknown',
		'7': 'Unknown',
		'9': 'Unknown'}
	try:
		output.append(drinking2String[tokens[10]])
	except:
		output.append('NA')
	#drugs
	drugs2String = {'0': 'No Drugs Involved',
		'1': 'No Drugs Involved',
		'2': 'Drugs Involved',
		'6': 'Unknown',
		'7': 'Unknown',
		'9': 'Unknown'}
	try:
		output.append(drugs2String[tokens[11]])
	except:
		output.append('NA')
	#striking vehicle
	output.append(tokens[12])
		
		
	print("\t".join(output))
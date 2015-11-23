#!/usr/bin/python
import sys
import datetime
import string

##Distract 2008

#FUNCTION Distraction_to_String
#INPUT - the value from query
#OUTPUT - string description
def Distraction_to_String(tmpValue):
	try:
		tmpEvent = int(tmpValue)
	except:
		tmpEvent = 100
	
	
	NotDistract = [0]
	NotSee = [1]
	Passenger = [3]
	ObjectInVehicle = [4]
	OnPhone = [5]
	PlayingPhone = [6,15]
	ClimateAudio = [7,8]
	CarControls = [9]
	Reaching = [10]
	OutsideEvent = [12]
	Eating = [13]
	Smoking = [14]
	Inattention = [97]
	Other = [98,92,11]
	unknown = [100,96,95,94,93,50,99]
	
	if tmpEvent in NotDistract: return 'Not Distracted'
	if tmpEvent in NotSee: return 'Looked but Did Not See'
	if tmpEvent in Passenger: return 'By other Passengers'
	if tmpEvent in ObjectInVehicle: return 'By a Moving Object in Vehicle'
	if tmpEvent in OnPhone: return 'Talking or Listening to Cellular Phone'
	if tmpEvent in PlayingPhone: return 'Manipulating Cellular Phone'
	if tmpEvent in ClimateAudio: return 'Adjusting Climate or Audio Controls'
	if tmpEvent in CarControls: return 'Adjusting Other Controls'
	if tmpEvent in Reaching: return 'Using or Reaching other Devices'
	if tmpEvent in OutsideEvent: return 'Distracted by Outside Person or Event'
	if tmpEvent in Eating: return 'Eating or Drinking'
	if tmpEvent in Smoking: return 'Smoking'
	if tmpEvent in Inattention: return 'Inattention - Lost in Thought'
	if tmpEvent in Other: return 'Other Distraction'
	if tmpEvent in unknown: return 'Unknown'
		
	return 'NA'
#end Distraction_to_String


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
	#Distract
	output.append(Distraction_to_String(tokens[3]))
	
	print("\t".join(output))

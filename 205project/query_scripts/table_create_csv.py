#!/usr/bin/python
from pyspark import SparkContext
from pyspark.sql import HiveContext
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys

glstTables = ["Accident", "Person", "Vehicle", "Distract"]
gstrDefaultError = "Usage: tablecsv.py tablename1 [tablename2] \n Valid Table Names: Accident Person Vehicle Distract"

gstrSelectAccident = "Accident.Case_Number, Accident.Year, Accident.Month, Accident.Day_of_Week, Accident.Hour, Accident.Region, Accident.Num_Vehicles, Accident.Num_ParkWork, Accident.Persons_Ped, Accident.Persons_NotTransit, Accident.Persons_Transit, Accident.First_Harm_Event, Accident.Manner_Collision, Accident.Within_Interchange, Accident.Relation_to_Junction, Accident.Intersection_Type, Accident.Work_Zone, Accident.Weather1, Accident.Weather2, Accident.Weather3, Accident.Max_Injury, Accident.Num_Injury, Accident.Alcohol_Involved"
gstrSelectPerson ="Person.Case_Number, Person.Vehicle_Number, Person.Person_Number, Person.Year, Person.Age, Person.Sex, Person.Person_Type, Person.Injury_Severity, Person.Seating_Row, Person.Seating_Position, Person.Restraint_Use, Person.Drinking, Person.Drugs, Person.Striking_Vehicle_Number"
gstrSelectVehicle ="Vehicle.Case_Number, Vehicle.Vehicle_Number, Vehicle.Year, Vehicle.Num_Occupants, Vehicle.Body_Type, Vehicle.Model_Year, Vehicle.Extent_Damage, Vehicle.Most_Harm_Event, Vehicle.Num_Injury, Vehicle.Max_Injury, Vehicle.Driver_Drinking, Vehicle.Speeding, Vehicle.Travel_Speed, Vehicle.Pre_Event_Movement, Vehicle.Critical_Event_Precrash, Vehicle.Accident_Category, Vehicle.Accident_Type"
gstrSelectDistract ="Distract.Case_Number, Distract.Vehicle_Number, Distract.Year, Distract.Factor"

gstrJoinAccident =", Accident.Month, Accident.Day_of_Week, Accident.Hour, Accident.Region, Accident.Num_Vehicles, Accident.Num_ParkWork, Accident.Persons_Ped, Accident.Persons_NotTransit, Accident.Persons_Transit, Accident.First_Harm_Event, Accident.Manner_Collision, Accident.Within_Interchange, Accident.Relation_to_Junction, Accident.Intersection_Type, Accident.Work_Zone, Accident.Weather1, Accident.Weather2, Accident.Weather3, Accident.Max_Injury, Accident.Num_Injury, Accident.Alcohol_Involved"
gstrJoinPerson =", Person.Age, Person.Sex, Person.Person_Type, Person.Injury_Severity, Person.Seating_Row, Person.Seating_Position, Person.Restraint_Use, Person.Drinking, Person.Drugs, Person.Striking_Vehicle_Number"
gstrJoinVehicle =", Vehicle.Num_Occupants, Vehicle.Body_Type, Vehicle.Model_Year, Vehicle.Extent_Damage, Vehicle.Most_Harm_Event, Vehicle.Num_Injury, Vehicle.Max_Injury, Vehicle.Driver_Drinking, Vehicle.Speeding, Vehicle.Travel_Speed, Vehicle.Pre_Event_Movement, Vehicle.Critical_Event_Precrash, Vehicle.Accident_Category, Vehicle.Accident_Type"
gstrJoinDistract =", Distract.Factor"

def SelectHeadings(strTable1, strTable2):
	#First table
	if strTable1 == "Accident":
		strSelect = gstrSelectAccident
	elif strTable1 == "Person":
		strSelect = gstrSelectPerson
	elif strTable1 == "Vehicle":
		strSelect = gstrSelectVehicle
	elif strTable1 == "Distract":
		strSelect = gstrSelectDistract
	
	#Second table
	if strTable1 <> "":
		if strTable2 == "Accident":
			strSelect = strSelect + gstrJoinAccident
		elif strTable2 == "Person":
			strSelect = strSelect + gstrJoinPerson
		elif strTable2 == "Vehicle":
			strSelect = strSelect + gstrJoinVehicle
		elif strTable2 == "Distract":
			strSelect = strSelect + gstrJoinDistract
		
	return strSelect
	
def SelectString(strTable1,strTable2):
	strSelect = "SELECT " + SelectHeadings(strTable1,strTable2)
	
	if strTable2 == "": #case of 1 table
		strFrom = " FROM " + strTable1
	else:  #case of 2 tables
		if strTable1 in ["Accident", "Person"] and strTable2 in ["Accident","Person"]:
			strFrom = " FROM Accident JOIN Person ON Accident.Case_Number = Person.Case_Number"
		if strTable1 in ["Accident", "Vehicle"] and strTable2 in ["Accident","Vehicle"]:
			strFrom = " FROM Accident JOIN Vehicle ON Accident.Case_Number = Vehicle.Case_Number"
		if strTable1 in ["Accident", "Distract"] and strTable2 in ["Accident","Distract"]:
			strFrom = " FROM Accident JOIN Distract ON Accident.Case_Number = Distract.Case_Number"
		if strTable1 in ["Person", "Vehicle"] and strTable2 in ["Person", "Vehicle"]:
			strFrom = " FROM Person JOIN Vehicle ON Person.Case_Number = Vehicle.Case_Number AND Person.Vehicle_Number = Vehicle.Vehicle_Number"
		if strTable1 in ["Person", "Distract"] and strTable2 in ["Person", "Distract"]:
			strFrom = " FROM Person JOIN Distract ON Person.Case_Number = Distract.Case_Number AND Person.Vehicle_Number = Distract.Vehicle_Number"
		if strTable1 in ["Vehicle", "Distract"] and strTable2 in ["Vehicle", "Distract"]:
			strFrom = " FROM Vehicle JOIN Distract ON Vehicle.Case_Number = Distract.Case_Number AND Vehicle.Vehicle_Number = Distract.Vehicle_Number"
	
	return strSelect + strFrom
	

if __name__ == '__main__':
			
	#Process arguments
	tables = sys.argv[1:]
	#ensure we have either 1 or 2 arguments
	if len(tables) == 0 or len(tables) > 2:	
		sys.exit(gstrDefaultError)
		
	#check if first argument is a valid table
	if tables[0] in glstTables: 
		strTable1 = tables[0]
	else:
		sys.exit(gstrDefaultError)
	

	if len(tables) == 1 or strTable1 == tables[1]: #process one table query
		strTable2 = ""
		strFileName = strTable1 + ".csv"
			
	elif len(tables) == 2: #process join query
		#check if second argument is a valid table
		if tables[1] in glstTables: 
			strTable2 = tables[1]
			strFileName = strTable1 + "_" + strTable2 + ".csv"
		else:
			sys.exit(gstrDefaultError)
	else:
			sys.exit(gstrDefaultError)
			
	strSQL = SelectString(strTable1,strTable2) 
	
	print strSQL
	
	

	#get data
	sc = SparkContext()
	sqlContext = HiveContext(sc)
	sqlContext.sql("use accident_project")
		
	df = sqlContext.sql(strSQL)

	#register as table
	sqlContext.registerDataFrameAsTable(df, "Results")
	
	#To CSV  Must loop for resources (not enough if we do everything at once).
	
	#get years
	df_years = sqlContext.sql("SELECT distinct Year from Results")
	
	print "Collecting Data"
	df_years.collect()
	
	first = True
	for row in df_years.rdd.toLocalIterator(): 
		print "Processing year " + row.Year
		df = sqlContext.sql("SELECT * FROM Results WHERE Year = " + row.Year)
		
		#to panda data frame
		pdf = df.toPandas()
		if first: 
			#set column headers
			pdf.columns = SelectHeadings(strTable1,strTable2).replace(".","_").split(', ')
			#write new file
			with open(strFileName,'w') as f:
				pdf.to_csv(f, header = True, index = False)
			first = False
		else:
			#append to file
			with open(strFileName,'a') as f:
				pdf.to_csv(f, header = False, index = False)
				
	
				
					
			
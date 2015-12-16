#!/usr/bin/python
from pyspark import SparkContext
from pyspark.sql import HiveContext
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys

#CREATE A TABLE WITH INJURIES OF PEOPLE 

if __name__ == '__main__':
	
	#get data
	sc = SparkContext()
	sqlContext = HiveContext(sc)
	sqlContext.sql("use accident_project")
	
	strSQL = "SELECT op.person_type, op.injury_severity, count(*) as mycount FROM Not_Distract_People op WHERE op.injury_severity not in ('Unknown') group by op.person_type, op.injury_severity UNION ALL SELECT 'DISTRACTED Driver', dd.injury_severity, count(*) as mycount FROM Distract_Drivers dd WHERE dd.injury_severity not in ('Unknown') group by dd.person_type, dd.injury_severity ORDER BY person_type"
	
	print strSQL
		
	df_injuries = sqlContext.sql(strSQL)

	strSQL_count = "SELECT op.person_type, count(*) as personcount FROM Not_Distract_People op WHERE op.injury_severity not in ('Unknown') group by op.person_type UNION SELECT 'DISTRACTED Driver', count(*) as personcount FROM Distract_Drivers dd WHERE dd.injury_severity not in ('Unknown') group by dd.person_type ORDER BY person_type"
	df_counts = sqlContext.sql(strSQL_count)
	
	#to panda data frame
	pdf_counts = df_counts.toPandas()
	pdf_injuries = df_injuries.toPandas()
	
	#determine percentage of each person type
	
	for idx,row in pdf_counts.iterrows():
		ptype_count = row[1]
		ptype = row[0]
		tmp_injuries = pdf_injuries.loc[(pdf_injuries['person_type'] == ptype)] #get the injuries for this person type
		#print tmp_injuries
		for tmp_idx, tmp_row in tmp_injuries.iterrows():
			tmp_ptype = tmp_row[0]
			tmp_inj = tmp_row[1]
			tmp_count = tmp_row[2]
			
			pdf_injuries.loc[(pdf_injuries['person_type']==tmp_ptype) & (pdf_injuries['injury_severity'] == tmp_inj), 'percent_of_type'] = 100.0 * tmp_count/ptype_count 

	pdf_injuries.columns = ['person_type', 'injury_severity', 'number_persons', 'percent_within_type']

	with open("person_injuries.csv",'w') as f:
		pdf_injuries.to_csv(f, header = True, index = False)
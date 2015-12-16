#!/usr/bin/python
from pyspark import SparkContext
from pyspark.sql import HiveContext
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys

#CREATE A TABLE WITH VEHICLE DAMAGE 

if __name__ == '__main__':
	
	strSQL = "SELECT 'NOT DISTRACTED' as Driver_Attention, v.extent_damage, count(*) as mycount from vehicle v join Not_Distract_Vehicles ndv on v.case_number = ndv.case_number and v.vehicle_number = ndv.vehicle_number group by v.extent_damage UNION ALL SELECT 'DISTRACTED DRIVER' as Driver_Attention, v.extent_damage, count(*) as mycount from vehicle v join  Distract_Vehicles dv on v.case_number = dv.case_number and v.vehicle_number = dv.vehicle_number group by v.extent_damage ORDER BY Driver_Attention, extent_damage"
	
	print strSQL
	
	
	#get data
	sc = SparkContext()
	sqlContext = HiveContext(sc)
	sqlContext.sql("use accident_project")
		
	df = sqlContext.sql(strSQL)

	#to panda data frame
	pdf = df.toPandas()

	attention_list = pdf['Driver_Attention'].unique()

	for att in attention_list:
		tmp_pdf = pdf.loc[(pdf['Driver_Attention'] == att)]
		
		tmp_sum = tmp_pdf['mycount'].sum()
		
		for idx, row in tmp_pdf.iterrows():
			tmp_att = row[0]
			tmp_damage = row[1]
			tmp_cnt = row[2]
			tmp_percent = 100.0 * tmp_cnt / tmp_sum
		
			pdf.loc[(pdf['extent_damage']==tmp_damage) & (pdf['Driver_Attention']==tmp_att), 'percent_of_vehicles'] = tmp_percent
		

	pdf.columns = ['driver_attention', 'extent_damage', 'number_vehicles', 'percent_vehicles']


	with open("vehicle_damage.csv",'w') as f:
		pdf.to_csv(f, header = True, index = False)
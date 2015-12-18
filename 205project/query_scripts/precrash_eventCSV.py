#!/usr/bin/python
from pyspark import SparkContext
from pyspark.sql import HiveContext
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys

#CREATE A TABLE WITH Critical Events 

if __name__ == '__main__':

	sc = SparkContext()
	sqlContext = HiveContext(sc)
	sqlContext.sql("use accident_project")

	
	#first getting some counts
	strSQL = "SELECT 'Not Distracted' as is_distracted, count(*) as mycount from Not_Distract_Vehicles UNION SELECT 'Distracted' as is_distracted, count(*) as mycount from Distract_Vehicles"
	
	dfcounts = sqlContext.sql(strSQL)
	
	pdf = dfcounts.toPandas()
	not_distracted_count = pdf.loc[(pdf['is_distracted']=='Not Distracted'), 'mycount']
	distracted_count = pdf.loc[(pdf['is_distracted']=='Distracted'), 'mycount']

	print not_distracted_count
	print distracted_count

	#now the real data
	strSQL = "select 'Not Distracted' as is_distracted, v.critical_event_precrash, count(*) as mycount from Not_Distract_Vehicles v group by v.critical_event_precrash union select 'Distracted' as is_distracted,  dv.critical_event_precrash, count(*) as mycount from Distract_Vehicles dv  group by dv.critical_event_precrash order by critical_event_precrash"
	
	df = sqlContext.sql(strSQL)
	
	print strSQL
	
	#to panda data frame
	pdf = df.toPandas()
	
	#Add  some counts and percentages.
	
	pdf['is_distracted_count']=0
	pdf['is_distracted_percent']=0
	
	#data for the not distracted
	pdf.loc[(pdf['is_distracted']=='Not Distracted'),'is_distracted_count'] = float(not_distracted_count)
	pdf.loc[(pdf['is_distracted']=='Not Distracted'),'is_distracted_percent'] = 1.0 * pdf.loc[(pdf['is_distracted']=='Not Distracted'),'mycount'] / pdf.loc[(pdf['is_distracted']=='Not Distracted'),'is_distracted_count'] * 100

	#data for the distracted
	pdf.loc[(pdf['is_distracted']=='Distracted'),'is_distracted_count'] = float(distracted_count)
	pdf.loc[(pdf['is_distracted']=='Distracted'),'is_distracted_percent'] = 1.0 * pdf.loc[(pdf['is_distracted']=='Distracted'),'mycount'] / pdf.loc[(pdf['is_distracted']=='Distracted'),'is_distracted_count'] * 100

	
	pdf.columns = ['driver_attention', 'critical_event_precrash', 'number_vehicles', 'is_distracted_count','percent_vehicles', ]

	with open("precrash_event.csv",'w') as f:
		pdf.to_csv(f, header = True, index = False)
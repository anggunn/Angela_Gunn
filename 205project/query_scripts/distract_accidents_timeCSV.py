#!/usr/bin/python
from pyspark import SparkContext
from pyspark.sql import HiveContext
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys

#CREATE A TABLE WITH accidents involving distractions over time

if __name__ == '__main__':

	strSQL_distract = "select  a.year, count(*) as distract_count from accident a join Distract_Accidents da on a.case_number = da.case_number group by a.year"
	strSQL_all = "select a.year, count(*) as total_count from accident a group by a.year"
	
	
	#get data
	sc = SparkContext()
	sqlContext = HiveContext(sc)
	sqlContext.sql("use accident_project")
		
	df_distract = sqlContext.sql(strSQL_distract)
	df_all = sqlContext.sql(strSQL_all)
	
	df_new = df_all.join(df_distract, "year")

	# To Pandas
	pdf = df_new.toPandas()

	#add percent_distract 
	pdf['percent_distract'] = 1.0 * pdf['distract_count'] / pdf['total_count'] * 100

	years = pdf['year'].unique()

	#calculate change in percent
	first = True
	for y in years:
	   
		if first:
			previous = pdf.loc[pdf['year'] == y, 'percent_distract']
			pdf.loc[pdf['year'] == y, 'percent_change'] = 0
			first = False
		else:
			current = pdf.loc[pdf['year'] == y, 'percent_distract']
			difference = float(current) - float(previous) * 1.0

			previous = current
			
			pdf.loc[pdf['year'] == y, 'percent_change'] =  difference
			
	pdf.year = pd.to_datetime("1" + "1" + pdf.year, format='%d%m%Y') #to change year to date format

	with open("distract_accidents_time.csv",'w') as f:
		pdf.to_csv(f, header = True, index = False)
	print pdf
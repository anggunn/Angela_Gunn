#!/usr/bin/python
from pyspark import SparkContext
from pyspark.sql import HiveContext
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys

#CREATE A TABLE WITH showing changes in distraction levels over time

if __name__ == '__main__':
	
	#get data
	sc = SparkContext()
	sqlContext = HiveContext(sc)
	sqlContext.sql("use accident_project")

	strSQL_factor = "select  d.year, d.factor as factor, count(*) as factor_count from distract d join distract_vehicles dv on d.case_number = dv.case_number and d.vehicle_number = dv.vehicle_number where d.factor not in ('Unknown') group by d.factor, d.year"
	strSQL_all = "select d.year, count(*) as year_all_factor_count from distract d  join distract_vehicles dv on d.case_number = dv.case_number and d.vehicle_number = dv.vehicle_number where d.factor not in ('Unknown') group by d.year"
		
	df_factor = sqlContext.sql(strSQL_factor)
	df_all = sqlContext.sql(strSQL_all)

	df = df_factor.join(df_all,'year')
	
	#to panda data frame
	pdf = df.toPandas()
	
	#Add  some counts and percentages.
		
	first = True

	years = pdf['year'].unique()
	factors = pdf['factor'].unique()


	for f in factors:
		first = True
		for y in years:
			#print pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f)]

			if first:
				previous = pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f), 'factor_count']
				pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f), 'percent_all_factors_year'] = 1.0 * pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f), 'factor_count'] / pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f), 'year_all_factor_count']
				pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f), 'percent_change'] = 0
				first = False
			else:
				current = pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f), 'factor_count']
				difference = float(current) - float(previous) * 1.0
		
				previous = current
				pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f), 'percent_all_factors_year'] = 1.0 * pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f), 'factor_count'] / pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f), 'year_all_factor_count']
				pdf.loc[(pdf['year'] == y) & (pdf['factor'] == f), 'percent_change'] = difference
					
	print str(pdf['year']) + '/01/01'
	pdf['year'] = pd.to_datetime(str(pdf['year']) + '/01/01')
	pdf.columns = ['year', 'factor', 'factor_count', 'year_all_factor_count','year_percent_all_factors', 'percent_change']
	print pdf
	
	with open("distract_levels_time.csv",'w') as f:
		pdf.to_csv(f, header = True, index = False)
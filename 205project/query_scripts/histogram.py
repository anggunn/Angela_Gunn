#!/usr/bin/python
from pyspark import SparkContext
from pyspark.sql import HiveContext
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys


gstrDefaultError = "Usage: histogram.py tablename field [year] \nValid Table Names: Accident Person Vehicle Distract \nSee documentation for field names"
glstTables = ["Accident", "Person", "Vehicle", "Distract"]



if __name__ == '__main__':
			
	#Process arguments
	arguments = sys.argv[1:]
	
	if len(arguments) < 2:
		sys.exit(gstrDefaultError)
	
	if arguments[0] in glstTables: 
		strTable = arguments[0]
	else:
		sys.exit(gstrDefaultError)
	
	strField = arguments[1]
	
	strTitle = strTable + "." + strField
	strFileName = strTable + "_" + strField
	
	
	if arguments[2].isdigit(): 
		strYear = arguments[2]
		strTitle = strTitle + " (" + strYear + ")"
		strFileName = strFileName + "_" + strYear + ".png"
	else:
		strYear = ""
		strTitle = strTitle + " (All Years) "
		strFileName = strFileName + "_All.png"
		
	strSelect = "SELECT " + strField + ", count(*) as count FROM " + strTable
	
	if strYear.isdigit(): strSelect = strSelect + " WHERE year = " + strYear
	
	strSelect = strSelect + " GROUP BY " + strField
	
	print strSelect
	
	#get data
	sc = SparkContext()
	sqlContext = HiveContext(sc)
	sqlContext.sql("use accident_project")
		
	df = sqlContext.sql(strSelect)
	
	df.show()
	
	pdf = df.toPandas()
	
	np_array= pdf.as_matrix()
	x = np_array[:,0]
	y = np_array[:,1]

	N = len(x)
	ind = np.arange(N) #the x locations for the groups
	width = 0.35
	
	#Create Histogram
	fig, ax = plt.subplots()
	rects1 = ax.bar(ind, y, width, color='blue', edgecolor = "none")

	
	ax.set_title(strTitle)
	ax.set_xticks(ind + width)

	# get rid of the bounding box:
	ax.spines['top'].set_visible(False)
	ax.spines['right'].set_visible(False)
	ax.spines['bottom'].set_visible(False)
	ax.spines['left'].set_visible(False)

	# set the the x-axis labels 
	ax.set_xticklabels(x)

	plt.tick_params(
	   axis='x',          # changes apply to the x-axis
	   which='both',      # both major and minor ticks are affected
	   bottom='off',      # ticks along the bottom edge are off
	   top='off',         # ticks along the top edge are off
	   left='off',
	   right='off')

	plt.savefig(strFileName)
		
	
	
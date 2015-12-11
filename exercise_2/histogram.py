#!/usr/bin/python
from __future__ import absolute_import,  unicode_literals
import sys
import psycopg2
import numpy as np
import matplotlib
# Force matplotlib to not use any Xwindows backend.
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def PrintHistogram(x,y,N):


        ind = np.arange(N)  # the x locations for the groups
        width = 0.5	  # the width of the bars

        fig, ax = plt.subplots()
        rects1 = ax.bar(ind, y, width, color='red', edgecolor = "none")

        ax.set_title('Histogram')
        ax.set_xticks(ind + width)

        # get rid of the bounding box:
        ax.spines['top'].set_visible(False)
        ax.spines['right'].set_visible(False)
        ax.spines['bottom'].set_visible(False)
        ax.spines['left'].set_visible(False)

        # set the the x-axis labels and rotate by 45 degrees
        ax.set_xticklabels(x, rotation=90 )

        plt.tick_params(
           axis='x',          # changes apply to the x-axis
           which='both',      # both major and minor ticks are affected
           bottom='off',      # ticks along the bottom edge are off
           top='off',         # ticks along the top edge are off
           left='off',
           right='off')

        plt.savefig('plot.png')
#end PrintHistogram

def Histogram(k1,k2):
        #connect to DB
        try:
                conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
               	cur = conn.cursor()
        except:
                sys.exit("Error connecting to DB")

        #get all words
        cur.execute("SELECT word, count from Tweetwordcount WHERE count >= " + str(k1) + " AND count <= " + str(k2) + " ORDER BY count")
        records = cur.fetchall()

        #output result
        x = []
	y = []
        for rec in records:
                print str(rec[0]) + ": " + str(rec[1])
                x.append(rec[0])
                y.append(rec[1])

        #create chart
        PrintHistogram(x,y, len(records))

        #clean up
        conn.commit()
        conn.close()

#END Histogram


#MAIN
if len(sys.argv) == 3:
        Histogram(sys.argv[1], sys.argv[2])
else:
        print "usage: python histogram.py k1 k2"



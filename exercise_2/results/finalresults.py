  GNU nano 2.0.9                                                     File: finalresults.py                                                                                                                  

#!/usr/bin/python
from __future__ import absolute_import,  unicode_literals
import sys
import psycopg2

#Finds Occurances of a single word
def FindOccurances(word):
        #connect to DB
        try:
            	conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
                cur = conn.cursor()
        except:
               	sys.exit("Error connecting to DB")

        #find the word
        cur.execute("SELECT word, count from Tweetwordcount WHERE word like '" + word + "'")
        records = cur.fetchall()

        #output the result
        for rec in records:
                print "Total number of occurrences of '" + str(word) +"': " + str(rec[1])

        #clean up
        conn.commit()
        conn.close()
#end FindOccurances

def ReturnALL():
        #connect to DB
        try:
            	conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
                cur = conn.cursor()
        except:
               	sys.exit("Error connecting to DB")

        #get all words
        cur.execute("SELECT word, count from Tweetwordcount ORDER BY word")
        records = cur.fetchall()

        #output one per line
        #output the result
        for rec in records:
                print rec


        #clean up
        conn.commit()
        conn.close()

#end ReturnALL


#MAIN
if len(sys.argv) == 2:
        FindOccurances(sys.argv[1])
else:
        ReturnALL()


		
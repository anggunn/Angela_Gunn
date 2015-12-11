#!/usr/bin/python
import psycopg2

#Script to create a table in the database tcount.
#must make sure tcount exists in postgres. This code is said to create the database if it doesn't exist, 
#but didn't work that way for me.

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

#Create a Table
#The first step is to create a cursor.

cur = conn.cursor()

cur.execute('''CREATE TABLE Tcount.Tweetwordcount
       (word TEXT PRIMARY KEY     NOT NULL,
       count INT     NOT NULL);''')
conn.commit()
conn.close()


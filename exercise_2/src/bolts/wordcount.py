rom __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2
import re

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()



    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount
        # Table name: Tweetwordcount
        # you need to create both the database and the table in advance.

		#clean up word
        word = re.sub(r'[^a-zA-Z0-9]','', word)


        #connect to DB
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()

        #Select from table
        cur.execute("SELECT word, count from Tweetwordcount WHERE word like '" + word + "'")
        records = cur.fetchall()

        if len(records) > 0 :
                #update the record(s)  shouldn't be more than 1, though.
                for rec in records:
                        cur.execute("UPDATE Tweetwordcount SET count=" + str(rec[1]+1) + " WHERE word= '" +  rec[0] + "'")
        else: #new word!
                #insert record
                try:
                     cur.execute("INSERT INTO Tweetwordcount (word,count) VALUES ('" + word + "', 1)");
                except:
                     oops = "do nothing"
        conn.commit()
        conn.close()

		
        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))







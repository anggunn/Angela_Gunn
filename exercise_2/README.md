# Angela Gunn
# W205-6 Exercise 2

## Steps to run the application:
1) Clone Github Repository from **https://github.com/anggunn/MIDSW205.
git**
The files you want are in the **MIDS-W205/exercise_2/** directory.
2) Create an instance using **ucbw205_complete_plus_postgres_PY2.7** and install Streamparse on it.
3) Make sure python 2.7 is the default python version.
4) Ensure all required libraries are installed: psycopg2, streamparse, tweepy
5) install psycopg by running: $pip install psycopg2
6) Create a project called EX2Tweetwordcount in Streamparse, using  
**$ sparse quickstart EX2Tweetwordcount**
7) Move the files in **MIDS-W205/exercise_2/EX2Tweetwordcount** to the appropriate directories in the new project:

| File Name        | Location           |   
| :------------- |:-------------|   
| Twittercredentials.py      | EX2Tweetwordcount/ 
| EX2tweetwordcount.clf      | EX2Tweetwordcount/topologies/      |   
| Tweets.py | EX2Tweetwordcount/src/spouts/
| Parse.py | EX2Tweetwordcount/src/bolts/
| Wordcount.py | EX2Tweetwordcount/src/bolts/
| createtable.py | EX2Tweetwordcount/ 

8) Ensure EX2tweetwordcount.clf is the only .clf file in EX2Tweetwordcount/topologies/
9) Edit Twittercredentials.py to use your Twitter credentials
10) In Postgres, create a database using the command: **CREATE DATABASE tcount;**
11) Execute the python file createtable.py: ** $python createtable.py
12) While in the EX2Tweetwordcount/ directory, start the application with the following command: **$ sparse run**

## Steps to run the Analysis:

### MIDS-W205/exercise_2/results/finalresults.py
This script gets a word as an argument and returns the total number of word occurences in the stream. Words are case sensitve.  
Example:  
**$ python finalresults.py hello**  
Total number of occurrences of 'hello': 130

Running finalresults.py without an argument returns all the words in the stream and their total count of occurrences, sorted alphabetically in an ascending order, one word per line.  
Example:  
**$ python finalresults.py**  
...  
('zude', 1)  
('zulran', 1)  
('Zuma', 5)  
('zumba', 2)  
('Zumba', 1)  
...

### MIDS-W205/exercise_2/results/histogram.py
This script gets two integers k1,k2 and returns all the words that their total number of occurrences in the stream is more or equal than k1 and less or equal than k2.  This method will also produce a histogram **plot.png**, saved to the current folder.  
Example:  
**$ python histogram.py 500 600**  
school: 501  
Love: 503  
Kanye: 506  
...

### MIDS-W205/exercise_2/results/histogram_top20.py
This script creates a histogram of the top 20 words in the database based on the count frequency of the word. The file the histogram is saved to is **hist_top20.png**  
Example:  
**$ python histogram_top20.py**

## Other Files
Some additional files:  
| File Name        | Location           |   Description  
| :------------- |:-------------|:----------   
| plot.png      | MIDS-W205/exercise_2/results/ | A plot taken from early in the run of the application
| plot500_600.png      | MIDS-W205/exercise_2/results/      |   A plot taken of words with count between 500 and 600
| hist_top20.png | MIDS-W205/exercise_2/results/ | A plot of the top 20 words with the highest count
| screenshot-extract-all_1.png | MIDS-W205/exercise_2/screenshots/ | A capture of the middle of the output from finalresults.py with no parameters provided.
| screenshot-extract-all_2.png | MIDS-W205/exercise_2/screenshots/ | A capture of the end of the output from finalresults.py with no parameters provided.
| screenshot-twitterStream.png | MIDS-W205/exercise_2/screenshots/ | A capture of the application running, showing the output of the words coming from the wordcount.py bolt.



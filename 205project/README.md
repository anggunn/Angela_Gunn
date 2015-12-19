# Accident Project (Angela Gunn)

## Environment Requirements:
This project installation has been tested with the following configurations:  

    AMI: ucbw205_complete_plus_postgres_PY2.7 (ami-558fc730)  
    EBS Volume: 100 GiB  
    Spark 1.5  
    Python 1.7  
    Python Libraries pandas, numpy, matplotlib
    
If further assistance is needed, please reference the EASY BUTTON document:
https://github.com/anggunn/MIDS-W205/blob/master/EASYBUTTON.pdf

Required libraries may be installed with the below commands:  

    $ pip install pandas  
    $ pip install numpy  
    $ pip install matplotlib

## Steps to run the application:
1) Clone Github Repository from **https://github.com/anggunn/MIDSW205.git**  

    git clone https://anggunn:j6uKY8iL0g@github.com/anggunn/MIDS-W205.git

The files you want are in the **MIDS-W205/205project/** directory.  
2) Make sure python 2.7 is the default python version.  
4) Ensure all required libraries are installed: pandas, numpy, matplotlib  
5) Navigate to the 205project directory  
6) Run the following command:  

    $ bash start_up.sh

This script takes about 30 minute to run.  

Once the script is completed, you can navigate to the query_scripts directory and execute the files there. Read the Accident_Project_Documentation.pdf for further information.  

Note the query scripts are written with pyspark, and such need to be excuted with pyspark-submit.

**BONUS FILES**  
If you should ever need it, I included a script for dropping the HIVE database created from this project.
Also, I included my files from the Tableau visualizations, but I don't know if they will work on another computer or not.


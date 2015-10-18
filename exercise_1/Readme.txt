README

Full solutions to exercise 1.

The scripts run very slow. I have learned from this experience that though it is possible
to do all the work in HIVE SQL scripts, it possibly isn't the best solution. 
Some of the scripts require well over 10 jobs to complete.
Though views are not necessary for the queries, they do make the code slightly more readable,
and certainly more managable when errors are detected.

PLEASE NOTE:
It is expected the investigations will be executed in the below order, as stated in the assignment:
1.	best_hospitals
2.	best_states
3.	hospital_variability 
4.	hospitals_and_patients

Failure to execute the investigations in this order will result in a failure, 
specifically of the hospitals_and_patients scripts which require views
created in best_hospitals.

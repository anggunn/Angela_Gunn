USE accident_project;

--Create a bunch of useful views

--view of all accidents involving distractions
DROP VIEW IF EXISTS Distract_Accidents;
CREATE VIEW Distract_Accidents
AS Select d.case_number from distract d where d.factor not in ('Not Distracted', 'Unknown');

--view of all persons who are distracted drivers
DROP VIEW IF EXISTS Distract_Drivers;
CREATE VIEW Distract_Drivers
AS SELECT p.* FROM person p  
join distract d on p.case_number = d.case_number and p.vehicle_number = d.vehicle_number 
join Distract_Accidents da on p.case_number = da.case_number 
WHERE p.person_type = 'Driver' AND d.factor not in  ('Not Distracted', 'Unknown');

--view of all persons who are not distracted drivers, including drivers who are not distracted
DROP VIEW IF EXISTS Not_Distract_People;
CREATE VIEW Not_Distract_People
AS SELECT p.* FROM person p   
join distract d on p.case_number = d.case_number and p.vehicle_number = d.vehicle_number  
join Distract_Accidents da on p.case_number = da.case_number  
WHERE p.person_type = 'Driver' 
AND d.factor in  ('Not Distracted') 
UNION ALL
SELECT p.*  
FROM person p   
WHERE p.person_type <> 'Driver';

--view of all vehicles with distracted drivers
DROP VIEW IF EXISTS Distract_Vehicles;
CREATE VIEW Distract_Vehicles
AS select distinct v.* 
from vehicle v 
join distract d on v.case_number = d.case_number and v.vehicle_number = d.vehicle_number 
join Distract_Accidents da on v.case_number = da.case_number 
where d.factor not in ('Not Distracted', 'Unknown');

--view of all vehicles without distracted drivers
DROP VIEW IF EXISTS Not_Distract_Vehicles;
CREATE VIEW Not_Distract_Vehicles
AS select distinct v.*
from vehicle v 
join distract d on v.case_number = d.case_number and v.vehicle_number = d.vehicle_number 
where d.factor in ('Not Distracted');




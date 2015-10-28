CREATE DATABASE IF NOT EXISTS accident_project;
USE accident_project;

DROP TABLE ACCIDENT_2013;
CREATE EXTERNAL TABLE ACCIDENT_2013 
(
CASENUM varchar(500),  
WKDY_IM varchar(500),  
HOUR_IM varchar(500),  
MINUTE_IM varchar(500),  
EVENT1_IM varchar(500),  
MANCOL_IM varchar(500),  
RELJCT1_IM varchar(500),  
RELJCT2_IM varchar(500),  
LGTCON_IM varchar(500),  
WEATHR_IM varchar(500),  
MAXSEV_IM varchar(500),  
NO_INJ_IM varchar(500),  
ALCHL_IM varchar(500),  
LAND_USE varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
VE_TOTAL varchar(500),  
VE_FORMS varchar(500),  
PVH_INVL varchar(500),  
PEDS varchar(500),  
PERMVIT varchar(500),  
PERNOTMVIT varchar(500),  
NUM_INJ varchar(500),  
MONTH varchar(500),  
YEAR varchar(500),  
DAY_WEEK varchar(500),  
HOUR varchar(500),  
MINUTE varchar(500),  
HARM_EV varchar(500),  
ALCOHOL varchar(500),  
MAX_SEV varchar(500),  
MAN_COLL varchar(500),  
RELJCT1 varchar(500),  
RELJCT2 varchar(500),  
TYP_INT varchar(500),  
WRK_ZONE varchar(500),  
REL_ROAD varchar(500),  
LGT_COND varchar(500),  
WEATHER1 varchar(500),  
WEATHER2 varchar(500),  
WEATHER varchar(500),  
SCH_BUS varchar(500),  
INT_HWY varchar(500),  
CF1 varchar(500),  
CF2 varchar(500),  
CF3 varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/ACCIDENT';



DROP TABLE CEVENT_2013;
CREATE EXTERNAL TABLE CEVENT_2013 
(
CASENUM varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
EVENTNUM varchar(500),  
VNUMBER1 varchar(500),  
AOI1 varchar(500),  
SOE varchar(500),  
VNUMBER2 varchar(500),  
AOI2 varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/CEVENT';


DROP TABLE DAMAGE_2013;
CREATE EXTERNAL TABLE DAMAGE_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
MDAREAS varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/DAMAGE';


DROP TABLE FACTOR_2013;
CREATE EXTERNAL TABLE FACTOR_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
MFACTOR varchar(500) 
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/FACTOR';



DROP TABLE NMIMPAIR_2013;
CREATE EXTERNAL TABLE NMIMPAIR_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
PER_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
NMIMPAIR varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/NMIMPAIR';




DROP TABLE PERSON_2013;
CREATE EXTERNAL TABLE PERSON_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
PER_NO varchar(500),  
SEX_IM varchar(500),  
INJSEV_IM varchar(500),  
EJECT_IM varchar(500),  
PERALCH_IM varchar(500),  
SEAT_IM varchar(500),  
AGE_IM varchar(500),  
VE_FORMS varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
STR_VEH varchar(500),  
MONTH varchar(500),  
HOUR varchar(500),  
MINUTE varchar(500),  
HARM_EV varchar(500),  
MAN_COLL varchar(500),  
SCH_BUS varchar(500),  
MAKE varchar(500),  
BODY_TYP varchar(500),  
MOD_YEAR varchar(500),  
TOW_VEH varchar(500),  
SPEC_USE varchar(500),  
EMER_USE varchar(500),  
ROLLOVER varchar(500),  
IMPACT1 varchar(500),  
FIRE_EXP varchar(500),  
AGE varchar(500),  
SEX varchar(500),  
PER_TYP varchar(500),  
INJ_SEV varchar(500),  
SEAT_POS varchar(500),  
REST_USE varchar(500),  
REST_MIS varchar(500),  
AIR_BAG varchar(500),  
EJECTION varchar(500),  
DRINKING varchar(500),  
ALC_STATUS varchar(500),  
ATST_TYP varchar(500),  
ALC_RES varchar(500),  
DRUGS varchar(500),  
DSTATUS varchar(500),  
DRUGTST1 varchar(500),  
DRUGTST2 varchar(500),  
DRUGTST3 varchar(500),  
DRUGRES1 varchar(500),  
DRUGRES2 varchar(500),  
DRUGRES3 varchar(500),  
HOSPITAL varchar(500),  
P_SF1 varchar(500),  
P_SF2 varchar(500),  
P_SF3 varchar(500),  
LOCATION varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/PERSON';




DROP TABLE VEVENT_2013;
CREATE EXTERNAL TABLE VEVENT_2013 
(
CASENUM varchar(500),  
EVENTNUM varchar(500),  
VEH_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
VEVENTNUM varchar(500),  
VNUMBER1 varchar(500),  
AOI1 varchar(500),  
SOE varchar(500),  
VNUMBER2 varchar(500),  
AOI2 varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/VEVENT';





DROP TABLE VSOE_2013;
CREATE EXTERNAL TABLE VSOE_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
VEVENTNUM varchar(500),  
SOE varchar(500),  
AOI varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/VSOE';  





DROP TABLE DISTRACT_2013;
CREATE EXTERNAL TABLE DISTRACT_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
MDRDSTRD varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/DISTRACT';  




DROP TABLE MANEUVER_2013;
CREATE EXTERNAL TABLE MANEUVER_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
MDRMANAV varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/MANEUVER';  




DROP TABLE NMPRIOR_2013;
CREATE EXTERNAL TABLE NMPRIOR_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
PER_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
MPR_ACT varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/NMPRIOR';  




DROP TABLE SAFETYEQ_2013;
CREATE EXTERNAL TABLE SAFETYEQ_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
PER_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
MSAFEQMT varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/SAFETYEQ';  


DROP TABLE VIOLATN_2013;
CREATE EXTERNAL TABLE VIOLATN_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
MVIOLATN varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/VIOLATN';  




DROP TABLE DRIMPAIR_2013;
CREATE EXTERNAL TABLE DRIMPAIR_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
DRIMPAIR varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/DRIMPAIR';  



DROP TABLE NMCRASH_2013;
CREATE EXTERNAL TABLE NMCRASH_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
PER_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
MTM_CRSH varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/NMCRASH';  





DROP TABLE PARKWORK_2013;
CREATE EXTERNAL TABLE PARKWORK_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
PVE_FORMS varchar(500),  
PNUMOCCS varchar(500),  
PMONTH varchar(500),  
PHOUR varchar(500),  
PMINUTE varchar(500),  
PHARM_EV varchar(500),  
PMAN_COLL varchar(500),  
PTYPE varchar(500),  
PHIT_RUN varchar(500),  
PMAKE varchar(500),  
PMODEL varchar(500),  
PBODYTYP varchar(500),  
PMODYEAR varchar(500),  
PVIN varchar(500),  
PTRAILER varchar(500),  
PMCARR_I1 varchar(500),  
PMCARR_I2 varchar(500),  
PMCARR_ID varchar(500),  
PGVWR varchar(500),  
PV_CONFIG varchar(500),  
PCARGTYP varchar(500),  
PHAZ_INV varchar(500),  
PHAZPLAC varchar(500),  
PHAZ_ID varchar(500),  
PHAZ_CNO varchar(500),  
PHAZ_REL varchar(500),  
PBUS_USE varchar(500),  
PSP_USE varchar(500),  
PEM_USE varchar(500),  
PIMPACT1 varchar(500),  
PVEH_SEV varchar(500),  
PTOWED varchar(500),  
PM_HARM varchar(500),  
PVEH_SC1 varchar(500),  
PVEH_SC2 varchar(500),  
PFIRE varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/PARKWORK';  





DROP TABLE VEHICLE_2013;
CREATE EXTERNAL TABLE VEHICLE_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
HITRUN_IM varchar(500),  
BDYTYP_IM varchar(500),  
MDLYR_IM varchar(500),  
IMPACT1_IM varchar(500),  
VEVENT_IM varchar(500),  
PCRASH1_IM varchar(500),  
MXVSEV_IM varchar(500),  
NUMINJ_IM varchar(500),  
V_ALCH_IM varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
VE_FORMS varchar(500),  
NUMOCCS varchar(500),  
MONTH varchar(500),  
HOUR varchar(500),  
MINUTE varchar(500),  
HARM_EV varchar(500),  
MAN_COLL varchar(500),  
UNITTYPE varchar(500),  
HIT_RUN varchar(500),  
MAKE varchar(500),  
MODEL varchar(500),  
BODY_TYP varchar(500),  
MOD_YEAR varchar(500),  
VIN varchar(500),  
TOW_VEH varchar(500),  
J_KNIFE varchar(500),  
MCARR_I1 varchar(500),  
MCARR_I2 varchar(500),  
MCARR_ID varchar(500),  
GVWR varchar(500),  
V_CONFIG varchar(500),  
CARGO_BT varchar(500),  
HAZ_INV varchar(500),  
HAZ_PLAC varchar(500),  
HAZ_ID varchar(500),  
HAZ_CNO varchar(500),  
HAZ_REL varchar(500),  
BUS_USE varchar(500),  
SPEC_USE varchar(500),  
EMER_USE varchar(500),  
TRAV_SP varchar(500),  
ROLLOVER varchar(500),  
ROLINLOC varchar(500),  
IMPACT1 varchar(500),  
DEFORMED varchar(500),  
TOWED varchar(500),  
M_HARM varchar(500),  
VEH_SC1 varchar(500),  
VEH_SC2 varchar(500),  
VEH_ALCH varchar(500),  
MAX_VSEV varchar(500),  
NUM_INJV varchar(500),  
FIRE_EXP varchar(500),  
DR_PRES varchar(500),  
DR_ZIP varchar(500),  
SPEEDREL varchar(500),  
DR_SF1 varchar(500),  
DR_SF2 varchar(500),  
DR_SF3 varchar(500),  
DR_SF4 varchar(500),  
VTRAFWAY varchar(500),  
VNUM_LAN varchar(500),  
VSPD_LIM varchar(500),  
VALIGN varchar(500),  
VPROFILE varchar(500),  
VSURCOND varchar(500),  
VTRAFCON varchar(500),  
VTCONT_F varchar(500),  
P_CRASH1 varchar(500),  
P_CRASH2 varchar(500),  
P_CRASH3 varchar(500),  
PCRASH4 varchar(500),  
PCRASH5 varchar(500),  
ACC_TYPE varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/VEHICLE';  

 

DROP TABLE VISION_2013;
CREATE EXTERNAL TABLE VISION_2013 
(
CASENUM varchar(500),  
VEH_NO varchar(500),  
WEIGHT varchar(500),  
REGION varchar(500),  
STRATUM varchar(500),  
PJ varchar(500),  
PSU varchar(500),  
PSUSTRAT varchar(500),  
MVISOBSC varchar(500)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2013/VISION';  


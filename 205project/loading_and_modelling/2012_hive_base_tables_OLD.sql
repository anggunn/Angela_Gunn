CREATE DATABASE IF NOT EXISTS accident_project;
USE accident_project;

DROP TABLE ACCIDENT_2012;
CREATE EXTERNAL TABLE ACCIDENT_2012 
(
CASENUM INT,  
WKDY_IM INT,  
HOUR_IM INT,  
MINUTE_IM INT,  
MANCOL_IM INT,  
RELJCT1_IM INT,  
RELJCT2_IM INT,  
LGTCON_IM INT,  
WEATHR_IM INT,  
EVENT1_IM INT,
MAXSEV_IM INT,  
NO_INJ_IM INT,  
ALCHL_IM INT,  
LAND_USE INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
VE_TOTAL INT,  
VE_FORMS INT,  
PVH_INVL INT,  
PEDS INT,  
PERMVIT INT,  
PERNOTMVIT INT,  
NUM_INJ INT,  
MONTH INT,  
YEAR INT,  
DAY_WEEK INT,  
HOUR INT,  
MINUTE INT,  
HARM_EV INT,  
ALCOHOL INT,  
MAX_SEV INT,  
MAN_COLL INT,  
RELJCT1 INT,  
RELJCT2 INT,  
TYP_INT INT,  
WRK_ZONE INT,  
REL_ROAD INT,  
LGT_COND INT,  
WEATHER1 INT,  
WEATHER2 INT,  
WEATHER INT,  
SCH_BUS INT,  
INT_HWY INT,  
CF1 INT,  
CF2 INT,  
CF3 INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/ACCIDENT';



DROP TABLE CEVENT_2012;
CREATE EXTERNAL TABLE CEVENT_2012 
(
CASENUM INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
EVENTNUM INT,  
VNUMBER1 INT,  
AOI1 INT,  
SOE INT,  
VNUMBER2 INT,  
AOI2 INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/CEVENT';


DROP TABLE DAMAGE_2012;
CREATE EXTERNAL TABLE DAMAGE_2012 
(
CASENUM INT,  
VEH_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
MDAREAS INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/DAMAGE';


DROP TABLE FACTOR_2012;
CREATE EXTERNAL TABLE FACTOR_2012 
(
CASENUM INT,  
VEH_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
MFACTOR INT 
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/FACTOR';



DROP TABLE NMIMPAIR_2012;
CREATE EXTERNAL TABLE NMIMPAIR_2012 
(
CASENUM INT,  
VEH_NO INT,  
PER_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
NMIMPAIR INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/NMIMPAIR';




DROP TABLE PERSON_2012;
CREATE EXTERNAL TABLE PERSON_2012 
(
CASENUM INT,  
VEH_NO INT,  
PER_NO INT,  
SEX_IM INT,  
INJSEV_IM INT,  
EJECT_IM INT,  
PERALCH_IM INT,  
SEAT_IM INT,  
AGE_IM INT,  
VE_FORMS INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
STR_VEH INT,  
MONTH INT,  
HOUR INT,  
MINUTE INT,  
HARM_EV INT,  
MAN_COLL INT,  
SCH_BUS INT,  
MAKE INT,  
BODY_TYP INT,  
MOD_YEAR INT,  
TOW_VEH INT,  
SPEC_USE INT,  
EMER_USE INT,  
ROLLOVER INT,  
IMPACT1 INT,  
FIRE_EXP INT,  
AGE INT,  
SEX INT,  
PER_TYP INT,  
INJ_SEV INT,  
SEAT_POS INT,  
REST_USE INT,  
REST_MIS INT,  
AIR_BAG INT,  
EJECTION INT,  
DRINKING INT,  
ALC_STATUS INT,  
ATST_TYP INT,  
ALC_RES INT,  
DRUGS INT,  
DSTATUS INT,  
DRUGTST1 INT,  
DRUGTST2 INT,  
DRUGTST3 INT,  
DRUGRES1 INT,  
DRUGRES2 INT,  
DRUGRES3 INT,  
HOSPITAL INT,  
P_SF1 INT,  
P_SF2 INT,  
P_SF3 INT,  
LOCATION INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/PERSON';




DROP TABLE VEVENT_2012;
CREATE EXTERNAL TABLE VEVENT_2012 
(
CASENUM INT,  
EVENTNUM INT,  
VEH_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
VEVENTNUM INT,  
VNUMBER1 INT,  
AOI1 INT,  
SOE INT,  
VNUMBER2 INT,  
AOI2 INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/VEVENT';





DROP TABLE VSOE_2012;
CREATE EXTERNAL TABLE VSOE_2012 
(
CASENUM INT,  
VEH_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
VEVENTNUM INT,  
SOE INT,  
AOI INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/VSOE';  





DROP TABLE DISTRACT_2012;
CREATE EXTERNAL TABLE DISTRACT_2012 
(
CASENUM INT,  
VEH_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
MDRDSTRD INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/DISTRACT';  




DROP TABLE MANEUVER_2012;
CREATE EXTERNAL TABLE MANEUVER_2012 
(
CASENUM INT,  
VEH_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
MDRMANAV INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/MANEUVER';  




DROP TABLE NMPRIOR_2012;
CREATE EXTERNAL TABLE NMPRIOR_2012 
(
CASENUM INT,  
VEH_NO INT,  
PER_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
MPR_ACT INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/NMPRIOR';  




DROP TABLE SAFETYEQ_2012;
CREATE EXTERNAL TABLE SAFETYEQ_2012 
(
CASENUM INT,  
VEH_NO INT,  
PER_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
MSAFEQMT INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/SAFETYEQ';  


DROP TABLE VIOLATN_2012;
CREATE EXTERNAL TABLE VIOLATN_2012 
(
CASENUM INT,  
VEH_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
MVIOLATN INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/VIOLATN';  




DROP TABLE DRIMPAIR_2012;
CREATE EXTERNAL TABLE DRIMPAIR_2012 
(
CASENUM INT,  
VEH_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
DRIMPAIR INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/DRIMPAIR';  



DROP TABLE NMCRASH_2012;
CREATE EXTERNAL TABLE NMCRASH_2012 
(
CASENUM INT,  
VEH_NO INT,  
PER_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
MTM_CRSH INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/NMCRASH';  





DROP TABLE PARKWORK_2012;
CREATE EXTERNAL TABLE PARKWORK_2012 
(
CASENUM INT,  
VEH_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
PVE_FORMS INT,  
PNUMOCCS INT,  
PMONTH INT,  
PHOUR INT,  
PMINUTE INT,  
PHARM_EV INT,  
PMAN_COLL INT,  
PTYPE INT,  
PHIT_RUN INT,  
PMAKE INT,  
PMODEL INT,  
PBODYTYP INT,  
PMODYEAR INT,  
PVIN INT,  
PTRAILER INT,  
PMCARR_I1 varchar(500),  
PMCARR_I2 varchar(500),  
PMCARR_ID varchar(500),  
PGVWR INT,  
PV_CONFIG INT,  
PCARGTYP INT,  
PHAZ_INV INT,  
PHAZPLAC INT,  
PHAZ_ID INT,  
PHAZ_CNO INT,  
PHAZ_REL INT,  
PBUS_USE INT,  
PSP_USE INT,  
PEM_USE INT,  
PIMPACT1 INT,  
PVEH_SEV INT,  
PTOWED INT,  
PM_HARM INT,  
PVEH_SC1 INT,  
PVEH_SC2 INT,  
PFIRE INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/PARKWORK';  





DROP TABLE VEHICLE_2012;
CREATE EXTERNAL TABLE VEHICLE_2012 
(
CASENUM INT,  
VEH_NO INT,  
HITRUN_IM INT,  
BDYTYP_IM INT,  
MDLYR_IM INT,  
IMPACT1_IM INT,  
VEVENT_IM INT,  
PCRASH1_IM INT,  
MXVSEV_IM INT,  
NUMINJ_IM INT,  
V_ALCH_IM INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
VE_FORMS INT,  
NUMOCCS INT,  
MONTH INT,  
HOUR INT,  
MINUTE INT,  
HARM_EV INT,  
MAN_COLL INT,  
UNITTYPE INT,  
HIT_RUN INT,  
MAKE INT,  
MODEL INT,  
BODY_TYP INT,  
MOD_YEAR INT,  
VIN varchar(500),  
TOW_VEH INT,  
J_KNIFE INT,  
MCARR_I1 varchar(500),  
MCARR_I2 varchar(500),  
MCARR_ID varchar(500),  
GVWR INT,  
V_CONFIG INT,  
CARGO_BT INT,  
HAZ_INV INT,  
HAZ_PLAC INT,  
HAZ_ID INT,  
HAZ_CNO INT,  
HAZ_REL INT,  
BUS_USE INT,  
SPEC_USE INT,  
EMER_USE INT,  
TRAV_SP INT,  
ROLLOVER INT,  
ROLINLOC INT,  
IMPACT1 INT,  
DEFORMED INT,  
TOWED INT,  
M_HARM INT,  
VEH_SC1 INT,  
VEH_SC2 INT,  
VEH_ALCH INT,  
MAX_VSEV INT,  
NUM_INJV INT,  
FIRE_EXP INT,  
DR_PRES INT,  
DR_ZIP varchar(500),  
SPEEDREL INT,  
DR_SF1 INT,  
DR_SF2 INT,  
DR_SF3 INT,  
DR_SF4 INT,  
VTRAFWAY INT,  
VNUM_LAN INT,  
VSPD_LIM INT,  
VALIGN INT,  
VPROFILE INT,  
VSURCOND INT,  
VTRAFCON INT,  
VTCONT_F INT,  
P_CRASH1 INT,  
P_CRASH2 INT,  
P_CRASH3 INT,  
PCRASH4 INT,  
PCRASH5 INT,  
ACC_TYPE INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/VEHICLE';  

 

DROP TABLE VISION_2012;
CREATE EXTERNAL TABLE VISION_2012 
(
CASENUM INT,  
VEH_NO INT,  
WEIGHT INT,  
REGION INT,  
STRATUM INT,  
PJ INT,  
PSU INT,  
PSUSTRAT INT,  
MVISOBSC INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2012/VISION';  

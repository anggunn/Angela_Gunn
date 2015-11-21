CREATE DATABASE IF NOT EXISTS accident_project;
USE accident_project;

DROP TABLE ACCIDENT_2011;
CREATE EXTERNAL TABLE ACCIDENT_2011 
(
CASENUM INT,  
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
ALCHL_IM INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2011/ACCIDENT';



DROP TABLE VEHICLE_2011;
CREATE EXTERNAL TABLE VEHICLE_2011 
(
CASENUM INT,
VEH_NO INT,
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
IMPACT2 INT,
DEFORMED INT,
TOWED INT,
M_HARM INT,
VEH_ALCH INT,
MAX_VSEV INT,
NUM_INJV INT,
FIRE_EXP INT,
DR_PRES INT,
DR_ZIP varchar(500),
SPEEDREL INT,
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
ACC_TYPE INT,
HITRUN_IM INT,
BDYTYP_IM INT,
MDLYR_IM INT,
IMPACT1_IM INT,
PCRASH1_IM INT,
VEVENT_IM INT,
MXVSEV_IM INT,
NUMINJ_IM INT,
V_ALCH_IM INT


)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2011/VEHICLE';  



DROP TABLE PERSON_2011;
CREATE EXTERNAL TABLE PERSON_2011 
(
CASENUM INT,  
VE_FORMS INT,  
VEH_NO INT,  
PER_NO INT,  
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
IMPACT2 INT,
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
LOCATION INT,
SEX_IM INT,
INJ_SEV_IM INT,
EJECT_IM INT,
PERALCH_IM INT,
SEAT_IM INT,
AGE_IM INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2011/PERSON';


DROP TABLE DISTRACT_2011;
CREATE EXTERNAL TABLE DISTRACT_2011 
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
LOCATION '/user/w205/accident_project/2011/DISTRACT';
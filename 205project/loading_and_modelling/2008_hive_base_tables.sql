CREATE DATABASE IF NOT EXISTS accident_project;
USE accident_project;

DROP TABLE ACCIDENT_2008;
CREATE EXTERNAL TABLE ACCIDENT_2008 
(
CASENUM INT,
SPDLIM_H INT,
HOUR_I INT,
MINUTE_I INT,
RELJCT_I INT,
ALIGN_I INT,
PROFIL_I INT,
SURCON_I INT,
TRFCON_I INT,
LGTCON_I INT,
WEATHR_I INT,
MANCOL_I INT,
EVENT1_I INT,
WEIGHT INT,
MONTH INT,
WEEKDAY INT,
REGION INT,
LAND_USE INT,
MAN_COL INT,
INT_HWY INT,
REL_JCT INT,
REL_RWY INT,
LGHT_CON INT,
WEATHER INT,
SCHL_BUS INT,
WRK_ZONE INT,
ALCOHOL INT,
EVENT1 INT,
MAX_SEV INT,
STRATUM INT,
TRAF_WAY INT,
SUR_COND INT,
PROFILE INT,
ALIGN INT,
TRAF_CON INT,
EMS INT,
HOUR INT,
MINUTE INT,
NON_INVL INT,
NUM_INJ INT,
NUM_LAN INT,
PED_ACC INT,
PJ INT,
PSU INT,
PSUSTRAT INT,
PVH_INVL INT,
SPD_LIM INT,
VEH_INVL INT,
YEAR INT,
WKDY_I INT,
MAXSEV_I INT,
NO_INJ_I INT,
ALCHL_I INT

)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2008/ACCIDENT';

DROP TABLE VEHICLE_2008;
CREATE EXTERNAL TABLE VEHICLE_2008 
(
CASENUM INT,
VIN varchar(500),
WEIGHT INT,
HAZM_NO INT,
MODEL_YR INT,
DAM_AREA INT,
DZIPCODE varchar(500),
CARIDNUM INT,
REGION INT,
HIT_RUN INT,
MAKE INT,
BODY_TYP INT,
SPEC_USE INT,
EMCY_USE INT,
TRAILER INT,
JACKNIFE INT,
FIRE INT,
VTRAFCON INT,
VEH_SEV INT,
TOWED INT,
P_CRASH1 INT,
VEH_ROLE INT,
ACC_TYPE INT,
IMPACT INT,
P_CRASH3 INT,
PCRASH4 INT,
PCRASH5 INT,
ROLLOVER INT,
CARG_TYP INT,
HAZ_MAT INT,
HAZ_MA_R INT,
DR_PRES INT,
SPEEDREL INT,
VSURCOND INT,
VPROFILE INT,
VALIGN INT,
VTRAFWAY INT,
V_EVENT INT,
VEH_ALCH INT,
MAX_VSEV INT,
STRATUM INT,
DR_DSTRD INT,
FACTOR INT,
VIOLATN INT,
VIS_OBSC INT,
DRMAN_AV INT,
AXLES INT,
MHENUM INT,
MODEL INT,
NUM_INJV INT,
VNUM_LAN INT,
NUMOCCS INT,
OCC_INVL INT,
PJ INT,
PSU INT,
PSUSTRAT INT,
P_CRASH2 INT,
VSPD_LIM INT,
SPEED INT,
VEHNO INT,
IMPACT_H INT,
VROLE_I INT,
BDYTYP_H INT,
V_EVNT_H INT,
MDLYR_I INT,
MANEUV_I INT,
VLTN_I INT,
HITRUN_I INT,
MXVSEV_I INT,
NUMINJ_I INT,
V_ALCH_I INT

)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2008/VEHICLE';  


DROP TABLE PERSON_2008;
CREATE EXTERNAL TABLE PERSON_2008 
(
CASENUM INT,
PERNO INT,
VEHNO INT,
SEAT_H INT,
AGE_H INT,
SEX_H INT,
INJSEV_H INT,
PERALC_H INT,
WEIGHT INT,
PER_TYPE INT,
SEAT_POS INT,
EJECT INT,
SEX INT,
INJ_SEV INT,
HOSPITAL INT,
PER_ALCH INT,
LOCATN INT,
AIRBAG INT,
REGION INT,
REST_SYS INT,
STRATUM INT,
IMPAIRMT INT,
ACTION INT,
SAF_EQMT INT,
AGE INT,
ALCHTEST INT,
DRUGTEST INT,
PER_DRUG INT,
PJ INT,
PSU INT,
PVEHNO INT,
STR_VEH INT,
EJECT_I INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2008/PERSON';



DROP TABLE DISTRACT_2008;
CREATE EXTERNAL TABLE DISTRACT_2008 
(
MDRDSTRD INT,
REGION INT,
STRATUM INT,
CASENUM INT,
WEIGHT INT,
PJ INT,
PSU INT,
VEHNO INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = "\t",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/accident_project/2008/DISTRACT';
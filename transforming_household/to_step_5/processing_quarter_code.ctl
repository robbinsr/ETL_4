OPTIONS (SKIP=1)
LOAD DATA
INFILE PROCESSING_QUARTER_code_data.csv
BADFILE PROCESSING_QUARTER_code_data.bad
DISCARDFILE PROCESSING_QUARTER_code_data.dsc
INSERT INTO TABLE PROCESSING_QUARTER_code
FIELDS TERMINATED BY ","
(PROCESSING_QUARTER_CODE, PROCESSING_QUARTR_CDE_SHRT_DEC, PROCESSING_QUARTER_CDE_LNG_DSC, PROCESSING_QUARTER_CODE_RFRNCE) 
# ETL EXAMPLE STEP 4

**Performing ETL Manually**

You are reading the README.md file in the ETL_4 repository for Russ Robbins. This repository shows files related to indicating the steps performed when extracting, transforming, and loading household information from a fixed width file to a database that has one primary data table and 33 code tables.

# Inputs to Step 4

**from Step 1**

 - `06724-Codebook.pdf`
 - `06724-0001-Data.txt`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5)

**from Step 2**

 - `robbins_etl_06724-0001-Data.xlsx`
 - `robbins_etl_06724-0001-Data-Crosswalk-1994.xlsx`
 - `robbins_etl_06724-0001-Data-Analysis-1994.accdb`
 - `robbins_etl_06724-0001-Data-Analysis-1994.xlsx`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5)

**from Step 3**

 - `robbinsr_etl_06724-0001-Data-Code-Tables-Design-1994.vsdx`
 - `robbinsr_etl_06724-0001-Data-Code-Tables-Design-1994.pdf`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5)

# Processing in Step 4

**Performing ETL Manually**

1.  - Download NHIS 1994 Household data from [ICPSR](http://bit.ly/1ddSUOC)
1.  - Review data element descriptions in `06724-Codebook.pdf`
1.  - Import data from `06724-0001-Data.txt` into `etl_robbinsr_06724-0001-Data.xlsx` using record positions from `06724-Codebook.pdf`
1.  - Decide upon field name standardization scheme
1.  - Apply field name standardization scheme to field names in `etl_robbinsr_06724-0001-Data.xlsx`
1.  - Import `etl_robbinsr_06724-0001-Data.xlsx` into `etl_robbinsr_06724-0001-Data.accdb`
1.  - Create queries that indicate unique values for every field
1.  - Compare results from queries with information in `06724-Codebook.pdf`
1.  - Note discrepancies
1.  - Create queries that indicate counts of particular values for particular fields if these are provided in `06724-Codebook.pdf`
1.  - Compare results from queries and information in `06724-Codebook.pdf`
1.  - Note discrepancies
1.  - Design database tables to handle each type of data (primary key, foreign key, code, count, and identification field
1.  - Create CDB in Oracle 12c
1.  - Create PDB in CDB in Oracle 12c
1.  - Use SQL*Developer to create tables in PDB as per design
1.  - Use SQL queries from `etl_robbinsr_06724-0001-Data.accdb` as well as data from from `06724-Codebook.pdf` to build csv files for each affiliated code table
1.  - Build control files for SQL*Loader for each csv file
1.  - Load code tables using SQL*Loader, control files, and csv files
1.  - Export `etl_robbinsr_06724-0001-Data.xlsx` to `etl_robbinsr_06724-0001-Data.csv` file
1.  - Build control files for SQL*Loader for `etl_robbinsr_06724-0001-Data.csv` load
1.  - Load data table using using SQL*Loader, control file, and `etl_robbinsr_06724-0001-Data.csv`
1.  - Compare each Oracle table's content with tables in `etl_robbinsr_06724-0001-Data.accdb`
1.  - Rework

**Special Notes:**

 - A user id named `C##NATL_HEALTH` must be created in the `PDB`.
 - The table designs have changed from Step 3. Namely
  - The `PSU_RANDOM_RECODE_CODE` field in the `household` table is renamed `PSU_RANDOM_RECODE_NUMBER` .
  - The renamed `PSU_RANDOM_RECODE_NUMBER` field is not a foreign key, but remains a composite primary key component.
  - The `PSU_RANDOM_RECODE_CODE` table has been eliminated.
- SQL Plus with `C##NATL_HEALTH` id is used to run `create_table*.sql` scripts.
- SQL Loader with `C##NATL_HEALTH` id is used with `*.ctl` and `*.csv `files to load tables.
- Due to the amount of effort necessary to load all tables, only `household`, `record_type_code`, `processing_year_code`, and `processing_quarter_code` were filled.
- Note that the inputs to Step 5 are not identical to the outputs of Step 4 (an additional data source is used.)

# Outputs from Step 4

**Updated Tables Design**

 - `robbinsr_etl_06724-0001-Data-Code-Tables-Design-1994-updated.vsdx`
 - `robbinsr_etl_06724-0001-Data-Code-Tables-Design-1994-updated.pdf`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5)
 
**Script files to create tables (SQL Plus)**
 
 - `create_table_household.sql`
 - `create_table_record_type_code.sql`
 - `create_table_processing_year_code.sql`
 - `create_table_processing_quarter_code.sql`
 - `template_create_table_x_code.sql`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5)

**Comma separated value files with data to load into tables using SQL Loader**

 - `household_data.csv`
 - `record_type_code_data.csv`
 - `processing_year_code_data.csv`
 - `processing_quarter_code_data.csv`
 - `template_x_code_data.csv`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5)

**Control files with instructions for loading data into tables using SQL Loader**

 - `household_data.ctl`
 - `record_type_code.ctl`
 - `processing_year_code.ctl`
 - `processing_quarter_code.ctl`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5)

**Log files created by loads**

 - `household_data.log`
 - `record_type_code_data.log`
 - `processing_year_code_data.log`
 - `processing_quarter_code_data.log`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5)

**passed from Step 1**

 - `06724-Codebook.pdf`
 - `06724-0001-Data.txt`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5)

**passed from Step 2**

 - `robbins_etl_06724-0001-Data.xlsx`
 - `robbins_etl_06724-0001-Data-Crosswalk-1994.xlsx`
 - `robbins_etl_06724-0001-Data-Analysis-1994.accdb`
 - `robbins_etl_06724-0001-Data-Analysis-1994.xlsx`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5) 

**passed from Step 3**

 - `robbinsr_etl_06724-0001-Data-Code-Tables-Design-1994.vsdx`
 - `robbinsr_etl_06724-0001-Data-Code-Tables-Design-1994.pdf`
 - these can bee reached at [https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5](https://github.com/robbinsr/ETL_4/tree/master/transforming_household/to_step_5)

Please feel free to move to the ETL_5 repository at this point or at some future moment at your convenience.

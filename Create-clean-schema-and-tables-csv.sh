#! /bin/bash

DB_NAME=os_mysql
DB_USER=os_tester
DB_PASS=secrete
OS_SCHEMA_FILE=schema.sql
OS_TABLES_FILE=os_tables.csv

#creates only schema from latest build.
mysqldump -u$DB_USER -p$DB_PASS --skip-triggers --no-data --complete-insert  $DB_NAME > /home/krishagni/os-api-tests/src/test/resources/$OS_SCHEMA_FILE
 
#Creates os_tables CSV file.
mysql -u$DB_USER -p$DB_PASS os_mysql -e "show tables" | tail -n +2 > os_tables.csv


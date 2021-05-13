#! /bin/bash

DB_NAME=os_mysql
DB_USER=os_tester
DB_PASS=secrete
SCHEMA_DUMP=schema.sql
DATA_DUMP=os_fresh.sql

ImportDumps()
{
   mysql -u$DB_USER -p$DB_PASS $DB_NAME < /home/krishagni/os-api-tests/src/test/resources/schema.sql
   mysql -u$DB_USER -p$DB_PASS $DB_NAME < /home/krishagni/os-api-tests/src/test/resources/cps/os_fresh.sql
}
DropAndCreateDatabase()
{
  mysql -u$DB_USER -p$DB_PASS -e 'drop database os_mysql;'
  mysql -u$DB_USER -p$DB_PASS -e 'create database os_mysql;'
}

DropAndCreateDatabase
ImportDumps

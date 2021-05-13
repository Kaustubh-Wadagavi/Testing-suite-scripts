#! /bin/bash

DB_NAME=os_mysql
DB_USER=os_tester
DB_PASS=secrete

DropAndCreateDatabase()
{
  mysql -u$DB_USER -p$DB_PASS -e 'drop database os_mysql;'
  mysql -u$DB_USER -p$DB_PASS -e 'create database os_mysql;'
}

DropAndCreateDatabase

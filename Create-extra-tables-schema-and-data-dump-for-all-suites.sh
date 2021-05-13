
#! /bin/bash

workSpace=$1
DB_NAME=os_mysql
DB_USER=os_tester
DB_PASS=secrete
DB_EXTRA_TABLES_SCHEMA_FILE=os-extra-tables-schema.sql
DB_DATA_FILE=os-data.sql
IGNORED_TABLES_STRING="";

CreateExtraTablesSchemaAndDataDump()
{
   while read PRESENT_TABLES
   do
     IGNORED_TABLES_STRING+=" --ignore-table=os_mysql.${PRESENT_TABLES}"
   done < /home/krishagni/Desktop/Testing-suite-scripts/os_tables.csv

   # Exports extra tables schema
   mysqldump -u$DB_USER -p$DB_PASS --no-data --complete-insert ${IGNORED_TABLES_STRING} $DB_NAME > $DB_EXTRA_TABLES_SCHEMA_FILE

   # Exports data dump.
   mysqldump -u$DB_USER -p$DB_PASS --no-create-info --complete-insert $DB_NAME > $DB_DATA_FILE

   # Appends the data dump file with extra tables schema and creates zip of new sql which contains the extra tables schema and data.
   cat $DB_EXTRA_TABLES_SCHEMA_FILE $DB_DATA_FILE > temp.sql && mv temp.sql os_fresh.sql && zip os_fresh.zip os_fresh.sql

   # Removes the sql files DB extra tables schema and data dump
   rm $DB_EXTRA_TABLES_SCHEMA_FILE $DB_DATA_FILE os_fresh.sql

}

DropAndCreateDatabase()
{
  mysql -u$DB_USER -p$DB_PASS -e 'drop database os_mysql;'
  mysql -u$DB_USER -p$DB_PASS -e 'create database os_mysql;'
}

CreateVisitsExtraTablesSchemaAndDataDump()
{
  echo "Visits"
  DropAndCreateDatabase
  mysql -u$DB_USER -p$DB_PASS $DB_NAME < TC-Specific-Dumps/Visits.sql
  CreateExtraTablesSchemaAndDataDump
  mv os_fresh.zip src/test/resources/visits/
}
CreateUsersExtraTablesSchemaAndDataDump()
{ 
  echo "Users"
  DropAndCreateDatabase
  mysql -u$DB_USER -p$DB_PASS $DB_NAME < TC-Specific-Dumps/Users.sql
  CreateExtraTablesSchemaAndDataDump
  mv os_fresh.zip src/test/resources/users/
}
CreateUserRolesExtraTablesSchemaAndDataDump()
{
  echo "User Roles"
  DropAndCreateDatabase
  mysql -u$DB_USER -p$DB_PASS $DB_NAME < TC-Specific-Dumps/User-roles.sql
  CreateExtraTablesSchemaAndDataDump
  mv os_fresh.zip src/test/resources/user_roles/
}
CreateSitesExtraTablesSchemaAndDataDump()
{
  echo "Sites"
  DropAndCreateDatabase
  mysql -u$DB_USER -p$DB_PASS $DB_NAME < TC-Specific-Dumps/Sites.sql
  CreateExtraTablesSchemaAndDataDump
  mv os_fresh.zip src/test/resources/sites/
}
CreateParticipantsExtraTablesSchemaAndDataDump()
{
  echo "Participants"
  DropAndCreateDatabase
  mysql -u$DB_USER -p$DB_PASS $DB_NAME < TC-Specific-Dumps/Participants.sql
  CreateExtraTablesSchemaAndDataDump
  mv os_fresh.zip src/test/resources/participants/
}
CreateInstitutesExtraTablesSchemaAndDataDump()
{ 
  echo "Institutes"
  DropAndCreateDatabase
  mysql -u$DB_USER -p$DB_PASS $DB_NAME < TC-Specific-Dumps/Institutes.sql
  CreateExtraTablesSchemaAndDataDump
  mv os_fresh.zip src/test/resources/institutes/
}
CreateDistributionProtocolsExtraTablesSchemaAndDataDump()
{
  echo "Distribution Protocols"
  DropAndCreateDatabase
  mysql -u$DB_USER -p$DB_PASS $DB_NAME < TC-Specific-Dumps/Distribution-Protocols.sql
  CreateExtraTablesSchemaAndDataDump
  mv os_fresh.zip src/test/resources/distribution_protocols/
}
CreateDistributionOrdersExtraTablesSchemaAndDataDump()
{
  echo "Distribution Orders"
  DropAndCreateDatabase
  mysql -u$DB_USER -p$DB_PASS $DB_NAME < TC-Specific-Dumps/Distribution-Orders.sql
  CreateExtraTablesSchemaAndDataDump
  mv os_fresh.zip src/test/resources/distribution_orders/
}
CreateCpsExtraTablesSchemaAndDataDump()
{  
  echo "CPs"
  DropAndCreateDatabase
  mysql -u$DB_USER -p$DB_PASS $DB_NAME < TC-Specific-Dumps/Collection-Protocols.sql
  CreateExtraTablesSchemaAndDataDump
  mv os_fresh.zip src/test/resources/cps/
}
CreateFormsExtraTablesSchemaAndDataDump()
{  
  echo "Forms"
  DropAndCreateDatabase
  mysql -u$DB_USER -p$DB_PASS $DB_NAME < TC-Specific-Dumps/Forms.sql
  CreateExtraTablesSchemaAndDataDump
  mv os_fresh.zip src/test/resources/forms/
}

CreateDumps()
{
  cd $workSpace/
  CreateCpsExtraTablesSchemaAndDataDump
  CreateDistributionOrdersExtraTablesSchemaAndDataDump
  CreateDistributionProtocolsExtraTablesSchemaAndDataDump
  CreateInstitutesExtraTablesSchemaAndDataDump
  CreateParticipantsExtraTablesSchemaAndDataDump
  CreateSitesExtraTablesSchemaAndDataDump
  CreateUserRolesExtraTablesSchemaAndDataDump
  CreateUsersExtraTablesSchemaAndDataDump
  CreateVisitsExtraTablesSchemaAndDataDump
  CreateFormsExtraTablesSchemaAndDataDump
}

if [ -d "$workSpace" ]
then
	CreateDumps
else
	echo "Please enter the os-api-tests Directory Path through command line!!"
	exit
fi

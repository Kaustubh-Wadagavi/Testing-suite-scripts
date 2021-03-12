#! /bin/bash

workSpace=$1

#Unzips database dumps after changing the directories.
unzipTheDumps()
{
	cd $workSpace/src/test/resources/

	#Extracts CPs suite dump file. 
	unzip -o cps/os_fresh.zip -d cps/

	#Extracts Institutes suite dump file 
	unzip -o institutes/os_fresh.zip -d institutes/ 

	#Extracts Participants suite dump file.
  	unzip -o participants/os_fresh.zip -d participants/

	#Extracts Sites suite dump file.
	unzip -o sites/os_fresh.zip -d sites/

	#Extracts User_Roles suite dump file.
	unzip -o user_roles/os_fresh.zip -d user_roles/

	#Extracts Users suite dump file.
	unzip -o users/os_fresh.zip -d users/

	#Extracts Visits suite dump file.
	unzip -o visits/os_fresh.zip -d visits/
	
	#Extracts Distribution protocols suite dump file.
	unzip -o distribution_protocols/os_fresh.zip -d distribution_protocols/
	
	#Extracts Distribution orders suite dump file.
	unzip -o distribution_orders/os_fresh.zip -d distribution_orders/

}


# Script starts from here
if [ -d "$workSpace" ] 
then
	unzipTheDumps
else
	echo "Please enter the os-api-tests Directory Path through command line!!"
	exit 1;
fi

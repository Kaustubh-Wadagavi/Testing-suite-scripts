#! /bin/bash

workSpace=$1

#Unzips database dumps after changing the directories.
unzipTheDumps()
{
	cd $workSpace/src/test/resources/

	rm cps/os_fresh.sql
	rm distribution_orders/os_fresh.sql
	rm distribution_protocols/os_fresh.sql
	rm forms/os_fresh.sql
	rm institutes/os_fresh.sql
	rm participants/os_fresh.sql
	rm sites/os_fresh.sql
	rm user_roles/os_fresh.sql
	rm users/os_fresh.sql
	rm visits/os_fresh.sql
}


# Script starts from here
if [ -d "$workSpace" ] 
then
	unzipTheDumps
else
	echo "Please enter the os-api-tests Directory Path through command line!!"
	exit 1;
fi

#! /bin/bash

mysql -uos_tester -psecrete -hlocalhost -D os_mysql -e "UPDATE catissue_user SET API_USER=1"
mysql -uos_tester -psecrete -hlocalhost -D os_mysql -e "UPDATE catissue_user SET IP_RANGE='*'"


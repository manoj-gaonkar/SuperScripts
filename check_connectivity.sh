#!/bin/bash

# Author: Manoj
#
# Crontab used for run is as below
# ----------------------------------------------------------------------------------
# 03 23 * * * /home/manoj/learn/scripts/RealWorldScripts/check_connectivity.sh >> /home/manoj/learn/scripts/RealWorldScripts/logs/connectivity_check.log 2>&1
# ----------------------------------------------------------------------------------

hosts=('10.0.2.15' '192.17.0.1')

for host in "${hosts[@]}";
do
	timestamp=$(date '+%Y-%m-%d %H:%M:%S')
	ping -c 1 "$host" 1>/dev/null 2>&1
	if [[ $? -eq 0 ]];
	then
		echo -e "${timestamp} \e[32mOK\e[0m ${host} Server is running"
	else
		echo -e "${timestamp} \e[31mNOK\e[0m ${host} Server is not running"
	fi
done



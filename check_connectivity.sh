#!/bin/bash

# Author: Manoj

hosts=('10.0.2.15' '192.17.0.1')

for host in "${hosts[@]}";
do
	ping -c 1 "$host" 1>/dev/null 2>&1
	if [[ $? -eq 0 ]];
	then
		echo "${host} Server is running"
	else
		echo "${host} Server is not running"
	fi
done



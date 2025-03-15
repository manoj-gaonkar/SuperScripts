#!/bin/bash

# Author: Manoj
# Date: 15/03/2025

# This command creates a back up of to_be_backedup/ folder into the specified file format in backed_up_files folder

tar cvf backed_up_files/backup_$(date '+%Y-%m-%d-%HH%MM%SS').tar to_be_backedup/*
if [[ $? -eq 0 ]];
then
	backed_file=$(ls -pt backed_up_files/ | grep -v / | head -n 1)
	timestamp=$(date '+%Y-%m-%d %H:%M:%S')
	echo -e "${timestamp} \e[32mSUCCESS\e[0m ${backed_file} is saved in backed_up_files/ folder" >> backed_up_files/logs/backup.log 
else
	echo -e "${timestamp} \e[31mERROR\e[0m There was an issue in backing up files" >> backed_up_files/logs/backup.log 
fi
	

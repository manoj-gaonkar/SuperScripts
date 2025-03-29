#!/bin/bash

# Author: Manoj
# Date: 15/03/2025

# This command creates a back up of to_be_backedup/ folder into the specified file format in backed_up_files folder

backup_file_name="backup_$(date '+%Y-%m-%d_%HH_%MM_%SS').tar"

archive(){
	# This command to convert files to tar
	tar cvf backed_up_files/$backup_file_name to_be_backedup/* > /dev/null
	# This command compresses the tar file to gzip file
	gzip backed_up_files/$backup_file_name > /dev/null
}


timestamp=$(date '+%Y-%m-%d %H:%M:%S')

if archive;
then
	echo -e "${timestamp} \e[32mSUCCESS\e[0m ${backup_file_name} is saved in backed_up_files/ folder" | tee -a backed_up_files/logs/backup.log 
else
	echo -e "${timestamp} \e[31mERROR\e[0m There was an issue in backing up files" | tee -a backed_up_files/logs/backup.log 

fi
	

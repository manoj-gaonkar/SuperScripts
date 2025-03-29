#!/bin/bash

INACTIVE_DAYS=10

CURRENT_DATE=$(date +%s)

for user in $(awk -F: '$3 >= 1000 {print $1}' /etc/passwd);
do
	USER_LOGIN_INFO=$(lastlog -u $user | tail -n 1)

	if echo "$USER_LOGIN_INFO" | grep -q "**Never logged in**"; then
		echo "User: $user has never logged in"
		continue
	fi

	USER_LOGIN_TIME=$(echo "$USER_LOGIN_INFO" | cut -c 43- | sed 's/^[ ]*//')

	USER_LOGIN_TIME_S=$(date -d "$USER_LOGIN_TIME" +'%s')

	DAYS_INACTIVE=$(( ($CURRENT_DATE - $USER_LOGIN_TIME_S)/84600))

	if [[ $DAYS_INACTIVE -ge $INACTIVE_DAYS ]];then
		echo -e "\e[31mremoving user $user from system\e[0m"
		# command to disable the user from system
		sudo usermod -L "$user"
	fi

done

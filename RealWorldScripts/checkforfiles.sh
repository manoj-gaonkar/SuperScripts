#!/bin/bash


FILES="/learn/scripts/admintask
/etc/shadow
/etc/passwd
/etc/groups
/xyz/no"

for file in $FILES;
do
	if [[ ! -e $file ]];
	then
		echo "$file does not exist"
		echo
	fi
done

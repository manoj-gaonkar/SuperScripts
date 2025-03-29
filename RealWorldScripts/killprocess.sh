#!/bin/bash


PROCESS_LIST="$(ps -ef | grep 'sleep' | grep -v grep | awk '{print $2}')"

if [[ -z "$PROCESS_LIST" ]];then
	echo "No process running"
	exit 0
fi

for i in "${PROCESS_LIST[@]}"; do
	echo "Killing process with id $i"
	kill $i
	echo "Process $i killed"
done

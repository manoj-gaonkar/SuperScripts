#!/bin/bash


TASK_DATE=$(tail -n1 /home/manoj/learn/tasks.yaml | awk '{print $1,$2,$3,$7}')
TODAY=$(date | awk '{print $1,$2,$3,$7}')

echo $TASK_DATE $TODAY

if [[ "$TASK_DATE" != "$TODAY" || $TASK_DATE =~ "DONE" ]];
then
	date >> /home/manoj/learn/tasks.yaml	
fi

vim /home/manoj/learn/tasks.yaml

echo
echo
echo
read -p "Are you done for the day?" confirm

#if [[ "$confirm" =~ ^[Yy][eE]?[sS]?$ ]];
if [[ "$confirm" =~ ^(y|yes|Y|Yes)$ ]];
then
	echo "Study done: $(date +"%d-%m-%Y %H:%M")" >> /home/manoj/learn/tasks.yaml
	echo "############################# DONE ###########################" >> /home/manoj/learn/tasks.yaml
fi

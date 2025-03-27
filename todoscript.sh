#!/bin/bash

done_today(){
read -p "Are you done for the day?" confirm

#if [[ "$confirm" =~ ^[Yy][eE]?[sS]?$ ]];
if [[ "$confirm" =~ ^(y|yes|Y|Yes)$ ]];
then
	echo "Study done: $(date +"%d-%m-%Y %H:%M")" >> $TASK_FILE 2>/dev/null
	echo "############################# DONE ###########################" >> $TASK_FILE 2>/dev/null
fi
}


TASK_FILE="/home/manoj/learn/tasks.yaml"
TASK_DATE=$(tail -n1 $TASK_FILE | awk '{print $1,$2,$3,$7}')
TODAY=$(date | awk '{print $1,$2,$3,$7}')
TODAY_DATE=$(date | awk '{print $1,$2,$3}')

if [[ $(grep -i "$TODAY_DATE" $TASK_FILE) ]]; then
	vim $TASK_FILE
	done_today
fi

exit

if [[ "$TASK_DATE" != "$TODAY" || $TASK_DATE =~ "DONE" ]];
then
	date >> $TASK_FILE	
fi

vim $TASK_FILE

echo
echo
done_today

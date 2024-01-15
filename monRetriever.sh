#!/bin/bash

LOG_DIR=/home/komasin4/scripts/log/
TODAY=`date +%Y%m%d`
CURRTIME=`date +%T`

LOG_FILE=$LOG_DIR"monRetriever_"$TODAY".log"

process_cnt=`ps -ef | grep "run manageRetreiver.py" | grep streamlit | wc -l`

echo $process_cnt

if [ $process_cnt -lt 1 ]
then
        echo "$CURRTIME	manageRetreiver restart..." >> $LOG_FILE
	cd /home/komasin4/projects/maum.ai/maum.ai.pulmuwon.manage.retreiver
	nohup ./start.sh &
else
        echo "$CURRTIME	manageRetreiver alive" >> $LOG_FILE
fi

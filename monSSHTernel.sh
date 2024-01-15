#!/bin/bash

LOG_DIR=/home/komasin4/scripts/log/
TODAY=`date +%Y%m%d`
CURRTIME=`date +%T`

LOG_FILE=$LOG_DIR"monSSHTernel_"$TODAY".log"

ssh1_cnt=`ps -ef | grep ssh | grep OraARM1 | wc -l`
if [ $ssh1_cnt -lt 1 ]
then
        echo "$CURRTIME	OraARM1-ssh restart..." >> $LOG_FILE
	ssh -fN -R 40122:maum.ai.rpi:22 -i /home/komasin4/.ssh/ora_key_ssh ubuntu@OraARM1	>> $LOG_FILE
else
        echo "$CURRTIME	OraARM1-ssh alive" >> $LOG_FILE
fi

ssh2_cnt=`ps -ef | grep ssh | grep OraARM2 | wc -l`
if [ $ssh2_cnt -lt 1 ]
then
        echo "$CURRTIME	OraARM2-ssh restart..." >> $LOG_FILE
	ssh -fN -R 40122:maum.ai.rpi:22 -i /home/komasin4/.ssh/ora_key_ssh ubuntu@OraARM2	>> $LOG_FILE
else
       echo "$CURRTIME	OraARM2-ssh alive" >> $LOG_FILE
fi

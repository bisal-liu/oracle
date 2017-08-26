#!/bin/bash

#######################################################
# $Name:        crontab_es_del.sh
# $Version:     v1.0
# $Author:      bisal
# $Create Date: 2017-08-26
# $Description: According to df, execute curl -XDELETE
#######################################################

DDATE=`date +"%Y.%m.%d" -d "-0day"`
FILE=filebeat-$DDATE
URL=x.x.x.x:9200/$FILE
#CMD=`curl -XDELETE $URL`
THRESHOLD=25
WAITING_DISK=/opt/app

CURRENT=`df -h $WAITING_DISK | awk '/\/app$/{print $4}' | sed "s/%//g"`
echo "CURRENT: $CURRENT%"
echo "THRESHOLD: $THRESHOLD%"
if [ $CURRENT -ge $THRESHOLD ]
then
echo "execute `curl -XDELETE $URL`";
fi

#!/bin/bash
month=$(date "+%Y-%m")
echo "month:"$month

time=$(date "+%Y-%m-%d")
echo "start:"$time

echo "upload confluence to oss ..."
/data/backups/ossutil64 --config-file=/data/backups/.ossutilconfig cp -r /data/confluence/backups/ oss://gitbackups/confluence/$month/$time --exclude 'ossutil_output*' --parallel=100 --retry-times=500 --part-size=1024000 
/data/backups/ossutil64 --config-file=/data/backups/.ossutilconfig cp -r /data/confluence/attachments/ oss://gitbackups/confluence/$month/$time/attachments/ --exclude 'ossutil_output*' --retry-times=500 

sleep 3
echo "cleanup confluence backup ..."
mkdir -p /data/backups/confluence/$month/$time

mv /data/confluence/backups/*.zip /data/backups/confluence/$month/$time
cp -r /data/confluence/attachments/ /data/backups/confluence/$month/$time

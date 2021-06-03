#!/bin/bash
month=$(date "+%Y-%m")
echo "month:"$month

time=$(date "+%Y-%m-%d")
echo "start:"$time

sleep 3
echo "mysqldump ..."
docker exec -i mysql bash -c 'mysqldump -uroot -p123456 --all-databases > /tmp/db.sql'
docker cp mysql:/tmp/db.sql /data/backups/mysql/

sleep 3
echo "upload mysql to oss ..."
/data/backups/ossutil64 --config-file=/data/backups/.ossutilconfig cp -r --exclude "ossutil_output" /data/backups/mysql/db.sql oss://gitbackups/mysql/$month/$time.sql --jobs=100 --parallel=100 --retry-times=500 --part-size=1024000

sleep 3
echo "cleanup mysql backup ..."
docker exec -i mysql bash -c 'rm -rf /tmp/db.sql'
mkdir -p /data/backups/mysql/$month
mv /data/backups/mysql/db.sql /data/backups/mysql/$month/$time.sql

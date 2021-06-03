#!/bin/bash
month=$(date "+%Y-%m")
echo "month:"$month

time=$(date "+%Y-%m-%d")
echo "start:"$time

echo "backup gitlab ..."
docker exec -i gitlab gitlab-rake gitlab:backup:create

sleep 3
echo "cp gitlab ..."
mkdir -p /data/backups/gitlab/$month/$time

docker cp gitlab:/var/opt/gitlab/backups/ /data/backups/gitlab/$month/$time
docker cp gitlab:/etc/gitlab/gitlab.rb /data/backups/gitlab/$month/$time
docker cp gitlab:/etc/gitlab/gitlab-secrets.json /data/backups/gitlab/$month/$time

sleep 3
echo "upload gitlab to oss ..."
/data/backups/ossutil64 --config-file=/data/backups/.ossutilconfig cp -r --exclude "ossutil_output" /data/backups/gitlab/$month/$time/ oss://gitbackups/gitlab/$month/$time/ --jobs=100 --parallel=100 --retry-times=500 --part-size=1024000

sleep 3
echo "cleanup gitlab docker ..."
docker exec -i gitlab bash -c  'rm -rf /var/opt/gitlab/backups/*.tar'



#!/bin/bash

pod=$(docker ps -a|grep $1)

if [[ $pod != ''  ]];then
	echo "docker restart pod:$1"
	docker restart $1         
else 
	echo "docker run pod:$1"
	docker run \
	 --name $1 \
	 --restart always \
	 -e TZ="Asia/Shanghai"\
	 -v /data/deploy/$1:/usr/share/nginx/html \
	 -p $2:80 \
	 -d nginx:stable-alpine
fi

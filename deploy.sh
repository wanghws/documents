#!/bin/bash

docker run \
 --name $1 \
 -e TZ="Asia/Shanghai"\
 -v /home/data/deploy:/jar \
 -v /home/data/log:/log \
 -p $2:8080\
 -w "/jar" \
 -d anapsix/alpine-java:8_jdk_unlimited \
 java -jar /jar/$1.jar -Duser.timezone=Asia/Shanghai --logging.file=/log/$1.log

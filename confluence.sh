#!/bin/bash

docker run \
--restart always \
-p 8090:8090 \
-p 8091:8091 \
-v /data/confluence:/var/atlassian/application-data/confluence \
-v /etc/localtime:/etc/localtime \
--name confluence \
-d atlassian/confluence-server:6.15.2
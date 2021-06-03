#!/bin/bash

docker run \
	 --restart always \
         --name zipkin \
         -e TZ="Asia/Shanghai" \
         -p $1:9411 \
         -d openzipkin/zipkin-slim

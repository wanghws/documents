#!/bin/bash
docker run \
--restart always \
--name seata \
-p 8091:8091 \
-d seataio/seata-server

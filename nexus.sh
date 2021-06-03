#!/bin/bash

docker run \
--restart always \
-p 8081:8081 \
--name nexus \
-v /home/nexus-data:/nexus-data \
-d sonatype/nexus3

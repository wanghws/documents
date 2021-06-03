#!/bin/bash

docker run \
-p 3690:3690 \
--restart always \
--name subversion \
-v /data/subversion:/var/opt/svn \
-d garethflowers/svn-server

#!/bin/bash
docker run \
--restart always \
-p 443:443 \
-p 80:80 \
-p 222:22 \
--name gitlab \
-v /data/gitlab/config:/etc/gitlab \
-v /data/gitlab/logs:/var/log/gitlab \
-v /data/gitlab/data:/var/opt/gitlab \
-d gitlab/gitlab-ce

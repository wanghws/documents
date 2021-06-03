#!/bin/bash

docker run \
--name gitlab-runner \
--restart always \
-v /data/gitlab-runner/config:/etc/gitlab-runner \
-v /usr/bin/docker:/usr/bin/docker \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /data/gitlab-runner/cache:/cache \
-v /data/gitlab-runner/m2:/root/.m2 \
-v /data/gitlab-runner/home:/home/gitlab-runner \
-v /data/deploy:/deploy \
-d gitlab/gitlab-runner

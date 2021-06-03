#!/bin/bash

docker run \
--restart always \
-p 8080:8080 \
-v /home/data/jira:/var/atlassian/application-data/jira \
-v /home/data/jira_logs:/opt/atlassian/jira/logs \
-v /home/data/jira_var:/var/atlassian/jira \
-v /etc/localtime:/etc/localtime:ro \
--privileged=true \
--name jira \
-d cptactionhank/atlassian-jira-software:8.1.0

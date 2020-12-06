#!/bin/bash
crumb=$(curl -u "jenkins:1234" -s 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
echo $crumb
curl -u "jenkins:1234" -H "$crumb" -X POST http://localhost:8080/job/jenkin-tips-tricks/build?delay=0sec
# curl -u "jenkins:1234" -H "$crumb" -X POST  http://jenkins.local:8080/job/backup-to-aws/buildWithParameters?MYSQL_HOST=db_host&DATABASE_NAME=testdb&AWS_BUCKET_NAME=jenkins-mysql-backup
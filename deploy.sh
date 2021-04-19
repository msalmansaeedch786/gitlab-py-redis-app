#!/bin/sh

ssh -o StrictHostKeyChecking=no ubuntu@$server_ip << 'ENDSSH'
  cd /home/ubuntu/app
  git clone https://github.com/msalmansaeedch786/gitlab-py-redis-app.git
  cd /gitlab-py-redis-app/src
  docker-compose up -d
ENDSSH
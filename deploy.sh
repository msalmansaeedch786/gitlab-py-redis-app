#!/bin/sh

ssh -o StrictHostKeyChecking=no ubuntu@$server_ip << 'ENDSSH'
  cd /home/ubuntu/app
  export $(cat .env-ci | xargs)
  cat .env-ci
  docker login -u $CI_REGISTRY_USER -p $ACCESS_TOKEN $CI_REGISTRY
  docker pull $TORNADO_IMAGE
  docker-compose up -d
ENDSSH
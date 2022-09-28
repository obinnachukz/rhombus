#!/bin/bash

#Build gitlab/gitlab-ce image
docker build -t gitlab/gitlab-ce:rhombus $(PWD)

# Set up volume location
export GITLAB_HOME=$HOME/gitlab

# Install Docker engine
sudo docker run --detach \
  --hostname gitlab.example.com \
  -p 443:443 -p 8080:80 -p 1001:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 2gb \
  gitlab/gitlab-ce:latest

# log in details for gitlab GUI
echo "GIT-LAB URL: " "localhost:8080" "if not available, change port to 443 or 1001"
echo "GIT-LAB Username =" "root"

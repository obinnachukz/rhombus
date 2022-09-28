#!/bin/bash

#Build gitlab/gitlab-ce image
docker build -t gitlab/gitlab-ce:rhombus $(PWD)

# echo user name and password to login to gitlab GUI
echo "GIT-LAB URL: " "localhost:8080" "if not available, change port to 443 or 1001"
echo "GIT-LAB Username =" "root"
echo "GIT-LAB password =" $GITLAB_ROOT_PASSWORD

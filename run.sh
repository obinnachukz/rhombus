#!/bin/bash

#Build gitlab/gitlab-ce image
docker build -t gitlab/gitlab-ce:rhombus $(PWD)

# echo user name and password to login to gitlab GUI
echo "GIT-LAB URL: " "localhost:8080" "if not available, change port to 443 or 1001"
echo "GIT-LAB Username =" "root"
echo "GIT-LAB password =" $GITLAB_ROOT_PASSWORD

echo **********************************************************************************

echo "Git lab runner registration for macOS"

# Download the binary for your system
sudo curl --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-amd64

# Give it permission to execute
sudo chmod +x /usr/local/bin/gitlab-runner

# Command to register runner
gitlab-runner register --url http://localhost:8080/ --registration-token $REGISTRATION_TOKEN

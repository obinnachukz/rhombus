#!/bin/bash

# Deploy gitlab runner image
# Use Docker volumes to start the Runner container
# Create the Docker volume:
docker volume create gitlab-runner-config

# Start the GitLab Runner container 
docker run -d --name gitlab-runner --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v gitlab-runner-config:/etc/gitlab-runner \
    gitlab/gitlab-runner:latest
    
 # Register gitlab runner
 gitlab-runner register

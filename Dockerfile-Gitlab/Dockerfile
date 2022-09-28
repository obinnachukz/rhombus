# Pull docker image
FROM gitlab/gitlab-ce

# Set up volume location
export GITLAB_HOME=$HOME/gitlab

# Install Docker engine
sudo docker run --detach \
  --hostname gitlab.example.com \
  --env GITLAB_ROOT_PASSWORD="Rhombus2022"
  --publish 443:443 --publish 8080:80 --publish 1001:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 2gb \
  gitlab/gitlab-ce:latest

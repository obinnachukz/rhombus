# rhombus
rhombus challenge


echo **********************************************************************************

echo "Git lab runner registration for macOS"

# Download the binary for your system
sudo curl --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-amd64

# Give it permission to execute
sudo chmod +x /usr/local/bin/gitlab-runner

# Command to register runner
gitlab-runner register --url http://localhost:8080/ --registration-token $REGISTRATION_TOKEN

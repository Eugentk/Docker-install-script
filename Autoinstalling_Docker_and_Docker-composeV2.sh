#!/bin/sh
echo "========================================Start========================================="

sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

# Add package signing key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add repository
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Install docker stable version
sudo apt-get update
sudo apt-get -y install docker-ce

# Install docker-compose
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
# Start docker
sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -a -G docker ${USER}
echo "========================================Finish========================================="

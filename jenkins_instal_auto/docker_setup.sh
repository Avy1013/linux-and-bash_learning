#!/bin/bash

# Update the system
sudo yum update -y

# Install yum-utils
sudo yum install yum-utils -y

# Add Docker repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker with compose
#sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Install Docker without compose
sudo yum install docker-ce docker-ce-cli containerd.io -y

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to docker group
sudo usermod -aG docker $USER

# Apply group changes without logout
newgrp docker

# Print Docker version
docker --version

# Check Docker status
sudo systemctl status docker


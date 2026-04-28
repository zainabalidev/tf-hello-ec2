#!/bin/bash

# Update the system
apt-get update -y
apt-get upgrade -y

# Install Docker (Ubuntu package name is docker.io)
apt-get install -y docker.io

# Start and Enable Docker
systemctl start docker
systemctl enable docker

# Give the default Ubuntu user permission to use Docker
# Note: The default user is 'ubuntu', not 'ec2-user'
usermod -aG docker ubuntu
#!/usr/local/Cellar/bash/5.2.21/bin/bash

# EC2 instance details
EC2_USER="ec2-user"
EC2_PRIVATE_KEY="/Users/avy/Downloads/linux_practice.pem"
DEFAULT_DOCKER_SETUP_FILE="/Users/avy/Documents/c pro/linux-and-bash_learning/jenkins_instal_auto/docker_setup.sh"
REMOTE_SCRIPT_PATH="~/"

# Prompt for EC2 instance IP address
read -p "Enter the EC2 instance IP address: " EC2_IP

# Prompt for the choice
echo "Select the scp file location:"
echo "1. Use efault Docker setup file path"
echo "2. Enter custom scp file path"
read -p "Enter your choice : " choice

case $choice in
    1)
        SCP_FILE="$DEFAULT_DOCKER_SETUP_FILE"
        ;;
    2)
        read -p "Enter the full path to the Docker setup file: " SCP_FILE
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

scp -i "$EC2_PRIVATE_KEY" "$SCP_FILE" "$EC2_USER@$EC2_IP:$REMOTE_SCRIPT_PATH"

# Finally ssh in
ssh -i "$EC2_PRIVATE_KEY" "$EC2_USER@$EC2_IP"

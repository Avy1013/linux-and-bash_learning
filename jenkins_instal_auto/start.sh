#!/bin/bash

# Path to the script you want to transfer and run on the EC2 instance
LOCAL_SCRIPT_PATH="/Users/avy/Documents/c pro/linux-and-bash_learning/jenkins_instal_auto/start.sh"
REMOTE_SCRIPT_PATH="~/myscript.sh"
JENKINS_SETUP_FILE="/Users/avy/Documents/c pro/linux-and-bash_learning/jenkins_instal_auto/jenkins_setup.sh"
DOCKER_SETUP_FILE="/Users/avy/Documents/c pro/linux-and-bash_learning/jenkins_instal_auto/docker_setup.sh"

# EC2 instance details
EC2_USER="ec2-user"
EC2_PRIVATE_KEY="/Users/avy/Downloads/linux_practice.pem"

# Prompt for EC2 instance IP address
read -p "Enter the EC2 instance IP address: " EC2_IP

# Transfer the script to the EC2 instance
scp -i "$EC2_PRIVATE_KEY" "$JENKINS_SETUP_FILE" "$EC2_USER@$EC2_IP:$REMOTE_SCRIPT_PATH"
scp -i "$EC2_PRIVATE_KEY" "$DOCKER_SETUP_FILE" "$EC2_USER@$EC2_IP:~/docker_setup.sh"

# Edit the .bashrc file on the EC2 instance
ssh -i "$EC2_PRIVATE_KEY" "$EC2_USER@$EC2_IP" <<EOF
# Add the alias to run the script
# echo "alias runit='~/myscript.sh'" >> ~/.bashrc

# Source the .bashrc file to apply the changes
# source ~/.bashrc

# set the permissions
chmod +x myscript.sh
./myscript.sh

# Run the script
# runit
EOF

echo "Setup completed. Run 'runit' on the EC2 instance to execute the script."
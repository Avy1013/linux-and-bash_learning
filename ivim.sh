#!/usr/local/Cellar/bash/5.2.21/bin/bash



# Prompt the user to enter the IP address
echo "Enter the IP address:"
read IP_ADDRESS
EC2_PRIVATE_KEY="/Users/avy/Downloads/linux_practice.pem"
# Export the IP_ADDRESS variable
export IP_ADDRESS
ssh -i "$EC2_PRIVATE_KEY" "ec2-user@$IP_ADDRESS" <<EOF
sudo yum install vim -y
EOF

# Optionally, you can add your 'practice' alias here
# eval ssh -i /Users/avy/Downloads/linux_practice.pem ec2-user@\$IP_ADDRESS


# USES AUTOSSH
autossh -M 0 -i /Users/avy/Downloads/linux_practice.pem -o "ServerAliveInterval 60" -o "ServerAliveCountMax 2" ec2-user@$IP_ADDRESS

#!/usr/local/Cellar/bash/5.2.21/bin/bash



# Prompt the user to enter the IP address
echo "Enter the IP address:"
read IP_ADDRESS

# Export the IP_ADDRESS variable
export IP_ADDRESS

# Optionally, you can add your 'practice' alias here

#eval ssh -i /Users/avy/Downloads/linux_practice.pem ec2-user@\$IP_ADDRESS


# USES AUTOSSH
autossh -M 0 -i /Users/avy/Downloads/linux_practice.pem -o "ServerAliveInterval 60" -o "ServerAliveCountMax 2" ec2-user@$IP_ADDRESS
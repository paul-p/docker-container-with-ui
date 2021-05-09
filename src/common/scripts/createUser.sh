#!/bin/bash

# Create the user
echo "Creating user $1 with the defined password" 
useradd -m $1
echo "$1:$2" | chpasswd
usermod -aG sudo $1
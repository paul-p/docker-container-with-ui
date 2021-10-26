#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
apt-get update
apt-get install -y ssh
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
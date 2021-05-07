#!/bin/bash
echo "Creating user $1 with the defined password" 
rm /run/nologin
rm /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
useradd -m $1
echo "$1:$2" | chpasswd
usermod -aG sudo $1
systemctl restart lightdm
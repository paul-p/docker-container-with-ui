#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
apt-get update
apt-get install -y lightdm

# Run the /lib/systemd/system/systemd-user-sessions.service which should be runned on startup but doesn't (don't know why)
ln -s /lib/systemd/system/systemd-user-sessions.service /etc/systemd/system/multi-user.target.wants/systemd-user-sessions.service
rm /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
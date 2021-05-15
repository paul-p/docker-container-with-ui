#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# set locale fr
apt-get update
apt-get install -y locales language-pack-fr
locale-gen fr_FR.UTF-8
update-locale LANG=fr_FR.UTF-8

echo "Install Xfce4 UI components"
apt-get install -y supervisor xfce4 xfce4-terminal xterm
apt-get purge -y pm-utils xscreensaver*
apt-get clean -y
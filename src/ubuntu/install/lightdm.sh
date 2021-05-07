#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
apt-get update
apt-get install -y sudo
apt-get install -y lightdm
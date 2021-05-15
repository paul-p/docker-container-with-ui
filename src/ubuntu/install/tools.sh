#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y vim wget net-tools locales bzip2 \
    python-numpy sudo cron #used for websockify/novnc
apt-get clean -y

#echo "generate locales für en_US.UTF-8"
#locale-gen en_US.UTF-8

# Set the locale
#RUN apt update
#RUN apt install -y locales
#RUN touch /usr/share/locale/locale.alias
#ENV LANG fr_FR.UTF-8  
#ENV LANGUAGE fr_FR:fr  
#ENV LC_ALL fr_FR.UTF-8 
#RUN locale-gen fr_FR.UTF-8  

#echo "generate locales for fr_FR.UTF-8"
#locale-gen fr_FR.UTF-8
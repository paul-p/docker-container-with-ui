# Readme 

## Disclaimer
This code is based on the [docker-headless-vnc-container project](https://github.com/ConSol/docker-headless-vnc-container)

## What it does
The goal of this project is to make easy the start of virtual host in a docker container.
It has been originaly for tests which required a complete system with ligthdm and UI.
It contains
* ubuntu:18.04
* UI components (XFCE)
* Ligthdm links (the virtual host will be accessible directly on a Xorg session). You should be able to swith between your host session and your container session with Ctrl-F2 and Ctrl-F7
* Docker links (to be able to do Docker in Docker in your virtual host)
* Firefox in french
* An SSH serveur which accepts authentication by password

## How I tested it
On ubuntu 18.04

## How to run it
Just clone the project and start the boostrap.sh script
```
sudo git clone -b main https://github.com/paul-p/docker-headless-vnc-container.git
cd docker-headless-vnc-container.git
./bootstrap.sh
```

You will have to answer few questions
* Uninstall or Install ?
* Login and Password for creation of a new user

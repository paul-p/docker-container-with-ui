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

* Firefox in french
* An SSH serveur which accepts authentication by password

## How I tested it
On ubuntu 18.04

## How to run it
First, you need to install docker
```
sudo apt-get install docker.io
```
Then, just clone the project and start the boostrap.sh script
```
git clone -b main https://github.com/paul-p/docker-headless-vnc-container.git
cd docker-headless-vnc-container.git
./bootstrap.sh
```

You will have to answer few questions
```
Que souhaitez vos faire ?
[1] Désinstaller le poste virtuel (arrêt du container et suppression de l'image docker) (y/n)
[2] Installer le poste virtuel (création de l'image docker et lancement du container) (y/n)
[3] Stopper le poste virtuel (y/n)
[4] Lancer le poste virtuel (y/n) 
>
```
If you install, some other questions will be asked
```
Entrez le login de l'utilisateur sur le poste virtuel
Entrez le mot de passe de l'utilisateur sur le poste virtuel
```


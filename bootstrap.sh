#!/bin/bash
# A bash script to install a docker container with UI component and lightdm service
set +e

VIRTUAL_GUEST_INSTALL=`dirname "$0"`
VIRTUAL_GUEST_IMAGE_NAME="clap_virtual_guest_image"
VIRTUAL_GUEST_CONTAINER_NAME="virtual_host_container"

read -p "Voulez vous désinstaller le poste virtuel (y/n) " UNINSTALLVIRTUALGUEST  
read -p "Voulez vous installer / re-installer le poste virtuel (Xubuntu dockerisée) (y/n) " VIRTUALGUEST

if [ "$UNINSTALLVIRTUALGUEST" = "y" ]; then
    # Ask sudo rights
    sudo ls > /dev/null
    echo "Suppression d'un éventuel poste virtuel antérieur..."
    sudo docker stop $VIRTUAL_GUEST_CONTAINER_NAME
    sudo docker rm $VIRTUAL_GUEST_CONTAINER_NAME
    sudo docker image rm $VIRTUAL_GUEST_IMAGE_NAME
fi

if [ "$VIRTUALGUEST" = "y" ]; then
    echo "Installation des dépendances..."

    # Ask sudo rights
    sudo ls > /dev/null

    # Install ansible
    sudo dpkg -s ansible &> /dev/null
    if [ $? -ne 0 ]; then
        sudo apt-add-repository --yes --update ppa:ansible/ansible
        sudo apt-get install -y ansible
    fi

    read -p "Entrez le login de l'utilisateur sur le poste invité virtuel " GUEST_USERNAME  
    read -p "Entrez le mot de passe de l'utilisateur sur le poste invité virtuel   " GUEST_PASSWORD  

    echo "Arrêt d'un éventuel poste virtuel antérieur..."
    sudo docker stop $VIRTUAL_GUEST_CONTAINER_NAME
    #sudo docker rm $VIRTUAL_GUEST_CONTAINER_NAME

    echo "Installation du poste virtuel ..."
    sudo ansible-playbook -K ./playbook.yml --extra-vars "GUEST_USERNAME=$GUEST_USERNAME set GUEST_PASSWORD=$GUEST_PASSWORD set VIRTUAL_GUEST_INSTALL=$VIRTUAL_GUEST_INSTALL set VIRTUAL_GUEST_CONTAINER_NAME=$VIRTUAL_GUEST_CONTAINER_NAME set VIRTUAL_GUEST_IMAGE_NAME=$VIRTUAL_GUEST_IMAGE_NAME"
    
    echo "Le poste invité virtuel est maintenant installé et expose un port SSH sur cette adresse: $(docker inspect $VIRTUAL_GUEST_CONTAINER_NAME --format '{{.NetworkSettings.Networks.bridge.IPAddress}}'):22"
fi

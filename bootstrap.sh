#!/bin/bash
# A bash script to install a docker container with UI component and lightdm service
set +e

VIRTUAL_HOST_INSTALL=`dirname "$0"`
VIRTUAL_HOST_IMAGE_NAME="virtuel_host_image"
VIRTUAL_HOST_CONTAINER_NAME="virtual_host_container"
echo "Que souhaitez vos faire ?"
echo "[1] Lancer le poste virtuel (création de l'image docker et lancement du container)"
echo "[2] Stopper le poste virtuel"
echo "[3] Désinstaller le poste virtuel (arrêt du container et suppression de l'image docker)" 
read -p ">" ACTION

if [ "$ACTION" = "1" ] || [ "$ACTION" = "2" ] || [ "$ACTION" = "3" ]; then
    # Ask sudo rights
    sudo ls > /dev/null
    echo "Arrêt d'un éventuel poste virtuel antérieur..."
    sudo docker stop $VIRTUAL_HOST_CONTAINER_NAME
    sudo docker rm $VIRTUAL_HOST_CONTAINER_NAME
fi

if [ "$ACTION" = "1" ]; then
    read -p "Entrez le login de l'utilisateur sur le poste virtuel " GUEST_USERNAME  
    read -p "Entrez le mot de passe de l'utilisateur sur le poste virtuel   " GUEST_PASSWORD  

    echo "Construction de l'image ..."
    docker build -t $VIRTUAL_HOST_IMAGE_NAME .
    echo "Démarrage du poste virtuel..."
    docker run -d --name $VIRTUAL_HOST_CONTAINER_NAME -v /sys/fs/cgroup:/sys/fs/cgroup:ro --privileged --expose 22 $VIRTUAL_HOST_IMAGE_NAME
    echo "Ajout du compte utilisateur..."s
    docker exec -t $VIRTUAL_HOST_CONTAINER_NAME /dockerstartup/createUser.sh $GUEST_USERNAME $GUEST_PASSWORD
    echo "Le poste virtuel est maintenant démarré. Vous pouvez y accéder avec ssh : ssh $GUEST_USERNAME@$(docker inspect $VIRTUAL_HOST_CONTAINER_NAME --format '{{.NetworkSettings.Networks.bridge.IPAddress}}')"
fi

if [ "$ACTION" = "3" ]; then
    echo "Suppression de l'image docker"
    sudo docker image rm $VIRTUAL_HOST_IMAGE_NAME
fi

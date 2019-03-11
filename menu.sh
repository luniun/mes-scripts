#!/bin/bash
function deps {
echo "Installation des dependances"
apt update
apt upgrade -y
apt install curl git-core ca-certificates -y
}

function proxmox {
echo "Installation de proxmox"
echo "deb http://download.proxmox.com/debian/pve stretch pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget http://download.proxmox.com/debian/proxmox-ve-release-5.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-5.x.gpg
apt update
apt dist-upgrade -y
apt install proxmox-ve postfix open-iscsi -y
apt remove os-prober -y
}

function wamp {
echo "Installation du serveur Wamp"
apt update
apt upgrade -y
apt install mariadb-client mariadb-server -y
apt install php7.0 php7.0-mysql -y
apt install apache2 libapache2-mod-php7.0 -y
apt install phpmyadmin -y
}

function userplus {
echo "Entrer votre User: "
read newuser
adduser $newuser
mkdir /home/$newuser/torrent
mkdir /home/$newuser/torrent/en-cours
mkdir /home/$newuser/torrent/terminer
mkdir /home/$newuser/torrent/save
mkdir /home/$newuser/torrent/watch
mkdir /home/$newuser/torrent/media
chown -R $newuser:$newuser /home/$newuser
}

PS3="Votre choix : "
select item in "- Deps -" "- Proxmox -" "- Wamp -" "- Utilisateur -" "- Fin -"
do
echo "Vous avez choisi l'item $REPLY : $item"
case $REPLY in
1)
# Appel de la fonction sauve
deps
;;
2)
# Appel de la fonction restaure
proxmox
;;
3)
#Appel de la fonction wamp
wamp
;;
4)
#Creation d'utilisateur
userplus
;;
5)
echo "Fin du script"
exit 0
;;
*)
echo "Choix incorrect"
;;
esac
done

#! /bin/bash

whiptail --title "Test" --checklist "Choose:" 20 78 15 \
"deps" "" on \
"proxmox" "" off \
"wamp-server" "" off \

# If "John" is selected, run this function:
function deps {
echo "You chose deps"
./deps.sh
}

# If "Glen" is selected, run this function:
function proxmox {
echo "You chose Proxmox"
./proxmox.sh
}

# If "Adam" is selected, run this function:
function wanp-server {
echo "You chose Wamp-Server"
./wamp-server.sh
}

exit

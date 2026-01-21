#!/bin/bash
REAL_USER="${SUDO_USER:-$USER}"
REAL_HOME="$(getent passwd "$REAL_USER" | cut -d: -f6)"
KH="$REAL_HOME/.ssh/known_hosts"

while IFS= read -r r_item; do
    echo "Purging $r_item"
    rm -rf "$r_item"
done < "./lib/removal_items/r_list"

echo "Purging docker lab containers"
docker rm -f $(docker ps -aq --filter "name=node") 2>/dev/null || true

echo "Purging docker lab images"
docker rmi -f $(docker images -q "ansible*") 2> /dev/null || true

echo "Cleaning lab SSH fingerprints..."

ssh-keygen -R "[127.0.0.1]:2222" || true
ssh-keygen -R "[127.0.0.1]:2223" || true
ssh-keygen -R "[127.0.0.1]:2222" -f "$KH" || true
ssh-keygen -R "[127.0.0.1]:2223" -f "$KH" || true

echo "Changing ansible variable username back to root"
sed -i '0,/ ansible /s// root /' ./inventory/group_vars/all.yaml


docker run --rm grycap/cowsay /usr/games/cowsay -s "Lab has now been purged"

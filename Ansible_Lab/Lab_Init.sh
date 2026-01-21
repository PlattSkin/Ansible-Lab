#!/usr/bin/env bash
set -euo pipefail

docker run --rm grycap/cowsay /usr/games/cowsay -d "Hi, lets build this thing"

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REAL_USER="${SUDO_USER:-$USER}"
REAL_HOME="$(getent passwd "$REAL_USER" | cut -d: -f6)"

# Ensure SSH key exists
[ -f "$BASE_DIR/secrets/ansible_lab_key" ] || \
ssh-keygen -t ed25519 -f "$BASE_DIR/secrets/ansible_lab_key" -N "" -C "ansible-lab"

chmod 600 "$BASE_DIR/secrets/ansible_lab_key"
cp "$BASE_DIR/secrets/ansible_lab_key.pub" "$BASE_DIR/docker/authorized_keys"

# Build containers
docker build "$BASE_DIR/docker" -t "ansible_image"
docker-compose -f "$BASE_DIR/docker/docker-compose.yml" up -d || \
docker compose -f "$BASE_DIR/docker/docker-compose.yml" up -d

# Wait for SSH ports
until nc -z 127.0.0.1 2222; do sleep 1; done
until nc -z 127.0.0.1 2223; do sleep 1; done



# Setup python env
python3 -m venv venv
source venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r "$BASE_DIR/lib/requirements.txt"

# Bootstrap nodes
ansible-playbook -i inventory "$BASE_DIR/bootstrap.yml"

# Prepare SSH trust

KH="$REAL_HOME/.ssh/known_hosts"

mkdir -p "$REAL_HOME/.ssh"
chown "$REAL_USER":"$REAL_USER" "$REAL_HOME/.ssh"
chmod 700 "$REAL_HOME/.ssh"

touch "$KH"
chown "$REAL_USER":"$REAL_USER" "$KH"
chmod 600 "$KH"

ssh-keygen -R "[127.0.0.1]:2222" -f "$KH" || true
ssh-keygen -R "[127.0.0.1]:2223" -f "$KH" || true

ssh-keyscan -p 2222 127.0.0.1 >> "$KH"
ssh-keyscan -p 2223 127.0.0.1 >> "$KH"

chown "$REAL_USER":"$REAL_USER" "$KH"
chmod 600 "$KH"

#Make current user ansible ready

chown "$REAL_USER":"$REAL_USER" "$BASE_DIR/secrets/ansible_lab_key"

#Change to ansible user for the nodes

sed -i 's/root/ansible/g' ./inventory/group_vars/all.yaml

docker run --rm grycap/cowsay /usr/games/cowsay -w "Hi, lab is now built"

#!/bin/bash

#INIT COW
docker run --rm grycap/cowsay /usr/games/cowsay -d "Hi, lets build this this thing"
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#Build The Docker Containers for the lab
cat $BASE_DIR/secrets/ansible_lab_key.pub || ssh-keygen -t ed25519 -f $BASE_DIR/secrets/ansible_lab_key -N "" -C "ansible-lab"
chmod 600 $BASE_DIR/secrets/ansible_lab_key
cp $BASE_DIR/secrets/ansible_lab_key.pub $BASE_DIR/docker/authorized_keys
docker build $BASE_DIR/docker -t "ansible_image"
docker-compose -f $BASE_DIR/docker/docker-compose.yml up -d || docker compose -f $BASE_DIR/docker/docker-compose.yml up -d

#Setup the python environment
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r $BASE_DIR/lib/requirements.txt
ssh-keyscan -p 2222 127.0.0.1 >> ~/.ssh/known_hosts
ssh-keyscan -p 2223 127.0.0.1 >> ~/.ssh/known_hosts

##Run Bootstrap.yml configure vms to be ansible ready##
ansible-playbook -i inventory $BASE_DIR/bootstrap.yml

#INIT FINISH COW
docker run --rm grycap/cowsay /usr/games/cowsay -w "Hi, lab is now built"
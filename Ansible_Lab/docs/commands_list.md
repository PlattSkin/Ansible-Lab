##Build the Docker Image##
cd docker
ssh keygen -t ed25519 -f ansible_lab_key
cp ansible_lab_key.pub authorized_keys
cp ansible_lab_key ../secrets
cp ansible_lab_key.pub ../secrets
docker build . -t "ansible-image"
docker-compose up -d

##Ansible Mangaged Host python env##

python3 -m venv venv
source venv/bin/activate
pip install -r ./lib/requirements.txt


##Run Bootstrap.yml configure vms to be ansible ready##

ansible-playbook -i inventory bootstrap.yml

##After bootstrap runs##
echo "ansible_user: ansible" > ./inventory/group_vars/all.yaml
# Build an ansible Lab

Need to be able to build a self repeating ansible lab environment platform for continued portable ansible learning

14/01/2026

    The plan:

Infrastructure
    -Docker builds image with SSH, Python, sudo installed - Makes SSH work
Orchestrates
    -Docker compose builds multiple containers - Orchestrates Containers
Configuration
        -Ansible bootstrap
        -Creates user
        -applies keys from ansible host
up.sh - docker up
down.sh docker down
ansible-cfg

Same Inventory everytime

createproject.sh
    -new dir
    -.venv
    -touch new ansible playbook


Tasks:

1. Create an image dockerfile that includes ssh python and sudo - must include root keys setup + mandatory ssh directories
2. Docker Compose to orchestrate deployment
3. Ansible bootstrap creation - which gets ansible working with inventory
4. Create the docker up and down shell commands
5. define ansible-cfg

Inputs: 

    =Docker Image = ansible-image

Outputs:

    +SSH keys in docker
    +Docker ansible_image image








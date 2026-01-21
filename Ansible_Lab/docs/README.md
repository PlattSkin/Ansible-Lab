<h1>Ansible-Lab</h1>

Repeatable Ansible lab built with docker using python env

## Overview

This project provides a repeatable, portable Ansible lab environment where the host machine acts as the Ansible control node, running Ansible inside a Python virtual environment, while Docker containers simulate managed target nodes accessed over SSH.
 
This design mirrors real-world automation workflows used in production environments, CI pipelines, and automation servers — while remaining lightweight, fast to deploy, and easy to reset.
 
The lab enables consistent experimentation with:
 
 -Ansible playbooks and roles
 
 -Inventory management
 
 -SSH-based automation
 
 -Idempotent infrastructure testing
 
 -Git-based automation workflows
 
All without requiring virtual machines or permanent system changes.

The goal:

Clone → Run → Lab.

## Features

Docker Based Ansible control + target nodes,
Fully repeatable environment,
portable across anything Linux,
SSH preconfigured between nodes,
idempotent setup & teardown,
Git-tracked infrastructure for lab versioning,

<h2>Prerequisites</h2>

Docker, 
Docker Compose,
OpenSSH,
Python3


**Quick verification**

  ```bash
docker --version
docker compose version
ssh -V
python3 --version
```

## Installation

```bash
git clone <repository-url>
cd <repository-name>
chmod +x Lab_Init.sh
./Lab_Init.sh
```
This sets up the ansible environment by building the docker image and runs the nodes 1 and 2 ansible managed nodes with user and host trust already preconfigured using a bootstrap.yaml playbook.

The lab will be fully up now and ready to use

## Usage




## Repository Structure
 ```text
Ansible-Lab
.
├── Lab_Init.sh      #Lab Installation Script
├── Lab_Remove.sh    #Lab Uninstallation Script
├── ansible.cfg      #Default Ansible Config(can be altered just keep the host verification switched off)
├── bootstrap.yml    #Managed Node configuration playbook related to installation
├── docker           #Docker related files
├── docs             #Repository Documentation
├── inventory        #Ansible inventory for the lab
├── lib              #Inputs for install scripts
├── playbooks        #Used for running your own custom playbooks against your inventory
└── secrets          #SSH items for the Lab
```
## Documentation


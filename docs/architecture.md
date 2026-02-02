# Ansible Lab Architecture

Purpose
-------
The Ansible Lab provides a controlled, repeatable environment for developing and testing Ansible automation. It is designed to mimic common infrastructure automation workflows while remaining lightweight and disposable.

High-Level Architecture
-----------------------
- Ansible control node
- Managed nodes
- Shared inventory and variables
- Shell-based lifecycle management

Core Components
---------------

Ansible Control Node
- Executes playbooks
- Hosts inventory and configuration
- Central orchestration point

Managed Nodes
- Act as Ansible targets
- Container-based
- Stateless

Inventory
- Static inventory under inventory/
- Group variables under group_vars/

Playbooks
- bootstrap.yml for initial setup
- playbooks directory for experimentation

Docker Layer
- Dockerfile defines runtime
- docker-compose.yml manages containers

Lifecycle Scripts
- Lab_Init.sh creates and initialises the lab
- Lab_Remove.sh destroys and resets the lab

Execution Flow
--------------
1. Initialise lab
2. Start containers
3. Load inventory and variables
4. Execute playbooks
5. Iterate and destroy as needed

Configuration and State
-----------------------
- ansible.cfg defines behaviour
- Variables via group_vars
- Secrets excluded from version control

Assumptions and Constraints
---------------------------
- Single-user
- Local execution
- Disposable environment

Future Enhancements
-------------------
- Roles
- Dynamic inventory
- Molecule testing
- CI integration

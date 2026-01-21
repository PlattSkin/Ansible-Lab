<h1>Ansible-Lab</h1>

Repeatable Ansible lab built with docker using python env

<h2>Overview</h2>

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

<h2>Features</h2>

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

<h2>Installation</h2>

```bash
git clone <repository-url>
cd <repository-name>
chmod +x Lab_Init.sh
./Lab_Init.sh
```


## Usage
...

## Repository Structure
...

## Roadmap
...

## Documentation
- Architecture: docs/architecture.md
- Security: docs/security.md
- Contributing: docs/contributing.md
- Troubleshooting: docs/troubleshooting.md

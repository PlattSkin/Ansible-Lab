# Repository Overview


This document describes the structure and organisation of the Ansible Lab repository.
It is intended to help contributors and reviewers quickly understand where things live and why.

The repository favours explicit structure and predictability over abstraction.

--------------------------------------------------

## Repository Intent

The repository is structured to:
- Clearly separate infrastructure lifecycle concerns from Ansible logic
- Keep automation readable and easy to iterate on
- Support safe experimentation through disposability

Each top-level directory has a single, well-defined purpose.

--------------------------------------------------

## Top-Level Layout


```text
.
├── ansible.cfg
├── bootstrap.yml
├── docker/
├── docs/
├── inventory/
├── lib/
├── playbooks/
├── secrets/
├── Lab_Init.sh
├── Lab_Remove.sh
└── LICENSE
```

--------------------------------------------------

## File and Directory Responsibilities


***ansible.cfg***
Defines Ansible behaviour for the lab environment.
Contains opinionated defaults to ensure predictable, repeatable execution.

***bootstrap.yml***
Initial bootstrap playbook used to prepare the lab.
Ensures the environment is in a known state before further playbooks are run.

***docker/***
Container definitions for the lab runtime.
This directory is responsible for how the lab is created and networked.

***Dockerfile*** defines the base runtime

***docker-compose.yml*** manages container lifecycle and connectivity

***docs/***
Project documentation and design context.

***architecture.md*** describes the overall system design

***repository.md*** explains repository structure and intent

***changelog*** records notable changes

***inventory/***
Static Ansible inventory and variable definitions.

***hosts*** defines managed nodes

***group_vars/*** contains group-level configuration

***lib/***
Shared configuration and supporting metadata used by the lab.

***all.yaml*** contains shared values

***requirements.txt*** defines Python dependencies

***removal_items/*** contains data used during teardown

***playbooks/***
Ansible playbooks used for experimentation and iteration.
This directory is expected to evolve as the lab grows.

***secrets/***
Placeholder location for secrets.
Secrets are intentionally excluded from version control and are not committed.

***Lab_Init.sh***
Primary entry point for creating and initialising the lab environment.

***Lab_Remove.sh***
Primary mechanism for tearing down the lab and resetting state.

--------------------------------------------------

## Structural Conventions

- Lifecycle management handled outside Ansible
- Ansible focuses on configuration, not provisioning
- All components are disposable
- Explicit structure preferred over abstraction

--------------------------------------------------

## Navigating the Repository

Running the lab: start with Lab_Init.sh
Changing infrastructure: docker/
Working with Ansible: inventory/ and playbooks/
Understanding design decisions: docs/architecture.md

--------------------------------------------------

## Change Philosophy

Changes should preserve repeatability, avoid hidden state,
and keep the repository easy to reason about.

The goal is clarity, not scale.

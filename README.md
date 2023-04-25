# muetzi Linux Client

(Initially generated from Potos Vanilla)

I am using linux for my desktop since debian woody and am supporting
family members with ubuntu clients since ubuntu dapper (?).

The machines were deployed by cloning them from my own
"gold installation" and with `grml` boot, `rsync` and
reinstalling the boot loader.

The clients work fully offline. But if there is connectivity,
managed clients have an "always on" connection to my home
VPN server. This is used for remote support, management
and backup. My personal clients use the same VPN, but
it is established manually from network manager.

Clients in the home network can use an LDAP user for
login and get a personal and read only share mounted
automatically.

The potos framework should enable me to implement
all this and more in a modern, software defined way.

I will use the issues on this repo to track requirements,
gather ideas, etc.

FIXME: this is fake: [![Test](https://github.com/projectpotos/ansible-specs-potos/actions/workflows/test.yml/badge.svg)](https://github.com/projectpotos/ansible-specs-potos/actions/workflows/test.yml)

## Most important files

### `files/templates/requirements.yml.j2`
A dynamic ansible galaxy requirements files for roles to be executed in that run. Have a look [here](https://github.com/projectpotos/ansible-specs-potos/blob/main/files/templates/requirements.yml.j2) for an example

### `templates/collections.yml.j2`
List with required collections that need to be installed e.g.
```
---
collections:
  - ansible.posix 
```
or [here](https://github.com/projectpotos/ansible-specs-potos/blob/main/templates/collections.yml.j2) the example from this repo

## 

# vars

# Templates

Get applied by the templating engine before the playbook run

# Files

Get copied to the playbook directory to be then later used in different roles

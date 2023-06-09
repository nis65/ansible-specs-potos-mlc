# muetzi Linux Client

I am using linux for my desktop since debian woody and am supporting
family members with ubuntu clients since ubuntu dapper (?).

The machines were deployed by cloning them from my own
"gold installation" and with `grml` boot, `rsync` and
reinstalling the boot loader.

This specs repo (together with a few additional roles)
is used to manage the zoo of my family desktop machines.
There are three flavours i need to support

* the desktop node is integrated into the home network (LDAP login, network data shares)
* the road warriors can work offline, but if online they can establish a VPN connection to the home
  network in two ways:
  * a *fully managed* host establishes automatically the VPN connection but it is
    used to get remote support only.
  * a manually managed host (my own) where the VPN connection is manually
    established and usually used to access more services from the home  network.

Some of the advanced features are not suitable for all family members,
so I might need to maintain multiple specs repository branches.

FIXME: this is fake: [![Test](https://github.com/projectpotos/ansible-specs-potos/actions/workflows/test.yml/badge.svg)](https://github.com/projectpotos/ansible-specs-potos/actions/workflows/test.yml)

## current state

The current setup is a combination of
* **U** unchanged potos roles (all values at their defaults)
* **V** potos roles with additional **v**ariables set
* **C** potos roles from my own repo (as the upstream needs some time to merge my **c**ontributions)
* **O** my own roles derived from the potos template role.





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

# vars

# Templates

Get applied by the templating engine before the playbook run

# Files

Get copied to the playbook directory to be then later used in different roles

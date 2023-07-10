# muetzi Linux Client

I am using linux for my desktop since debian woody and am supporting
family members with ubuntu clients since ubuntu dapper (?).

The machines were deployed by cloning them from my own
"gold installation" and with `grml` boot, `rsync` and
reinstalling the boot loader.

This specs repo (together with a few additional roles)
is used to manage the zoo of my family desktop machines.
There are three flavours i need to support

* (wishlist): the desktop node is integrated into the home network (LDAP login, network data shares)
* the road warriors can work offline, but if online they can establish a VPN connection to the home
  network in two ways:
  * (implemented) a *fully managed* host establishes automatically the VPN connection but it is
    used to get remote support only.
  * (tested) a manually managed host (my own) where the VPN connection is manually
    established and usually used to access more services from the home  network.

Some of the advanced features are not suitable for all family members,
so I might need to maintain multiple specs repository branches.

## current state

### features

* language / timezone / keyboard set to switzerland

* desktop tweaked to my personal taste

  * changed window behavior
  * favorite apps (the apps in the dock) set to a sane default
  * sane system wide defaults for vim, `EDITOR`, propsed configs for `ssh` in `/usr/local/src`
  * integration of argos and some example scripts for managing SMB shares, mpd/snapcast (multiroom), suspend/hibernate, screen resolution.

* scripts/sudo permissions to mount CIFS/SMB shares as normal user without gvfs (too slow)

* suspend/hibernate that **really** works

### `files/templates/requirements.yml.j2`

The current setup is a combination of
* **U** unchanged potos roles (all values at their defaults)
* **V** potos roles with additional **v**ariables (and files) set
* **C** potos roles from my own repo (as the upstream needs some time to merge my **c**ontributions)
* **O** my own roles derived from the potos template role, usually at least one variable used

### `files/templates/requirements.yml.j2`

A dynamic ansible galaxy requirements files for roles to be executed in that run.

I currently have configured the following roles:

| state | name | comment |
| ----- | ---- | ------- |
| V | `ansible-role-potos_firstboot` | (currently C), rebuild initramfs from hibernate, create users/groups |
| U | `ansible-role-potos_basics`    | (currently C) |
| V | `ansible-role-potos_wallpaper` | own wallpaper |
| O | `ansible-role-potos_dconf`     | lots of desktop tweaks, including "favorite apps" |
| O | `ansible-role-potos_locale`    | set system locale to `de_CH.UTF-8`, install gnome german language pack |
| O | `ansible-role-potos_time`      | using role default time zone `Europe/Zurich` |
| O | `ansible-role-potos_openvpn`   | using role default to install scripts to configure system VPN |
| O | `ansible-role-potos_argos`     | role has no variables (yet) |
| O | `ansible-role-potos_files`     | distribute some helper scripts/polkit/sudo/menu files |
| V | `ansible-role-potos_apt`       | Install a bunch of packages, ansible from a ppa etc |
| O | `ansible-role-potos_hibernate` | Make hibernate work on my specific laptop |


## Other important files

### `templates/collections.yml.j2`
List with required collections that need to be installed e.g.
```
---
collections:
  - ansible.posix
```
or [here](https://github.com/projectpotos/ansible-specs-potos/blob/main/templates/collections.yml.j2) the example from this repo

# vars

See the files in the `/vars` directory of this repo.

# Templates

Get applied by the templating engine before the playbook run

# Files

Get copied to the playbook directory to be then later used in different roles

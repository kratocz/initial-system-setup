#!/bin/bash
set -e
. /etc/os-release

apt-get update

apt-get install vim mc gpm rsync sudo btrfs-compsize docker.io docker-compose net-tools tree ncdu collectd moreutils openvpn


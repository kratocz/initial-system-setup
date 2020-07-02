#!/bin/bash
set -e
REPOD="/etc/zypp/repos.d"
source /etc/os-release

zypper refresh

zypper install vim mc gpm rsync sudo compsize docker docker-compose net-tools tree ncdu collectd moreutils openvpn tcpdump lynx links elinks curl net-tools-deprecated


#!/bin/bash
set -e
REPOD="/etc/zypp/repos.d"
source /etc/os-release

# Add some repositories
# test -e "$REPOD/home_Alexx2000.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:Alexx2000/openSUSE_Leap_$VERSION/home:Alexx2000.repo" # package doublecmd-qt5
# test -e "$REPOD/home_stawidy.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:stawidy/openSUSE_Leap_$VERSION/home:stawidy.repo" # package asbru-cm
# test -e $REPOD/home_stawidy.repo || zypper addrepo "https://download.opensuse.org/repositories/home:stawidy/$VERSION/home:stawidy.repo" # package asbru-cm
# test -e "$REPOD/home_Dead_Mozay.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:Dead_Mozay/openSUSE_Leap_$VERSION/home:Dead_Mozay.repo" # package dbeaver
# test -e "$REPOD/home_nad1r.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:nad1r/openSUSE_Leap_15.2/home:nad1r.repo" # package dbeaver
test -e "$REPOD/home_Dead_Mozay.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:Dead_Mozay/$VERSION/home:Dead_Mozay.repo" # package dbeaver
test -e "$REPOD/packman.repo" || zypper addrepo -cfp 90 "http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_$VERSION/" "packman" # more packages
test -e "$REPOD/teamviewer.repo" || zypper addrepo "http://linux.teamviewer.com/yum/stable/main/binary-x86_64/" "teamviewer" # package teamviewer
# test -e "$REPOD/home_ecsos_monitoring.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:ecsos:monitoring/openSUSE_Leap_$VERSION/home:ecsos:monitoring.repo" # package java-13-openjdk
test -e "$REPOD/home_frispete_java.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:frispete:java/$VERSION/home:frispete:java.repo" # packages java-13-openjdk, java-17-openjdk
test -e "$REPOD/server_messaging.repo" || zypper addrepo "https://download.opensuse.org/repositories/server:messaging/openSUSE_Leap_15.1/server:messaging.repo" # package slack
# test -e "$REPOD/home_-miska-.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:-miska-/openSUSE_Leap_$VERSION/home:-miska-.repo" # package bedup
test -e "$REPOD/home_Ximi1970_openSUSE_Extra.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:Ximi1970:openSUSE:Extra/openSUSE_Tumbleweed/home:Ximi1970:openSUSE:Extra.repo" # package maven
test -e "$REPOD/home_jirislaby_kotatko.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:jirislaby:kotatko/$VERSION/home:jirislaby:kotatko.repo" # package datovka
test -e "$REPOD/home_ecsos_server.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:ecsos:server/$VERSION/home:ecsos:server.repo" # up-to-date package php-composer
test -e "$REPOD/network_cryptocurrencies.repo" || zypper addrepo "https://download.opensuse.org/repositories/network:cryptocurrencies/openSUSE_Leap_$VERSION/network:cryptocurrencies.repo" # electrum (Bitcoin wallet client)
# test -e "$REPOD/network_vpn.repo" || zypper addrepo "https://download.opensuse.org/repositories/network:vpn/openSUSE_Leap_$VERSION/network:vpn.repo" # OpenVPN newest version due to digests support
# test -e "$REPOD/home_msvec.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:msvec/openSUSE_Leap_$VERSION/home:msvec.repo" # package node-gyp
# test -e "$REPOD/home_illuusio_nodejs-packages.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:illuusio:nodejs-packages/openSUSE_Leap_15.2/home:illuusio:nodejs-packages.repo" # package nodejs16
test -e "$REPOD/home_ecsos.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:ecsos/15.4/home:ecsos.repo" # package nodejs17
# test -e "$REPOD/home_suyedy.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:suyedy/openSUSE_Tumbleweed/home:suyedy.repo" # package perl-Gnome2-Vte (required by package asbru-cm-5.2.0-lp154.1.1.noarch)
# test -e "$REPOD/home_derselbst_anmp.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:derselbst:anmp/openSUSE_Tumbleweed/home:derselbst:anmp.repo" # package libavcodec57
test -e "$REPOD/home_seife_testing.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:seife:testing/$VERSION/home:seife:testing.repo" # package collectd
test -e "$REPOD/home_cabelo_innovators.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:cabelo:innovators/$VERSION/home:cabelo:innovators.repo" # package zabbix-agent
test -e "$REPOD/home_jmairboeck.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:jmairboeck/$VERSION/home:jmairboeck.repo" # package libappindicator-gtk3 for slack-4.28.184-0.1.el8.x86_64.rpm
#test -e "$REPOD/home_dfaure.repo" || zypper addrepo https://download.opensuse.org/repositories/home:dfaure/$VERSION/home:dfaure.repo # package glibc

# Remove some repositories added earier
! test -e "$REPOD/home_ecsos_monitoring.repo" || zypper removerepo "home_ecsos_monitoring" # old repository for package java-13-openjdk
! test -e "$REPOD/home_cho2.repo" || zypper removerepo "home_cho2" # old repository for package slack

zypper refresh || echo "Warning: zypper refresh: there were error(s)" 1>&2

# removed from list:
#   node-gyp code bedup electrum asbru-cm vlc-codecs
zypper install vim mc screen kdiff3 docker docker-compose openvpn ncdu doublecmd-qt5 krusader krusader-doc krename unrar collectd mlocate net-tools-deprecated clamav gcc gimp inkscape dbeaver libQt5WebKit5 libQt5WebKitWidgets5 discord zip chromium apache2-utils npm12 MozillaThunderbird java-13-openjdk java-17-openjdk duperemove gradle slack lynx links elinks tcpdump datovka junit maven php php-composer php-gd php-mbstring php-mysql pinta rclone iotop curlftpfs filezilla mosh telegram-desktop jq go transmission nodejs17 nodejs17-devel gcc-c++ nethogs xdotool shutter xprintidle libva-utils vlc moreutils erlang git make libblkid-devel glibc zlib-devel compsize dnf collectd zabbix-agent hddtemp glibc putty hardinfo git-filter-repo powerpc-utils xev kcachegrind acpi

# echo -n "Searching Angular ... " ; which ng || npm install -g @angular/cli


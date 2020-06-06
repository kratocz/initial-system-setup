#!/bin/bash
set -e
REPOD="/etc/zypp/repos.d"
source /etc/os-release
test -e "$REPOD/home_Alexx2000.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:Alexx2000/openSUSE_Leap_$VERSION/home:Alexx2000.repo" # package doublecmd-qt5
test -e "$REPOD/home_stawidy.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:stawidy/openSUSE_Leap_$VERSION/home:stawidy.repo" # package asbru-cm
test -e "$REPOD/home_Dead_Mozay.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:Dead_Mozay/openSUSE_Leap_$VERSION/home:Dead_Mozay.repo" # package dbeaver
test -e "$REPOD/packman.repo" || zypper addrepo -cfp 90 "http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_$VERSION/" "packman" # more packages
test -e "$REPOD/teamviewer.repo" || zypper addrepo "http://linux.teamviewer.com/yum/stable/main/binary-x86_64/" teamviewer # package teamviewer
test -e "$REPOD/home_ecsos_monitoring.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:ecsos:monitoring/openSUSE_Leap_$VERSION/home:ecsos:monitoring.repo" # package java-13-openjdk
test -e "$REPOD/home_cho2.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:cho2/openSUSE_Leap_15.1/home:cho2.repo" # package slack

zypper refresh

zypper install vim mc screen kdiff3 docker docker-compose opera openvpn ncdu doublecmd-qt5 krusader krusader-doc krename unrar collectd mlocate net-tools-deprecated clamav gcc asbru-cm gimp inkscape dbeaver libQt5WebKit5 libQt5WebKitWidgets5 discord zip chromium apache2-utils npm10 MozillaThunderbird java-13-openjdk duperemove gradle slack 

echo -n "Searching Angular ... " ; which ng || npm install -g @angular/cli


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
! test -e "$REPOD/home_cho2.repo" || zypper removerepo "home_cho2" # old repository for package slack
test -e "$REPOD/server_messaging.repo" || zypper addrepo "https://download.opensuse.org/repositories/server:messaging/openSUSE_Leap_$VERSION/server:messaging.repo" # package slack
test -e "$REPOD/home_-miska-.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:-miska-/openSUSE_Leap_$VERSION/home:-miska-.repo" # package bedup
test -e "$REPOD/Java_packages.repo" || zypper addrepo "https://download.opensuse.org/repositories/Java:packages/openSUSE_Leap_$VERSION/Java:packages.repo" # package maven
test -e "$REPOD/network.repo" || zypper addrepo "https://download.opensuse.org/repositories/network/openSUSE_Leap_$VERSION/network.repo" # package datovka
test -e "$REPOD/home_ecsos_server.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:ecsos:server/openSUSE_Leap_$VERSION/home:ecsos:server.repo" # up-to-date package php-composer
test -e "$REPOD/network_cryptocurrencies.repo" || zypper addrepo "https://download.opensuse.org/repositories/network:cryptocurrencies/openSUSE_Leap_$VERSION/network:cryptocurrencies.repo" # electrum (Bitcoin wallet client)
#rpm --import https://packages.microsoft.com/keys/microsoft.asc || true ; test -e "$REPOD/vscode.repo" || sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > '"$REPOD/vscode.repo"

zypper refresh

zypper install vim mc screen kdiff3 docker docker-compose opera openvpn ncdu doublecmd-qt5 krusader krusader-doc krename unrar collectd mlocate net-tools-deprecated clamav gcc asbru-cm gimp inkscape dbeaver libQt5WebKit5 libQt5WebKitWidgets5 discord zip chromium apache2-utils npm10 MozillaThunderbird java-13-openjdk duperemove gradle slack lynx links elinks bedup tcpdump code datovka maven php php-composer php-gd php-mbstring php-mysql pinta rclone iotop electrum curlftpfs filezilla

echo -n "Searching Angular ... " ; which ng || npm install -g @angular/cli


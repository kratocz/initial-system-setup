#!/bin/bash
set -e
REPOD="/etc/zypp/repos.d"
source /etc/os-release
test -e "$REPOD/home_Alexx2000.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:Alexx2000/openSUSE_Leap_$VERSION/home:Alexx2000.repo" # package doublecmd-qt5
test -e "$REPOD/home_stawidy.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:stawidy/openSUSE_Leap_$VERSION/home:stawidy.repo" # package asbru-cm
# test -e "$REPOD/home_Dead_Mozay.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:Dead_Mozay/openSUSE_Leap_$VERSION/home:Dead_Mozay.repo" # package dbeaver
! test -e "$REPOD/home_Dead_Mozay.repo" || zypper removerepo "home_Dead_Mozay" # old repository for package dbeaver
test -e "$REPOD/home_nad1r.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:nad1r/openSUSE_Leap_15.2/home:nad1r.repo" # package dbeaver
test -e "$REPOD/packman.repo" || zypper addrepo -cfp 90 "http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_$VERSION/" "packman" # more packages
test -e "$REPOD/teamviewer.repo" || zypper addrepo "http://linux.teamviewer.com/yum/stable/main/binary-x86_64/" teamviewer # package teamviewer
# test -e "$REPOD/home_ecsos_monitoring.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:ecsos:monitoring/openSUSE_Leap_$VERSION/home:ecsos:monitoring.repo" # package java-13-openjdk
! test -e "$REPOD/home_ecsos_monitoring.repo" || zypper removerepo "home_ecsos_monitoring" # old repository for package java-13-openjdk
test -e "$REPOD/home_frispete_java.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:frispete:java/openSUSE_Leap_15.2/home:frispete:java.repo" # packages java-13-openjdk, java-17-openjdk
! test -e "$REPOD/home_cho2.repo" || zypper removerepo "home_cho2" # old repository for package slack
test -e "$REPOD/server_messaging.repo" || zypper addrepo "https://download.opensuse.org/repositories/server:messaging/openSUSE_Leap_$VERSION/server:messaging.repo" # package slack
test -e "$REPOD/home_-miska-.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:-miska-/openSUSE_Leap_$VERSION/home:-miska-.repo" # package bedup
test -e "$REPOD/Java_packages.repo" || zypper addrepo "https://download.opensuse.org/repositories/Java:packages/openSUSE_Leap_$VERSION/Java:packages.repo" # package maven
test -e "$REPOD/network.repo" || zypper addrepo "https://download.opensuse.org/repositories/network/openSUSE_Leap_$VERSION/network.repo" # package datovka
test -e "$REPOD/home_ecsos_server.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:ecsos:server/openSUSE_Leap_$VERSION/home:ecsos:server.repo" # up-to-date package php-composer
test -e "$REPOD/network_cryptocurrencies.repo" || zypper addrepo "https://download.opensuse.org/repositories/network:cryptocurrencies/openSUSE_Leap_$VERSION/network:cryptocurrencies.repo" # electrum (Bitcoin wallet client)
test -e "$REPOD/network_vpn.repo" || zypper addrepo "https://download.opensuse.org/repositories/network:vpn/openSUSE_Leap_$VERSION/network:vpn.repo" # OpenVPN newest version due to digests support
test -e "$REPOD/home_msvec.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:msvec/openSUSE_Leap_15.2/home:msvec.repo" # package node-gyp
test -e "$REPOD/home_illuusio_nodejs-packages.repo" || zypper addrepo "https://download.opensuse.org/repositories/home:illuusio:nodejs-packages/openSUSE_Leap_15.2/home:illuusio:nodejs-packages.repo" # package nodejs16
# stopped to work: test -e "$REPOD/network_im_signal.repo" || zypper addrepo "https://download.opensuse.org/repositories/network:im:signal/openSUSE_Leap_$VERSION/network:im:signal.repo" # package signal-desktop
#rpm --import https://packages.microsoft.com/keys/microsoft.asc || true ; test -e "$REPOD/vscode.repo" || sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > '"$REPOD/vscode.repo"

zypper refresh || echo "Warning: zypper refresh: there were error(s)" 1>&2

zypper install vim mc screen kdiff3 docker docker-compose openvpn ncdu doublecmd-qt5 krusader krusader-doc krename unrar collectd mlocate net-tools-deprecated clamav gcc asbru-cm gimp inkscape dbeaver libQt5WebKit5 libQt5WebKitWidgets5 discord zip chromium apache2-utils npm12 MozillaThunderbird java-13-openjdk java-17-openjdk duperemove gradle slack lynx links elinks bedup tcpdump code datovka junit maven php php-composer php-gd php-mbstring php-mysql pinta rclone iotop electrum curlftpfs filezilla mosh telegram-desktop jq go transmission node-gyp nodejs16 nodejs16-devel gcc-c++ nethogs xdotool shutter xprintidle libva-utils vlc vlc-codecs moreutils

echo -n "Searching Angular ... " ; which ng || npm install -g @angular/cli


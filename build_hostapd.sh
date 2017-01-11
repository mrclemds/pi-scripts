# /bin/bash

apt-get install git build-essential fakeroot devscripts debhelper libnl-dev libssl-dev

cd /usr/srv

git clone https://github.com/jekader/hostapd-rtl.git
cd hostapd-rtl
bash build.sh
dpkg -i ../hostapd-rtl_2.4-4_armhf.deb
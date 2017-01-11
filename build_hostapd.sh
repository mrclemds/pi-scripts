# /bin/bash

# this line show un text mode changlogs instead of pager mode
sed -i "s/frontend=pager/frontend=text/g" /etc/apt/listchanges.conf

apt-get update && apt-get -y upgrade

apt-get -y install apt-transport-https git build-essential fakeroot devscripts debhelper libnl-dev libssl-dev

cd /usr/srv

git clone https://github.com/jekader/hostapd-rtl.git
cd hostapd-rtl
bash build.sh
dpkg -i ../hostapd-rtl_2.4-4_armhf.deb
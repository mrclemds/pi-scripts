# /bin/bash

# this line show un text mode changlogs instead of pager mode
sed -i "s/frontend=pager/frontend=text/g" /etc/apt/listchanges.conf

apt-get update && apt-get -y upgrade

apt-get -y install apt-transport-https

apt-get -y install  build-essential bc git wget dkms

cd /usr/src
git clone --depth=1 https://github.com/raspberrypi/linux
ln -s linux $(uname -r)
ln -s /usr/src/linux /lib/modules/$(uname -r)/build

cd linux
wget -O Module.symvers https://raw.githubusercontent.com/raspberrypi/firmware/master/extra/Module7.symvers
KERNEL=kernel7
make bcm2709_defconfig
make prepare
make modules_prepare

cd ..

git clone --depth=1 https://github.com/diederikdehaas/rtl8812AU.git
DRV_NAME=rtl8812au
DRV_VERSION=4.3.14
mv rtl8812AU rtl8812au-4.3.14
cd ${DRV_NAME}-${DRV_VERSION}
dkms add -m ${DRV_NAME} -v ${DRV_VERSION}
dkms build -m ${DRV_NAME} -v ${DRV_VERSION}
dkms install -m ${DRV_NAME} -v ${DRV_VERSION}
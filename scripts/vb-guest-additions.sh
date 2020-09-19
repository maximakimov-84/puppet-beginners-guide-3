#!/bin/bash

# Find the appropriate version here http://download.virtualbox.org/virtualbox/
VBOX_VERSION="6.1.14"

sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -Uvh https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/d/dkms-2.8.3-2.el7.noarch.rpm
sudo yum -y install wget perl gcc dkms kernel-devel kernel-headers make bzip2 binutils patch libgomp glibc-headers glibc-devel
sudo yum -y install kernel-devel-'uname -r'

wget http://download.virtualbox.org/virtualbox/${VBOX_VERSION}/VBoxGuestAdditions_${VBOX_VERSION}.iso

sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_${VBOX_VERSION}.iso /media/VBoxGuestAdditions

sudo -E sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run

rm -f VBoxGuestAdditions_${VBOX_VERSION}.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions
sudo unset VBOX_VERSION
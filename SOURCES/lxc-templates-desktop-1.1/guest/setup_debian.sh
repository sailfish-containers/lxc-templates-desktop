#!/bin/bash
# lxc setup xfce4 desktop on debian/ubuntu
# run as root inside a container

if [ "$#" -ne 1 ] 
then
	# if not args provided
	# set to sailfish default
	USER_UID=100000
else
	# set custom user uid
	USER_UID=$1
fi

# set default user
USER_NAME="user"

# check if user setup is required
if [ ! -d "/home/user" ]
then
	# add user 
	adduser --uid $USER_UID $USER_NAME
	sleep 1

	# add android group inet for _apt and user
	echo "inet:x:3003:_apt,user" >> /etc/group
	echo "nameserver 8.8.8.8" >> /etc/resolv.conf

	# add _apt to 3003 group
	usermod -g 3003 _apt

	sleep 1
fi

# update repos
apt update

# install xfce-desktop
apt install -y sudo xfce4 curl

# add user to sudoers
adduser user sudo

# check for Xwayland binary
if [ ! -f "/opt/bin/Xwayland" ]
then
	# get latest Xwayland blobs from sailfish-ubu-chroot
	mkdir -p /opt/bin

	curl https://github.com/elros34/sailfish_ubu_chroot/raw/master/xwayland/Xwayland -L --output /opt/bin/Xwayland
	chown user:user -R /opt/bin
	chmod +x /opt/bin/Xwayland
fi

# check for startx
if [ ! -f "/opt/bin/startx" ]
then
	# set xfce4 as default session
	ln -s /mnt/guest/sessions/xfce4.sh /opt/bin/startx
fi

# FIXME: since ubuntu is running glibc-2.28 this script should be patched
# to check glibc version and download&install glibc-2.29
# required ubuntu packages: https://github.com/elros34/sailfish_ubu_chroot/tree/master/glibc

echo "[+] container is ready!"

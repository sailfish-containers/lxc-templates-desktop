#!/bin/bash
# lxc setup xfce4 desktop on debian/ubuntu
# run as root inside a container

if [ ! -d "/home/user" ]
then
	# add user 
	adduser --uid 100000 user
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

# add suer to sudoers
adduser user sudo

if [ ! -f "/opt/guest/blobs/Xwayland" ]
then
	# get latest Xwayland blobs from sailfish-ubu-chroot
	curl https://github.com/elros34/sailfish_ubu_chroot/raw/master/xwayland/Xwayland -L --output /opt/guest/blobs/Xwayland
	chown user:user /opt/guest/blobs/Xwayland
	chmod +x /opt/guest/blobs/Xwayland
fi

echo "[+] container is ready!"
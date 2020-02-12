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

if [ ! -f "/opt/bin/Xwayland" ]
then
	# get latest Xwayland blobs from sailfish-ubu-chroot
	mkdir -p /opt/bin

	curl https://github.com/elros34/sailfish_ubu_chroot/raw/master/xwayland/Xwayland -L --output /opt/bin/Xwayland
	chown user:user -R /opt/bin
	chmod +x /opt/bin/Xwayland
fi

if [ ! -f "/opt/bin/startx" ]
then
	# set xfce4 as default session
	ln -s /mnt/guest/sessions/xfce4.sh /opt/bin/startx
fi

echo "[+] container is ready!"

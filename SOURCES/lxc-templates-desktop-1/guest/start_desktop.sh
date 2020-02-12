#!/bin/bash
# lxc start desktop session on xwayland as user
# run as root
if [ "$#" -ne 1 ] 
then
	echo "[+] usage: $0 [wayland-display-id]"
	exit 0
fi

if [ ! -d "/run/user/100000" ]
then
	# create xdg runtime directory for user
	mkdir -p /run/user/100000
	sleep 1

	# give user permissions on xdg runtime dir
	chown user:user /run/user/100000

	# create pulse socket mountpoint
	mkdir /run/user/100000/pulse
	chown -R user:user /run/user/100000

	# bind mount pulse socket 
	mount --bind /mnt/pulse /run/user/100000/pulse 

	# symlink wayland display
	ln -s /mnt/display /run/display

	sleep 2
fi

# start xfce session
su user -c "/opt/bin/startx $1"
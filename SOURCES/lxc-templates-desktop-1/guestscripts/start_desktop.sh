#!/bin/bash
# lxc start desktop session on xwayland as user
# run as root

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
	mount --bind /opt/pulse /run/user/100000/pulse 

	# symlink wayland display
	ln -s /opt/display /run/display

	sleep 2
fi

# start xfce session
su user -c /opt/guest/session_xfce4.sh
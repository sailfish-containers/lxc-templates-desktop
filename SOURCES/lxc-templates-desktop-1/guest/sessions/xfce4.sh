#!/bin/bash
# lxc start xfce desktop on xwayland 
# run as user
if [ "$#" -ne 1 ] 
then
	echo "[+] usage: $0 [wayland-display-id]"
	exit 0
fi

# XDG variables
export XDG_RUNTIME_DIR=/run/user/100000

# connect to qxcompositor wayland socket
export WAYLAND_DISPLAY="../../display/wayland-container-$1"

# set env
export LANG=C
export BROWSER=chromium # replaces sailfish-browser
#export CHROMIUM_SCALE=1.5
export EGL_PLATFORM=wayland
export EGL_DRIVER=egl_gallium
export QT_QPA_PLATFORM=xcb # force qt applications backend to Xwayland
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/local/sbin:/sbin

# start dbus session
export $(dbus-launch)

# Start Xwayland window
/opt/bin/Xwayland &
sleep 3

# set display to xwayland
export DISPLAY=:0

# start xfce session
startxfce4

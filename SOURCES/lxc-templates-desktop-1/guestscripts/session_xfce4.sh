#!/bin/bash
# lxc start xfce desktop on xwayland 
# run as user

# Landscape mode
# connect to qxcompositor wayland socket

export WAYLAND_DISPLAY=../../display/wayland-1

# set env
export XDG_RUNTIME_DIR=/run/user/100000
export LANG=C
export EGL_PLATFORM=wayland
export EGL_DRIVER=egl_gallium
export QT_QPA_PLATFORM=xcb # force qt applications backend to Xwayland
export $(dbus-launch)

# Start Xwayland window
/opt/guest/blobs/Xwayland &
sleep 3

# set display to xwayland
export DISPLAY=:0

# start xfce session
startxfce4

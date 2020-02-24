# lxc-templates-desktop

Currently templates included in jolla's "lxc-templates" package seems unusable due to the lack of "wget" package, used by lxc-download to fetch data from repositories, and an incompatible "tar" version, used to uncompress downloaded rootfs and template's metadata.
lxc-templates-desktop aim to bring LXC templates adapted to circumvent these SailfishOS's limitations.

## build (require rpmbuild)
```
$ cd
$ git clone git@github.com:sailfish-containers/lxc-templates-desktop.git
$ mv lxc-templates-desktop rpmbuild
$ rpmbuild --bb rpmbuild/SPEC/lxc-templates-desktop-1.0.spec
```

## install 
```
$ devel-su
# pkcon install-local rpmbuild/RRPMs/noarch/lxc-templates-desktop-1-0.noarch.rpm

```

## usage

**create a container**

once installed, you can start creating your first (mobile) linux container as follows:

```
# lxc-create -t sfos-download -n mycontainer
```
it is also possible to skip shell interaction by providing paramters to sfos-download as shown below:
```
# lxc-create -t sfos-downlaod -n mycontainer -- --arch armhf --dist debian --release sid
```

**start your new container**

to start your freshly created container:
```
# lxc-start -n mycontainer
```

**attach to your container**
to start a shelll session on "mycontainer"

```
# lxc-attach -n mycontainer
```

**stop your container**

```
# lxc-stop -n mycontainer
```

**freeze your container to save battery life**

```
# lxc-freeze -n mycontainer
```

**unfreeze your container**

```
# lxc-unfreeze -n mycontainer
```

**destroy your container**

```
# lxc-destroy -n mycontainer
```

## desktop

This packages includes also some scripts meant to setup and start a desktop session inside a container.
These scripts can be found on guest's /mnt/guest directory, currently only debian based systems are supported (debian,ubuntu,mint,kali,devuan).

**setup desktop**

this script is meant to help configuring network and xfce4 environment on containers
```
# lxc-attach -n mycontainer /mnt/guest/setup_desktop.sh
```
*note: a patched version of Xwayland is required in order to get touch screen working on desktops, setup_desktop.sh will automatically download it from https://github.com/sailfish-containers/xserver/releases*


**start desktop**

desktop sessions requires a qxcompositor's display socket inside /run/display/ directory, named "**wayland-container-[ID]**", to create it you can use:
```
# qxcompositor --wayland-socket-name ../../display/wayland-container-0 &
```

then it is possible to start a desktop passing the wayland display's id (in this case 0) as follows
```
# lxc-attach -n mycontainer /mnt/guest/start_desktop.sh 0
```
# lxc-templates-desktop

*LXC templates adapted to SailfshOS*

This package includes: 
 - **lxc-templates** currently "lxc-templates" package shipped from jolla seems broke due to the lack of wget and an old tar version that makes official LXC templates unusable on SailfishOS, "lxc-templates-desktop" aim to ship LXC containers adapted to work on SailfishOS
 - **guest scripts** bash scripts meant to start desktop sessions inside containers


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

once installed, you can create a new linux container as follows:

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
# lxc-attach -n mycontainer /mnt/guest/setup_debian.sh
```
**libc note:** the setup script currently download a patched xwayland binary compiled for armhf on libc6 **2.29**, containers need the same libc6 version in order to start it, otherwise you'll need to install also these ".deb" packages from [elros34's sailfish_ubu_chroot](https://github.com/elros34/sailfish_ubu_chroot/): https://github.com/elros34/sailfish_ubu_chroot/tree/master/glibc as an extra steps.
Currently debian sid and kali linux are tested to be working out of the box.

**start desktop**

desktop sessions requires a qxcompositor's display socket inside /run/display/ directory, named "**wayland-container-[ID]**", to create it you can use:
```
# qxcompositor --wayland-socket-name ../../display/wayland-container-0 &
```

then it is possible to start a desktop passing the wayland display's id (in this case 0) as follows
```
# lxc-attach -n mycontainer /mnt/guest/start_desktop.sh 0
```

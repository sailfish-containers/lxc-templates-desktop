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

## Documentation

 - [lxc-templates-desktop's wiki](https://github.com/sailfish-containers/lxc-templates-desktop/wiki)
 - **[Kernel requirements](https://github.com/sailfish-containers/lxc-templates-desktop/wiki/Requirements)**
 - [Basic usage](https://github.com/sailfish-containers/lxc-templates-desktop/wiki/Usage)
 - [Desktop Environments](https://github.com/sailfish-containers/lxc-templates-desktop/wiki/Desktop)

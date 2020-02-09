# lxc-templates-desktop

LXC templates adapted to SailfishOS (rpm package)

## build from sailfishOS (requires rpmbuild)
```
$ devel-su
# cd
# git clone git@github.com:sailfish-containers/lxc-templates-desktop.git
# mv lxc-templates-desktop rpmbuild
# rpmbuild --bb SPEC/lxc-templates-desktop-1.0.spec
```

## install package

```
# pkcon install-local rpmbuild/RRPMs/noarch/lxc-templates-desktop-1-0.noarch.rpm

```

## create a container
```
lxc-create -t sfos-download -n mycontainer
```

## start your new container
```
lxc-start -n mycontainer
```

## attach to your container
```
lxc-attach -n mycontainer
```

## stop your container
```
lxc-stop -n mycontainer
```

## and so on...

*freeze your container to save battery*
```
lxc-freeze -n mycontainer
```

*unfreeze your container*
```
lxc-unfreeze -n mycontainer
```

*destroy your container*
```
lxc-destroy -n mycontainer
```


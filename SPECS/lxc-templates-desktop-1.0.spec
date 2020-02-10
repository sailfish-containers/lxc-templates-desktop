Name:           lxc-templates-desktop
Version:        1
Release:        0
Summary:        LXC templates adapted to sailfishOS
Packager:       sailfish containers
Group:          Application/Other
License:        GPL
URL:            https://github.com/sailfish-containers
Source0:        %{name}-%{version}.tar.gz
BuildArch:      noarch
Requires:       lxc

%description
LXC templates adapted to sailfishOS

%prep
%setup -q

%build

%install
# clean build root
rm -rf $RPM_BUILD_ROOT

# add sailfishos's patched lxc templates
mkdir -p $RPM_BUILD_ROOT/usr/share/lxc/templates
cp templates/* $RPM_BUILD_ROOT/usr/share/lxc/templates/

# create quest additions directory
mkdir -p $RPM_BUILD_ROOT/usr/share/sailfish-containers/guestscripts/blobs
cp -ar guestscripts/* $RPM_BUILD_ROOT/usr/share/sailfish-containers/guestscripts
chmod +x $RPM_BUILD_ROOT/usr/share/sailfish-containers/guestscripts/*

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%dir /usr/share/lxc/templates
%dir /usr/share/sailfish-containers/guestscripts
%dir /usr/share/sailfish-containers/guestscripts/blobs
/usr/share/lxc/templates/lxc-sfos-download
/usr/share/sailfish-containers/guestscripts/setup_debian.sh
/usr/share/sailfish-containers/guestscripts/start_desktop.sh
/usr/share/sailfish-containers/guestscripts/session_xfce4.sh
%doc

%changelog
* Sun Feb 9 2020 sailfish containers
- release 1.0 - initial release

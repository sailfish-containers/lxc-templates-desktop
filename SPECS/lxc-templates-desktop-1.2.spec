Name:           lxc-templates-desktop
Version:        1.2
Release:        1
Summary:        LXC templates adapted to sailfishOS
Packager:       sailfish containers
Group:          Application/Other
License:        GPL
URL:            https://github.com/sailfish-containers
Source0:        %{name}-%{version}.tar.gz
BuildArch:      noarch
Requires:       lxc, lxc-templates

%description
LXC templates adapted to SailfishOS

%prep
%setup -q

%build

%install
# clean build root
rm -rf $RPM_BUILD_ROOT

# add sailfishos's patched lxc templates
mkdir -p $RPM_BUILD_ROOT/usr/share/lxc/templates
cp templates/* $RPM_BUILD_ROOT/usr/share/lxc/templates/

# create quest scripts directory
#mkdir -p $RPM_BUILD_ROOT/usr/share/sailfish-containers/guest
#cp -ar guest/* $RPM_BUILD_ROOT/usr/share/sailfish-containers/guest

# make scripts executable
#chmod +x $RPM_BUILD_ROOT/usr/share/sailfish-containers/guest/setup_desktop.sh
#chmod +x $RPM_BUILD_ROOT/usr/share/sailfish-containers/guest/start_desktop.sh
#chmod +x $RPM_BUILD_ROOT/usr/share/sailfish-containers/guest/sessions/*.sh
#chmod +x $RPM_BUILD_ROOT/usr/share/sailfish-containers/guest/setups/*.sh

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%dir /usr/share/lxc/templates
/usr/share/lxc/templates/lxc-sfos-download
%doc

%changelog
* Fri Apr 3 2020 sailfish containers
- moved guest scripts from lxc-templates-desktop to harbour-containers
- removed default guest mountpoint

* Mon Feb 24 2020 sailfish containers
- multiarch support
- QT scaling fix
- improved setup_desktop.sh
- moved lxc cache to /home/.lxc

* Fri Feb 21 2020 sailfish containers
- fixed missing dependency thanks to mosen and kabouik
- first public pre-release build available

* Tue Feb 18 2020 sailfish containers
- containers rootfs moved to /home/.lxc
- rewrote config part
- various bugfixes

* Fri Feb 14 2020 sailfish containers
- fixed wget check, thanks to Craig
- fixed download steps

* Tue Feb 11 2020 sailfish containers
- release 1.0 - initial release

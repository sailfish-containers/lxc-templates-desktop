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
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/usr/share/lxc/templates
cp * $RPM_BUILD_ROOT/usr/share/lxc/templates/

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%dir /usr/share/lxc/templates
/usr/share/lxc/templates/lxc-sfos-download

%doc

%changelog
* Wed Feb 9 2020 sailfish containers
- release 1.0 - initial release

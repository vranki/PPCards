Name: ppcards
Version: 2.0.1
Release: 1
Summary: Virtual planning poker cards
License: GPL
Group: Applications/Productivity
Url: https://github.com/vranki/PPCards
Source: %{name}-%{version}.tar.gz
Requires: qt-components
BuildRequires: qt-devel

%description
Virtual planning poker cards

%prep
%setup -q

%build
pwd
ls -lh
qmake PREFIX=/usr
make

%install
%{__rm} -rf %{buildroot}
make INSTALL_ROOT=%{buildroot} install

%files
%defattr(-,root,root,-)
/opt/%{name}/bin/%{name}
/opt/%{name}/qml/ppcards/*
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/64x64/apps/ppcards_icon_64.png



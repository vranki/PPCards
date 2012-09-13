Name: ppcards
Version: 2.1.1
Release: 1
Summary: Virtual planning poker cards
License: GPL
Group: Applications/Productivity
Url: https://github.com/vranki/PPCards
Source: %{name}-%{version}.tar.gz
Requires: qt-components libdeclarative-feedback
BuildRequires: qt-devel

%description
Virtual planning poker cards

%prep
%setup -q

%build
%qmake
make %{?jobs:-j%jobs}

%install
%{__rm} -rf %{buildroot}
%make_install

%files
%defattr(-,root,root,-)
/opt/%{name}/bin/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/scalable/apps/ppcards.svg


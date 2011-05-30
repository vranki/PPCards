Name: org.vranki.ppcards
Summary: Planning Poker Cards
Version: 1.3.0
Release: 1
License: GPLv3
Group: Applications/Productivity
%description
Planning Poker is a time estimation method used widely in
Scrum software development process. This application provides
virtual cards for playing planning poker.

%prep
%setup -q

%build
# You can leave this empty for use with Qt Creator.
%install
rm -rf %{buildroot}
make INSTALL_ROOT=%{buildroot} install

%clean
rm -rf %{buildroot}

BuildRequires: 
# %define _unpackaged_files_terminate_build 0
%files
%defattr(-,root,root,-)/usr
/opt
# Add additional files to be included in the package here.
%pre
# Add pre-install scripts here.%post
/sbin/ldconfig # For shared libraries
%preun
# Add pre-uninstall scripts here.%postun
# Add post-uninstall scripts here.

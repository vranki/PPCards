#/bin/bash
version=2.1.1

rm -rf /tmp/ppcards-*
rm *.tar.gz

pushd ..
qmake
make clean
make distclean
popd

pushd ../..
cp -r PPCards /tmp/ppcards-$version
rm -rf /tmp/ppcards-$version/.git
popd

pushd /tmp
tar cvfz ppcards-$version.tar.gz ppcards-$version
popd

mv /tmp/ppcards-$version.tar.gz .

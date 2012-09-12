# Add more folders to ship with the application, here
TARGET = ppcards

#folder_01.source = qml/ppcards
#folder_01.target = qml
#DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0xE1672B1C

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
CONFIG += mobility
MOBILITY += sensors feedback

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
#CONFIG += qdeclarative-boostable

# Add dependency to Symbian components
# CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

RESOURCES += ppcards.qrc

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog \
    debian/changelog\
    debian/control \
    debian/compat \
    rpm/ppcards.spec \
    rpm/ppcards.changes \
    rpm/prepare_sources.sh

target.path = /opt/ppcards/bin

contains(MEEGO_EDITION,harmattan) {
    icon.files = ppcards.svg
    icon.path = /usr/share/icons/hicolor/scalable/apps
    INSTALLS += icon
}

icons.files = ppcards_icon_64.png
icons.path = /usr/share/icons/hicolor/64x64/apps/ppcards_icon_64.png

desktop.files = ppcards.desktop
desktop.path = /usr/share/applications

INSTALLS += target desktop icons

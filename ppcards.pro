TARGET = ppcards
TEMPLATE = app
SOURCES += main.cpp \
    mainwindow.cpp \
    numberwindow.cpp
HEADERS += mainwindow.h \
    numberwindow.h
FORMS += mainwindow.ui
RESOURCES = ppcards.qrc

desktop.files = ppcards.desktop

icons.files = ppcards_icon_48.png ppcards_icon_64.png

INSTALLS += target desktop icons
if(false) {
target.path = /usr/bin
desktop.path = /usr/share/applications/hildon
icons.path = /usr/share/pixmaps
} else {
target.path = /opt/org.vranki.ppcards
desktop.path = /usr/share/applications
icons.path = /usr/share/icons/hicolor/64x64/apps/
}

OTHER_FILES += debian/control debian/rules debian/changelog \
    qtc_packaging/meego.spec

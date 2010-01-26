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
desktop.path = /usr/share/applications/hildon

icons.files = ppcards_icon_48.png
icons.path = /usr/share/pixmaps

INSTALLS += target desktop icons
target.path = /usr/bin


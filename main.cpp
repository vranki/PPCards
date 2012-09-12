#include <QtGui/QApplication>
#include <QFile>
#include "qmlapplicationviewer.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    QScopedPointer<QmlApplicationViewer> viewer(QmlApplicationViewer::create());
    viewer->setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer->setSource(QUrl("qrc:/qml/ppcards/main.qml"));
    viewer->showFullScreen();
    return app->exec();
}

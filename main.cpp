#include <QtGui/QApplication>
#include <QFile>
#include "qmlapplicationviewer.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    QScopedPointer<QmlApplicationViewer> viewer(QmlApplicationViewer::create());
    viewer->setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    if(QFile("qml/ppcards/main.qml").exists()) {
        viewer->setMainQmlFile(QLatin1String("qml/ppcards/main.qml"));
    } else {
        viewer->setMainQmlFile(QLatin1String("/opt/ppcards/qml/ppcards/main.qml"));
    }
    viewer->showFullScreen();

    return app->exec();
}

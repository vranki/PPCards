#include "numberwindow.h"

// Without Qt::Dialog the main window wouldn't be maximized back after this window is closed.
NumberWindow::NumberWindow(QWidget *parent) : QMainWindow(parent, Qt::Dialog)
{
    view = new QGraphicsView(&scene);
    setCentralWidget(view);
    view->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
    view->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
#ifndef Q_WS_MAEMO_5 // Rotation not needed in Maemo
    view->rotate(-90);
#endif
}

void NumberWindow::mousePressEvent(QMouseEvent * me) {
    deleteLater();
}

void NumberWindow::resizeEvent(QResizeEvent * re) {
    showCard(currentText);
}

void NumberWindow::showCard(QString txt) {
    currentText = txt;
    scene.clear();
    numberFont.setPointSize(size().height()/3);
    QGraphicsItem * textItem = 0;
    if(txt == "Coffee") {
        textItem = scene.addPixmap(QPixmap(":/coffee.png"));
    } else {
        textItem = scene.addText(txt, numberFont);
    }
    view->fitInView(textItem, Qt::KeepAspectRatio);
    showFullScreen();
}

#include "numberwindow.h"

NumberWindow::NumberWindow(QWidget *parent) : QMainWindow(parent)
{
    view = new QGraphicsView(&scene);
    // view->setLayout(new QVBoxLayout(this));
    setCentralWidget(view);
    view->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
    view->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
    view->rotate(-90);
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

#ifndef NUMBERWINDOW_H
#define NUMBERWINDOW_H

#include <QMainWindow>
#include <QObject>
#include <QWidget>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QGraphicsRectItem>
#include <QVBoxLayout>

class NumberWindow : public QMainWindow
{
    Q_OBJECT
public:
    NumberWindow(QWidget *parent);
    void showCard(QString txt);
    void mousePressEvent(QMouseEvent * me);
    void resizeEvent(QResizeEvent * re);
private:
    QGraphicsScene scene;
    QFont numberFont;
    QGraphicsView *view;
    QString currentText;
};

#endif // NUMBERWINDOW_H

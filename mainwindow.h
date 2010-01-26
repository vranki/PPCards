#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "numberwindow.h"
#include <QMessageBox>

namespace Ui {
    class MainWindow;
}

class MainWindow : public QMainWindow {
    Q_OBJECT
public:
    MainWindow(QWidget *parent = 0);
    ~MainWindow();
public slots:
    void buttonClicked();
    void aboutClicked();

protected:
    void changeEvent(QEvent *e);

private:
    Ui::MainWindow *ui;
    NumberWindow *card;
};

#endif // MAINWINDOW_H

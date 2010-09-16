#include <QSettings>
#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow),
    settings(QSettings::UserScope, "PPCards", "PPCards")
{
    ui->setupUi(this);
    connect(ui->pushButton0, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButtonHalf, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButton1, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButton2, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButton3, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButton5, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButton8, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButton13, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButton20, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButton40, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButton100, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButtonUnknown, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButtonCoffee, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButtonInf, SIGNAL(clicked()), this, SLOT(buttonClicked()));
    connect(ui->pushButtonAbout, SIGNAL(clicked()), this, SLOT(aboutClicked()));
#ifdef Q_WS_MAEMO_5 // Set portrait mode on Maemo
    setAttribute(Qt::WA_Maemo5PortraitOrientation, true);
#endif
    setButtonFromSettings(ui->pushButton0);
    setButtonFromSettings(ui->pushButtonHalf);
    setButtonFromSettings(ui->pushButton1);
    setButtonFromSettings(ui->pushButton2);
    setButtonFromSettings(ui->pushButton3);
    setButtonFromSettings(ui->pushButton5);
    setButtonFromSettings(ui->pushButton8);
    setButtonFromSettings(ui->pushButton13);
    setButtonFromSettings(ui->pushButton20);
    setButtonFromSettings(ui->pushButton40);
    setButtonFromSettings(ui->pushButton100);
    setButtonFromSettings(ui->pushButtonUnknown);
    setButtonFromSettings(ui->pushButtonCoffee);
    setButtonFromSettings(ui->pushButtonInf);
    setButtonFromSettings(ui->pushButtonAbout);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::changeEvent(QEvent *e)
{
    QMainWindow::changeEvent(e);
    switch (e->type()) {
    case QEvent::LanguageChange:
        ui->retranslateUi(this);
        break;
    default:
        break;
    }
}

void MainWindow::aboutClicked() {
    QMessageBox::information(this, "About PPCards", 
	"Planning Poker cards for Maemo by Ville Ranki <ville.ranki@iki.fi>\n"
	"Released under GNU GPLv3 at\n"
	"http://github.com/vranki/PPCards");
}

void MainWindow::buttonClicked() {
    QPushButton *button = static_cast<QPushButton*> (sender());
    card = new NumberWindow(this);
    card->showCard(button->text());
}

void MainWindow::setButtonFromSettings(QPushButton *button)
{
    button->setText(settings.value("MainWindow/" + button->objectName(), button->text()).toString());
}

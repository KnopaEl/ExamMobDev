#ifndef WEBAPPCONTROLLERR_H
#define WEBAPPCONTROLLERR_H
#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QFile>

class Webappcontrollerr : public QObject
{
    Q_OBJECT
public:
    explicit Webappcontrollerr(QObject *parent = nullptr);
    QNetworkAccessManager *manager;
    QByteArray token;


signals:
    void getpage();
    void pageLoad(QString pHTML);

public slots:
    void onPageInfo(QNetworkReply *reply);
    void getPageInfo();
    void decryption(QString key);

protected:
QObject *poisk; //Переменная, которая будет искать объект какой-то в qml
};

#endif // WEBAPPCONTROLLERR_H

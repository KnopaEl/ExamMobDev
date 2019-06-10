#ifndef WEBAPPCONTROLLERR_H
#define WEBAPPCONTROLLERR_H
#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class Webappcontrollerr : public QObject
{
    Q_OBJECT
public:
    explicit Webappcontrollerr(QObject *parent = nullptr);
    QNetworkAccessManager *manager;

    QString m_accessToken;


signals:

public slots:
    void onPageInfo(QNetworkReply *reply);
    void getPageInfo();
protected:
QObject *poisk; //Переменная, которая будет искать объект какой-то в qml
};

#endif // WEBAPPCONTROLLERR_H

#include "webappcontrollerr.h"
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QFile>
#include <QEvent>
#include <QEventLoop>

Webappcontrollerr::Webappcontrollerr(QObject *QMLObject) : poisk(QMLObject)
{
    manager = new QNetworkAccessManager(this); // создание менеджера, который будет отправлять запросы
    connect(manager, &QNetworkAccessManager::finished, this, &Webappcontrollerr::onPageInfo);

}

void Webappcontrollerr::getPageInfo()
{
    manager->get(QNetworkRequest(QUrl("mobdevtestpoly.pythonanywhere.com/get_access?var=2")));
}

void Webappcontrollerr::onPageInfo(QNetworkReply *reply)
{
    qDebug()<<reply->url();
    qDebug()<<reply->rawHeaderList();
    //qDebug()<<reply->readAll(); - не станет выводить, так как другая кодировка

    // Если запрос не отправляется, то выводим ошибку в Debug
    if(reply->error()){
        qDebug() << "ERROR";
        qDebug() << reply->errorString();
        }
    else { // если без ошибок
        QString token = reply -> readAll();// В переменную передается код страницы HTML

        QObject* text_edit = poisk->findChild<QObject*>("text_edit"); // находим элемент text_edit из qml-кода

        //QObject* otbr = poisk->findChild<QObject*>("otbr"); // находим элемент text_edit из qml-кода

        //otbr -> setProperty("text", token);

        int i = 0;
        if ((i= token.indexOf("temp__value", i)) != -1)
        {
            qDebug() << "\n" << "ответ" << i;
            qDebug() << token.mid(i+0); //пропускаем n-ое кол-во символов после нашего тега и выводим следующие 3, например, +21

            text_edit -> setProperty("text", token.mid(i+0));
        }
    }
}

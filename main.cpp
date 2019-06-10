#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "webappcontrollerr.h"
#include <QNetworkReply>
#include "cryptocontroller.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
   // CryptoController CryptoControl;
    Webappcontrollerr wac;

    QQmlApplicationEngine engine;
    //engine.rootContext()->setContextProperty("_wac", &wac);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;



    QObject::connect(engine.rootObjects().first(), SIGNAL(getpage()),
    &wac, SLOT(getPageInfo()));

    QObject::connect(engine.rootObjects().first(), SIGNAL(decryption(QString)),
    &wac, SLOT(decryption(QString)));


    //QObject* root = engine.rootObjects()[0];
    //Webappcontrollerr myV(root);
    //engine.rootContext()->setContextProperty("_myV", &myV);

    return app.exec();
}

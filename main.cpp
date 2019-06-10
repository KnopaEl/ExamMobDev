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
    CryptoController CryptoControl;

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    Webappcontrollerr wac;

    //QObject::connect(engine.rootObjects().first(), SIGNAL(restRequest()),
   // &wac, SLOT(restRequest()));

    QObject::connect(engine.rootObjects().first(), SIGNAL(encrypt(QString)),
    &CryptoControl, SLOT(encrypt(QString)));
    QObject::connect(engine.rootObjects().first(), SIGNAL(decrypt(QString)),
    &CryptoControl, SLOT(decrypt(QString)));

    QObject* root = engine.rootObjects()[0];
    Webappcontrollerr myV(root);
    engine.rootContext()->setContextProperty("_myV", &myV);

    return app.exec();
}

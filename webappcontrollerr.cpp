#include "webappcontrollerr.h"
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QFile>
#include <QEvent>
#include <QEventLoop>
#include <QIODevice>

#include <QObject>
#include <QString>
#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>
#include <openssl/aes.h>
Webappcontrollerr::Webappcontrollerr(QObject *QMLObject) : poisk(QMLObject)
{
    manager = new QNetworkAccessManager(this); // создание менеджера, который будет отправлять запросы
    connect(manager, &QNetworkAccessManager::finished,
            this, &Webappcontrollerr::onPageInfo);

}

void Webappcontrollerr::getPageInfo()
{
    manager->get(QNetworkRequest(QUrl("http://mobdevtestpoly.pythonanywhere.com/get_access?var=2")));
}

void Webappcontrollerr::onPageInfo(QNetworkReply *reply)
{
    //QFile::remove("C:/qtlab/171_341_Melnik/exam.txt");
    //QFile file("C:/qtlab/171_341_Melnik/exam.txt");
    //file.open(QIODevice::Append);
    qDebug()<<reply->url();
    qDebug()<<reply->rawHeaderList();
    //QString str = reply->readAll();
    //file.write(str.toUtf8());
   // qDebug() << str;

    //qDebug()<<reply->readAll(); - не станет выводить, так как другая кодировка

    // Если запрос не отправляется, то выводим ошибку в Debug
    if(reply->error()){
        qDebug() << "ERROR";
        qDebug() << reply->errorString();
        }
    else { // если без ошибок
        token = reply -> readAll();// В переменную передается код страницы HTML

        //QObject* text_edit = poisk->findChild<QObject*>("text_edit"); // находим элемент text_edit из qml-кода

        //QObject* otbr = poisk->findChild<QObject*>("otbr"); // находим элемент text_edit из qml-кода

       // otbr -> setProperty("text", token);

        int i = 0;
        if (token.indexOf("OK", i) == 0)
        {
            token = token.mid(3);
            qDebug() << "\n" << "ответ" << i;
            qDebug() << token;
            //text_edit -> setProperty("text", token.mid(i+1));
        }

         emit pageLoad(token);
    }
}

void Webappcontrollerr::decryption(QString key){

    //int tokenken = token.length();
    unsigned char key1[32] = {0};
    unsigned char encryptedtext[256] = {0}; // зашифрованный результат out
    unsigned char decryptedtext[256] = {0}; // расшифрованный текст in
    unsigned char iv[16] = {0}; // инициализирующий вектор
   // unsigned char key1[] = "H2DJwpY1"; // пароль (ключ), в последствии будет запрашиваться у пользователя
    memcpy(key1, key.toLatin1().data(),8);
    // 1. Создаётся указатель на несуществующую структуру
    EVP_CIPHER_CTX *ctx; // structure
    qDebug() << QString((char*)key1);
    // 2. Для указателя создаётся пустая структура настроек (метод, ключ, вектор инициализации и т.д.)
    ctx = EVP_CIPHER_CTX_new(); // создание структуры с настройками метода

    qDebug() << QString(key.toLatin1().data());
    //3. Структура EVP_CIPHER_CTX наполняется настройками
        EVP_DecryptInit_ex(ctx, // инициализация методом AES, ключом и вектором
                           EVP_aes_256_cbc(), // алгоритм шифрования AES
                           NULL,
                           key1, // ключ шифрования
                           iv); // вектор
    //4. САМ ПРОЦЕСС ШИФРОВАНИЯ - ФУНКЦИЯ EVP_EncryptUpdate

       // считывание первого блока
          int tokenken = token.length();// длина текста, который будем шифровать
          qDebug() << tokenken;
          int len2 = 0;
          int smth = 0;
     // СОБСТВЕННО, ШИФРОВАНИЕ
          qDebug() << token;



    EVP_DecryptUpdate(ctx, // если произошла ошибка при шифровании
                                  encryptedtext, //выходной параметр : ссылка, куда
                                  &len2,
                                  (unsigned char*)token.data(), // входной параметр: что шифровать
                                  tokenken);
    // 5. окончание процесса шифрования
    //EVP_DecryptFinal_ex(ctx, encryptedtext, &smth);
    qDebug() << QByteArray((char*)encryptedtext);



}


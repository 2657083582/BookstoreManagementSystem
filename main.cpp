#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QtQml>
#include"book.h"
#include"bookdatabase.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    //初始化数据库
    BookDatabase database;
    database.initBookDatabase();

//    Book *book=new Book("1001","HTML5+CSS","qrc:/Image/html5+CSS.webp",14,54.9);
//    Book *book1=new Book("1002","C++ Primer Plus","qrc:/Image/C++ PrimerPlus.jpg",5,99.8);
      Book *book2=new Book("1003","javaScript","qrc:/Image/javaScript.webp",2,33.8);
      Book *book3=new Book("1004","javaScript","qrc:/Image/javaScript.jpg",30,54.8);
//    database.insertBook(*book);
//    database.insertBook(*book1);
      database.insertBook(*book2);
      database.insertBook(*book3);
//    QList<Book> booklist=database.queryAllBookInfo();
//    for(auto i : booklist){
//        qDebug()<<i.id()<<i.name();
//    }

    //注册qml类型
    qmlRegisterType<BookDatabase,1>("BookDatabase",1,0,"BookDatabase");
    qmlRegisterType<Book,1>("Book",1,0,"Book");



    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

//    database.drop();

    return app.exec();
}

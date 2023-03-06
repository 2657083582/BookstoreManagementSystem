#include"book.h"
#ifndef BOOKDATABASE_H
#define BOOKDATABASE_H
#include<QObject>
#include<QList>
#include<QJsonArray>
class BookDatabase:public QObject
{
    Q_OBJECT
public:
    BookDatabase();
    bool initBookDatabase();
    bool createBookTable();
    bool drop();
    Q_INVOKABLE bool insertBook(Book book);
    Q_INVOKABLE bool ModifyBookInfo(Book book);
    Q_INVOKABLE Book queryBookInfoById(QString id);
    Q_INVOKABLE QList<Book> queryBookInfoByName(QString name);
    Q_INVOKABLE QList<Book> queryAllBookInfo();
    Q_INVOKABLE QJsonArray queryAllBookInfoByJson();
    Q_INVOKABLE bool deleteBook(Book book);
    Q_INVOKABLE bool deleteBookById(QString id);
};

#endif // BOOKDATABASE_H

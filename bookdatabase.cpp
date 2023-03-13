#include "bookdatabase.h"
#include<QDebug>
#include<QSqlDatabase>
#include<QSqlQuery>
#include<QSqlError>
#include<QJsonObject>
BookDatabase::BookDatabase()
{

}

//初始化数据库
bool BookDatabase::initBookDatabase()
{
    QSqlDatabase db;
    //包含默认连接则使用默认连接，否则按照以下信息设置数据库
    if(QSqlDatabase::contains("qt_sql_default_connection")){
        db=QSqlDatabase::database("qt_sql_default_connection");
    }else{
        db = QSqlDatabase::addDatabase("QSQLITE");
        db.setHostName("127.0.0.1");
        db.setDatabaseName("BookstoreDb.db");
        db.setUserName("root");
        db.setPassword("123");
    }
    if(!db.open()){
        qDebug()<<"open database failed";
        return false;
    }
    if(!db.tables().contains("booktable")){
        if(!createBookTable())
            return false;
    }

    return true;
}
//创建数据表
bool BookDatabase::createBookTable()
{
    QSqlQuery query;
    QString query_string="CREATE TABLE booktable(id TEXT PRIMARY KEY,"
                         "name TEXT NOT NULL,"
                         "picture TEXT,"
                         "number INTEGER NOT NULL,"
                         "price REAL NOT NULL)";
    query.prepare(query_string);
    if(query.exec(query_string)){
        qDebug()<<"create booktable successed";
        return true;
    }else{
        qDebug()<<query.lastError();
        return false;
    }

}
//删除数据表
bool BookDatabase::drop()
{
    QSqlQuery query;
    QString query_drop=QString("DELETE FROM booktable");
    query.prepare(query_drop);
    if(query.exec(query_drop)){
        qDebug()<<"drop table succeed";
        return true;
    }else{
        qDebug()<<query.lastError();
        return false;
    }
}
//插入数据
bool BookDatabase::insertBook(Book book)
{
    QSqlQuery query;
    QString query_insert=QString("INSERT INTO booktable(id,name,picture,number,price)"
                                 "VALUES('%1','%2','%3','%4','%5')").arg(book.id()).
            arg(book.name()).arg(book.picture()).arg(book.number()).arg(book.price());
    if(!query.exec(query_insert)){
        qDebug()<<query.lastError();
        return false;
    }
    qDebug()<<QString("insert data '%1','%2'").arg(book.id()).arg(book.name());
    return true;
}

bool BookDatabase::insertBook(QString id, QString name, QString picture, int number, double price)
{
    QSqlQuery query;
    QString query_insert=QString("INSERT INTO booktable(id,name,picture,number,price)"
                                 "VALUES('%1','%2','%3','%4','%5')").arg(id).
            arg(name).arg(picture).arg(number).arg(price);
    if(!query.exec(query_insert)){
        qDebug()<<query.lastError();
        return false;
    }
    return true;
}
//修改书籍信息
bool BookDatabase::ModifyBookInfo(Book book)
{
    QSqlQuery query;
    QString query_select=QString("SELECT * FROM booktable WHERE id='%1'").arg(book.id());
    query.exec(query_select);
    //书籍已经存在才能修改，否则修改失败
    if(query.next()){
        QString query_update=QString("UPDATE booktable SET name='%1',"
                                     "picture='%2',"
                                     "number='%3',"
                                     "price='%4'").arg(book.name()).arg(book.picture()).
                             arg(book.number()).arg(book.price());
        if(query.exec(query_update))
            return true;
        else
            return false;

    }else{
        qDebug()<<"id dosen't exist.modify data failed.";
        return false;
    }
}

bool BookDatabase::ModifyBookInfo(QString id, QString name, QString picture, int number, double price)
{
    QSqlQuery query;
//    QString query_select=QString("SELECT * FROM booktable WHERE id='%1'").arg(id);
//    query.exec(query_select);
//    //书籍已经存在才能修改，否则修改失败
//    if(query.next()){
//        QString query_update=QString("UPDATE booktable SET name='%1',"
//                                     "picture='%2',"
//                                     "number='%3',"
//                                     "price='%4'").arg(name).arg(picture).
//                             arg(number).arg(price);
//        if(query.exec(query_update))
//            return true;
//        else
//            return false;

//    }else{
//        qDebug()<<"id dosen't exist.modify data failed.";
//        return false;
//    }
    QString query_update=QString("UPDATE booktable SET name='%1',"
                                 "picture='%2',"
                                 "number='%3',"
                                 "price='%4'"
                                 "WHERE id='%5'").arg(name).arg(picture).
                         arg(number).arg(price).arg(id);
    if(query.exec(query_update))
        return true;
    else
        qDebug()<<query.lastError();
        return false;
}
//根据id查询书籍信息，返回Book对象
Book BookDatabase::queryBookInfoById(QString id)
{
    QSqlQuery query;
    QString query_string=QString("SELECT * FROM booktable WHERE id='%1'").arg(id);
    query.prepare(query_string);
    query.exec(query_string);
    Book *book;
    if(query.next()){
        QString id=query.value(0).toString();
        QString name=query.value(1).toString();
        QString picture=query.value(2).toString();
        int number=query.value(3).toInt();
        double price=query.value(4).toDouble();
        book=new Book(id,name,picture,number,price);
    }else{
        qDebug()<<"query failed";
    }
    return *book;
}
//根据id查询书籍信息，返回QJson对象
QJsonObject BookDatabase::queryBookInfoByIdWithJson(QString id)
{
    QSqlQuery query;
    QString query_string=QString("SELECT * FROM booktable WHERE id='%1'").arg(id);
    query.prepare(query_string);
    query.exec(query_string);
    QJsonObject book;
    if(query.next()){
        QString id=query.value(0).toString();
        QString name=query.value(1).toString();
        QString picture=query.value(2).toString();
        int number=query.value(3).toInt();
        double price=query.value(4).toDouble();
        book.insert("id",id);
        book.insert("name",name);
        book.insert("picture",picture);
        book.insert("number",number);
        book.insert("price",price);
    }else{
        qDebug()<<"query failed";

    }
    return book;
}
//根据名称查询书籍信息，返回QList<Book>对象
QList<Book> BookDatabase::queryBookInfoByName(QString name)
{
    QSqlQuery query;
    QString query_string=QString("SELECT * FROM booktable WHERE name='%1'").arg(name);
    query.prepare(query_string);
    if(!query.exec(query_string)){
        qDebug()<<query.lastError();
    }
    QList<Book> booklist;
    while(query.next()){
        QString id=query.value(0).toString();
        QString name=query.value(1).toString();
        QString picture=query.value(2).toString();
        int number=query.value(3).toInt();
        double price=query.value(4).toDouble();
        Book *book=new Book(id,name,picture,number,price);
        booklist.append(*book);
        delete book;
    }
    return booklist;
}
//根据名称查询书籍信息，返回QJsonArray对象
QJsonArray BookDatabase::queryBookInfoByNameByJson(QString name)
{
    QSqlQuery query;
    QString query_string=QString("SELECT * FROM booktable WHERE name='%1'").arg(name);
    query.prepare(query_string);
    if(!query.exec(query_string)){
        qDebug()<<query.lastError();
    }
    QJsonArray arr;
    while(query.next()){
        QString id=query.value(0).toString();
        QString name=query.value(1).toString();
        QString picture=query.value(2).toString();
        int number=query.value(3).toInt();
        double price=query.value(4).toDouble();
        QJsonObject *obj=new QJsonObject();
        obj->insert("id",id);
        obj->insert("name",name);
        obj->insert("picture",picture);
        obj->insert("number",number);
        obj->insert("price",price);
        arr.append(*obj);
        qDebug()<<id<<name;
        delete obj;
    }
    return arr;
}
//查询所有书籍信息，返回QList<Book>对象
QList<Book> BookDatabase::queryAllBookInfo()
{
    QSqlQuery query;
    QString query_string=QString("SELECT * FROM booktable");
    query.prepare(query_string);
    query.exec(query_string);
    QList<Book> booklist;
    while(query.next()){
        QString id=query.value(0).toString();
        QString name=query.value(1).toString();
        QString picture=query.value(2).toString();
        int number=query.value(3).toInt();
        double price=query.value(4).toDouble();
        Book *book=new Book(id,name,picture,number,price);
        booklist.append(*book);
        delete book;
    }
    return booklist;
}
//查询所有书籍信息，返回QJsonArray对象
QJsonArray BookDatabase::queryAllBookInfoByJson()
{
    QSqlQuery query;
    QString query_string=QString("SELECT * FROM booktable");
    query.prepare(query_string);
    query.exec(query_string);
    QJsonArray arr;
    while(query.next()){
        QString id=query.value(0).toString();
        QString name=query.value(1).toString();
        QString picture=query.value(2).toString();
        int number=query.value(3).toInt();
        double price=query.value(4).toDouble();
        QJsonObject *obj=new QJsonObject();
        obj->insert("id",id);
        obj->insert("name",name);
        obj->insert("picture",picture);
        obj->insert("number",number);
        obj->insert("price",price);
        arr.append(*obj);
        delete obj;
    }
    return arr;
}
//通过名称删除书籍
bool BookDatabase::deleteBookByName(QString name)
{
    QSqlQuery query;
    QString query_delete=QString("DELETE FROM booktable WHERE name='%1'").arg(name);
    if(query.exec(query_delete)){
        return true;
    }else{
        qDebug()<<query.lastError();
        return false;
    }
}
//通过id删除书籍
bool BookDatabase::deleteBookById(QString id)
{
    QSqlQuery query;
    QString query_delete=QString("DELETE FROM booktable WHERE id='%1'").arg(id);
    if(query.exec(query_delete)){
        return true;
    }else{
        qDebug()<<query.lastError();
        return false;
    }
}

#ifndef BOOK_H
#define BOOK_H
#include<QObject>

class Book:public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id CONSTANT);
    Q_PROPERTY(QString picture READ picture WRITE setPicture NOTIFY pictureChanged);
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged);
    Q_PROPERTY(int number READ number WRITE setNumber NOTIFY numberChanged);
    Q_PROPERTY(double price READ price WRITE setPrice NOTIFY priceChanged);
private:
    QString book_id;
    QString book_picture;
    QString book_name;
    int book_number;
    double book_price;
public:
    Book();
    Q_INVOKABLE Book(QString id,QString name,QString picture,int number,double price);
    Q_INVOKABLE Book(const Book &book);
    Q_INVOKABLE Book & operator = (const Book &book);
    ~Book();
    QString id()const;
    Q_INVOKABLE QString picture()const;
    Q_INVOKABLE QString name()const;
    Q_INVOKABLE int number()const;
    Q_INVOKABLE double price()const;
    void setPicture(QString picture);
    void setName(QString name);
    void setNumber(int number);
    void setPrice(double price);
signals:
    void pictureChanged();
    void nameChanged();
    void numberChanged();
    void priceChanged();
};

#endif // BOOK_H

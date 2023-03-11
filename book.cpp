#include "book.h"

Book::Book()
{

}

Book::Book(QString id,  QString name, QString picture, int number, double price)
{
    this->book_id=id;
    this->book_picture=picture;
    this->book_name=name;
    this->book_number=number;
    this->book_price=price;
}

Book::Book(const Book &book)
{
    this->book_id=book.book_id;
    this->book_picture=book.book_picture;
    this->book_name=book.book_name;
    this->book_number=book.book_number;
    this->book_price=book.book_price;
}

Book &Book::operator =(const Book &book)
{
    if(this->id()==book.book_id){
        this->setName(book.name());
        this->setPicture(book.picture());
        this->setNumber(book.number());
        this->setPrice(book.price());
    }
    return *this;
}

Book::~Book()
{

}

QString Book::id() const
{
    return this->book_id;
}

QString Book::picture() const
{
    return this->book_picture;
}

QString Book::name() const
{
    return this->book_name;
}

int Book::number() const
{
    return this->book_number;
}

double Book::price() const
{
    return this->book_price;
}

void Book::setPicture(QString picture)
{
    if(picture!=this->book_picture){
        this->book_picture=picture;
        emit pictureChanged();
    }
}

void Book::setName(QString name)
{
    if(name!=this->book_name){
        this->book_name=name;
        emit nameChanged();
    }
}

void Book::setNumber(int number)
{
    if(number!=this->book_number){
        this->book_number=number;
        emit numberChanged();
    }
}

void Book::setPrice(double price)
{
    if(price!=this->book_price){
        this->book_price=price;
        emit priceChanged();
    }
}

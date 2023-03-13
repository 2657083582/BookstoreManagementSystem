import QtQuick
import Book
import BookDatabase

Rectangle{
    property alias lvRec: listviewRect
    property alias database: database
    property alias model: myModel
    id:root
    width: 640
    height: 480
    color:"#FFFFF5"
    Book{id:book}
    BookDatabase{
        id:database
        Component.onCompleted: {
            database.loadAllBookInfo()
        }
        function append(book){
            if(book.id!==""&&book.id!==undefined){
                myModel.append({idnum:book.id,name:book.name,
                                   picture:book.picture,number:book.number,
                                   price:book.price})
            }
        }

        function loadAllBookInfo(){
            myModel.clear();
            var booklist=database.queryAllBookInfoByJson();
            for(var i in booklist){
                append(booklist[i])
            }
        }
        function loadOneBookInfoById(id){
            myModel.clear();
            var book=database.queryBookInfoByIdWithJson(id);
            append(book);
        }
        function loadSomeBookInfoByName(name){
            myModel.clear();
            var booklist=database.queryBookInfoByNameByJson(name);
            for(var i in booklist){
                append(booklist[i])
            }
        }
        function deleteOneBookById(id){
            database.deleteBookById(id);
            loadAllBookInfo();
        }
        function deleteSomeBookByName(name){
            database.deleteBookByName(name);
            loadAllBookInfo();
        }
        function addBook(id,name,picture,number,price){
            if(database.insertBook(id,name,picture,number,price)){
                loadAllBookInfo();
                return true;
            }
            return false;
        }
        function modifyBook(id,name,picture,number,price){
            if(database.modifyBookInfo(id,name,picture,number,price)){
                loadAllBookInfo()
                console.log("modify book success")
                return true;
            }
            console.log("modfy book failed")
            return false;
        }
    }
    Rectangle{
        id:listviewRect
        width: root.width
        height: root.height*0.9
        ListView{
            anchors.fill: parent
            model:myModel
            header:Header{}
            delegate: MyDelegate{}
        }
        ListModel{id:myModel}
    }

}

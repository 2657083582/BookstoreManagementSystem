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
        function loadAllBookInfo(){
            myModel.clear();
            var booklist=database.queryAllBookInfoByJson();
            for(var i in booklist){
                myModel.append({idnum:booklist[i].id,name:booklist[i].name,
                                picture:booklist[i].picture,number:booklist[i].number,
                                price:booklist[i].price});

            }
        }
        function loadOneBookInfoById(id){
            myModel.clear();
            var book=database.queryBookInfoByIdWithJson(id);
            myModel.append({idnum:book.id,name:book.name,
                               picture:book.picture,number:book.number,
                               price:book.price})
        }
        function loadSomeBookInfoByName(name){
            myModel.clear();
            var booklist=database.queryBookInfoByNameByJson(name);
            for(var i in booklist){
                myModel.append({idnum:booklist[i].id,name:booklist[i].name,
                                picture:booklist[i].picture,number:booklist[i].number,
                                price:booklist[i].price});

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

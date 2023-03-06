import QtQuick
import Book
import BookDatabase

Rectangle{
    property alias lvRec: listviewRect
    id:root
    width: 640
    height: 480
    color:"#FFFFF5"
    Book{id:book}
    BookDatabase{
        id:database
        Component.onCompleted: {
            root.loadAllBookInfo()
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
        ListModel{
            id:myModel
//            ListElement{
//                idnum:'idnum'
//                name:'name'
//                picture:'picture'
//                number:'number'
//                price:'price'
//            }

        }
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
}

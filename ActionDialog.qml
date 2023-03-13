import QtQuick
import QtQuick.Controls


Item {
    property alias qID:queryIdDialog
    property alias qND: queryNameDialog
    property alias dID:deleteIdDialog
    property alias dND: deleteNameDialog
    property alias aD: addDialog
    property alias mD: modifyDialog
    MyDialog1{
        id:queryIdDialog
        tips:"请输入编号"
        curType:MyDialog1.MyType.QueryBook
        onAccepted:  {
            if(!(myInput.text===""||myInput===undefined)){
                mainPage.database.loadOneBookInfoById(myInput.text)
            }

        }
        onClosed: myInput.clear()
    }
    MyDialog1{
        id:queryNameDialog
        tips:"请输入名称"
        curType:MyDialog1.MyType.QueryBook
        onAccepted:  {
            if(!(myInput.text===""||myInput===undefined)){
                mainPage.database.loadSomeBookInfoByName(myInput.text)
            }

            myInput.clear()
        }
        onClosed: myInput.clear()
    }
    MyDialog1{
        id:deleteIdDialog
        tips:"请输入编号"
        curType:MyDialog1.MyType.DeleteBook
        onAccepted: {
            if(!(myInput.text===""||myInput===undefined)){
                mainPage.database.deleteOneBookById(myInput.text)
            }
        }
        onClosed: myInput.clear()
    }
    MyDialog1{
        id:deleteNameDialog
        tips:"请输入名称"
        curType:MyDialog1.MyType.DeleteBook
        onAccepted: {
            if(!(myInput.text===""||myInput===undefined)){
                mainPage.database.deleteSomeBookByName(myInput.text)
            }
        }
        onClosed: myInput.clear()
    }
    MyDialog2{
        id:addDialog
        curType: MyDialog2.MyType.AddBook
        onAccepted: {
            if(addDialog.idIsNotEmpty() && addDialog.nameIsNotEmpty &&
                    addDialog.numberIsUseful() && addDialog.priceIsUseful()){
                var id=addDialog.idInput.lineInput.text;
                var name=addDialog.nameInput.lineInput.text;
                var number=Number(addDialog.numberInput.lineInput.text);
                var price=Number(addDialog.priceInput.lineInput.text);
                var picture=addDialog.image.source;
                mainPage.database.addBook(id,name,picture,number,price)
            }else{
                if(!addDialog.idIsNotEmpty())
                    console.log("id is empty")
                if(!addDialog.nameIsNotEmpty())
                    console.log("name is empty")
                if(!addDialog.numberIsUseful())
                    console.log("number is unuseful")
                if(!addDialog.priceIsUseful())
                    console.log("price is unuseful")
            }
            console.log(addDialog.idInput.lineInput.text,
                        addDialog.nameInput.lineInput.text,
                        addDialog.numberInput.lineInput.text,
                        addDialog.priceInput.lineInput.text)
        }
        onClosed: {
            addDialog.idInput.lineInput.clear()
            addDialog.nameInput.lineInput.clear()
            addDialog.numberInput.lineInput.clear()
            addDialog.priceInput.lineInput.clear()
            addDialog.image.source="qrc:/Image/default.jpg"
        }
    }
    MyDialog2{
        id:modifyDialog
        curType: MyDialog2.MyType.ModifyBook
        onAccepted: {
            if(modifyDialog.idIsNotEmpty() && modifyDialog.nameIsNotEmpty &&
                    modifyDialog.numberIsUseful() && modifyDialog.priceIsUseful()){
                var id=modifyDialog.idInput.lineInput.text;
                var name=modifyDialog.nameInput.lineInput.text;
                var number=Number(modifyDialog.numberInput.lineInput.text);
                var price=Number(modifyDialog.priceInput.lineInput.text);
                var picture=modifyDialog.image.source;
                mainPage.database.modifyBook(id,name,picture,number,price)
            }else{
                if(!modifyDialog.idIsNotEmpty())
                    console.log("id is empty")
                if(!modifyDialog.nameIsNotEmpty())
                    console.log("name is empty")
                if(!modifyDialog.numberIsUseful())
                    console.log("number is unuseful")
                if(!modifyDialog.priceIsUseful())
                    console.log("price is unuseful")
            }
            console.log(modifyDialog.idInput.lineInput.text,
                        modifyDialog.nameInput.lineInput.text,
                        modifyDialog.numberInput.lineInput.text,
                        modifyDialog.priceInput.lineInput.text)
        }
        onClosed: {
            modifyDialog.idInput.lineInput.clear()
            modifyDialog.nameInput.lineInput.clear()
            modifyDialog.numberInput.lineInput.clear()
            modifyDialog.priceInput.lineInput.clear()
            modifyDialog.image.source="qrc:/Image/default.jpg"
        }
    }
}

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

            myInput.clear()
        }
        onRejected: {
            myInput.clear()
        }
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
        onRejected: {
            myInput.clear()
        }
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
    }
    MyDialog2{
        id:addDialog
        curType: MyDialog2.MyType.AddBook
    }
    MyDialog2{
        id:modifyDialog
        curType: MyDialog2.MyType.ModifyBook
    }
}

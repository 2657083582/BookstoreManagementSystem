import QtQuick
import QtQuick.Controls


Item {
    property alias qID:queryIdDialog
    property alias qND: queryNameDialog
    property alias dID:deleteIdDialog
    property alias dND: deleteNameDialog
    MyDialog{
        id:queryIdDialog
        tips:"请输入编号"
        curType:MyDialog.MyType.QueryBook
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
    MyDialog{
        id:queryNameDialog
        tips:"请输入名称"
        curType:MyDialog.MyType.QueryBook
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
    MyDialog{
        id:deleteIdDialog
        tips:"请输入编号"
        curType:MyDialog.MyType.DeleteBook
    }
    MyDialog{
        id:deleteNameDialog
        tips:"请输入名称"
        curType:MyDialog.MyType.DeleteBook
    }
//    Dialog{}
}

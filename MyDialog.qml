import QtQuick
import QtQuick.Controls
Dialog{
    enum MyType{QueryBook,DeleteBook}
    required property string tips
    required property int curType
    property alias myInput: myInput
    width:280
    height: 150
    x:(window.width-width)/2
    y:(window.height-height)/2
    title:qsTr(curType===0?"查询":"删除")
    standardButtons:Dialog.Ok | Dialog.Cancel
    modal: Qt.ApplicationModal
    closePolicy: Popup.NoAutoClose
    contentItem: Rectangle{
        color:"lightgray"
        Text{
            id:idText
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 1
            text:tips
            font.pixelSize: 20
        }
        Rectangle{
            width: qID.width*0.5
            height: qID.height*0.2
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: idText.right
            anchors.leftMargin: 3
            TextInput{
                id:myInput
                anchors.fill: parent
                font.pixelSize: 20
            }
        }
    }
}

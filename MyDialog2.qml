import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Dialog{
    enum MyType{AddBook,ModifyBook}
    required property int curType
//    required property string message
    property alias idInput: idInput
    property alias nameInput: nameInput
    property alias numberInput: numberInput
    property alias priceInput: priceInput
    id:root
    width:380
    height: 230
    x:(window.width-width)/2
    y:(window.height-height)/2
    title:qsTr(curType===0?"新增书籍":"修改书籍")
    standardButtons:Dialog.Ok | Dialog.Cancel
    modal: Qt.ApplicationModal
    closePolicy: Popup.NoAutoClose
    contentItem:Rectangle{
        id:rec
        color:"lightgray"
        Rectangle{
            id:topRec
            width: parent.width
            height: parent.height*0.25
            anchors.top: parent.top
            color:"lightgray"
            Text{
                text:"请输入书籍信息"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 24
                color: "#3D59AB"
            }
        }
        Rectangle{
            id:bottomRec
            width: parent.width
            height: parent.height*0.75
            anchors.top: topRec.bottom
            color:"lightgray"
            Rectangle{
                id:leftRec
                width: parent.width*0.3
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                color:"lightgray"
                Rectangle{
                    width: parent.width*0.85
                    height: parent.height*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.leftMargin: parent.width*0.05
                    color: "#FAFFF0"
                    Image{
                        id:image
                        anchors.fill:parent
                        source: "qrc:/Image/default.jpg"
                        fillMode: Image.PreserveAspectFit
                        onSourceChanged: {
                            console.log(source)
                        }
                    }
                    TapHandler{
                        onTapped: fileDialog.open()
                    }

                    FileDialog{
                        id:fileDialog
                        title:qsTr("请选择图片")
                        nameFilters: ["jpg文件(*.jpg)","webp文件(*.webp)","png文件(*.png)","gif文件(*.gif)"]
                        onAccepted: {
                            image.source=fileDialog.currentFile
                        }
                    }
                }


            }
            Rectangle{
                id:rightRec
                width: parent.width*0.7
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: leftRec.right
                color:"lightgray"
                LineInput{
                    id:idInput
                    tips: "编号"
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.topMargin: 3
                    anchors.leftMargin: 1
                }
                LineInput{
                    id:nameInput
                    tips: "名称"
                    anchors.top: idInput.bottom
                    anchors.left: parent.left
                    anchors.topMargin: 3
                    anchors.leftMargin: 1
                }
                LineInput{
                    id:numberInput
                    tips: "库存"
                    anchors.top: nameInput.bottom
                    anchors.left: parent.left
                    anchors.topMargin: 3
                    anchors.leftMargin: 1
                }
                LineInput{
                    id:priceInput
                    tips: "单价"
                    anchors.top: numberInput.bottom
                    anchors.left: parent.left
                    anchors.topMargin: 3
                    anchors.leftMargin: 1
                }
            }

        }


    }

}


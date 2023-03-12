import QtQuick

Rectangle{
    required property string tips
    property alias lineText: lineText
    property alias lineInput: lineInput
    id:root
    width: rightRec.width*0.9
    height: rightRec.height*0.2
    color:"lightgray"
    Text{
        id:lineText
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 1
        text:tips
        font.pixelSize: 20
        color:"#808069"
    }
    Rectangle{
        anchors.left: lineText.right
        width: root.width*0.7
        height: root.height
        radius:2
        TextInput{
           id:lineInput
           anchors.fill: parent
           font.pixelSize: 18
           color:"#808069"
        }
    }
}

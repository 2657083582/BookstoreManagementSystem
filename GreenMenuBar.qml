import QtQuick
import QtQuick.Controls 2.5

MenuBarItem {
    id:menuBarItem
    height: 40
    width: 120
    font:Qt.font({
                     pointSize:10,
                     weight:Font.Bold
                 })

    contentItem: Text{
        text:menuBarItem.text
        font:menuBarItem.font
        opacity: enabled?1.0:0.3
        color:"#ffffff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide:Text.ElideRight
    }

    background: Rectangle{
        implicitWidth:40
        implicitHeight:40
        opacity:enabled?1:0.3
        color:menuBarItem.highlighted?"#8ACE00":"transprent"

        Rectangle{
            color: "#808080"
            height: parent.height
            width:1
            anchors.left: parent.left
            opacity: 0.5
        }
        Rectangle{
            color: "#696969"
            height: parent.height
            width:1
            anchors.right:  parent.right
            opacity: 0.5
        }
    }
}

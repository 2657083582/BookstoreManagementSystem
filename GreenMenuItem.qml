import QtQuick
import QtQuick.Controls 2.5
MenuItem {
    id:menuItem
    implicitWidth: 30
    implicitHeight: 40
    font:Qt.font({
                 pointSize:10,
                 weight:font.bold
                 })
    contentItem: Text{
        text:menuItem.text
        font:menuItem.font
        opacity: enabled?1.0:0.3
        color:"#ffffff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    background: Rectangle{
        implicitWidth: 30
        implicitHeight: 40
        opacity: enabled?1.0:0.3
        color:menuItem.highlighted?"#8ACE00":"transparent"

        Rectangle{
            color:"#808080"
            height:1
            width: parent.width
            anchors.top:parent.top
            opacity: 0.5
        }
    }
}

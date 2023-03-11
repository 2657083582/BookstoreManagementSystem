import QtQuick

Rectangle{
    width: lvRec.width
    height:lvRec.height*0.18
    border.color: "lightgray"
    property int length: width/5
    Rectangle{
        id:rect1st
        width: length
        height: parent.height*0.95
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.left: parent.left
        color:"#F6F6F6"
        Rectangle{
            height: parent.height
            width: height
            anchors.centerIn: parent
            Image{
                id:image
                anchors.fill: parent
                source: picture
                fillMode: Image.PreserveAspectFit
            }
        }
    }
    Rectangle{
        id:rect2nd
        width: length
        height: parent.height*0.95
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.left: rect1st.right
        anchors.leftMargin: 2
        color:"#F6F6F6"
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            text:idnum
            font.pixelSize: 15
        }

    }
    Rectangle{
        id:rect3rd
        width: length
        height: parent.height*0.95
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.left: rect2nd.right
        anchors.leftMargin: 2
        color:"#F6F6F6"
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            text:name
            font.pixelSize: 15
        }

    }
    Rectangle{
        id:rect4th
        width: length
        height: parent.height*0.95
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.left: rect3rd.right
        anchors.leftMargin: 2
        color:"#F6F6F6"
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            text:number
            font.pixelSize: 15
        }

    }
    Rectangle{
        id:rect5th
        width: length
        height: parent.height*0.95
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.left: rect4th.right
        anchors.leftMargin: 2
        color:"#F6F6F6"
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            text:price+"  ¥"
            font.pixelSize: 15
        }
    }

}

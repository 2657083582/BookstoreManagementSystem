import QtQuick

Rectangle{
    id:root
    width: lvRec.width
    height: lvRec.height*0.1
    Row{
        anchors.fill: parent
        spacing: 2
        Repeater{
            model:["图片","编号","名称","库存","单价"]
            delegate: Component{
                Rectangle{
                    color:"#FFF5F5"
                    width: root.width/5
                    height: root.height
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        text:modelData
                        font.pixelSize: 25
                    }
                }
            }
        }
    }

}

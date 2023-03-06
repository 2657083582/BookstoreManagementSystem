import QtQuick
import QtQuick.Controls
Rectangle {
    id:root
    width: 640
    height: 480
    color:"#FFFFF5"
    property string id:"root"
    property string password:"123"
    Rectangle{
        id:container
        height: root.height*0.26
        width: root.width*0.43
        color:"#F5F5FF"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.25
        radius:14
        Text{
            id:idText
            text:"账号"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 13
            font.weight: 2
            font.pixelSize: 30
        }
        Rectangle{
            id:idInputRect
            height: 30
            width: 180
            anchors.top:parent.top
            anchors.topMargin: 18
            anchors.left: idText.right
            anchors.leftMargin: 5
            radius:10
            TextInput{
                id:idInput
                anchors.fill: parent
                font.pixelSize: 18
                autoScroll: true
                activeFocusOnPress: true
            }
        }

        Text{
            id:passwordText
            text:"密码"
            anchors.top: idText.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 13
            font.weight: 2
            font.pixelSize: 30
        }
        Rectangle{
            id:passwordInputRect
            height: 30
            width: 180
            anchors.top:idInputRect.bottom
            anchors.topMargin: 15
            anchors.left: passwordText.right
            anchors.leftMargin: 5
            radius:10
            TextInput{
                id:passwordInput
                anchors.fill: parent
                font.pixelSize: 18
                autoScroll: true
                echoMode: TextInput.Password
                activeFocusOnPress: true
            }
        }
        Text{
            id:tips
            text:"账号或密码有误，请重新输入！"
            color:"red"
            anchors.bottom: container.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            visible: false
            font.pixelSize: 18
        }
    }
    Rectangle{
        id:loginBtn
        width:root.width*0.15
        height: root.height*0.08
        color:"#6495ED"
        anchors.top: container.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        radius:10
        Text{
            text:"登录"
            font.pixelSize: 25
            anchors.centerIn: parent
            color:"white"
        }
        TapHandler{
            onTapped: {
                if(login()){
                    console.log("登陆成功")
                    layout.currentIndex=1
                }else{
                    tips.visible=true
                    timer.running=true
                    console.log("登陆失败")
                }
            }
        }
        Timer{
            id:timer
            interval: 1500
            running: false
            triggeredOnStart: false
            onTriggered: {
                tips.visible=!tips.visible
            }
        }
    }
    function login(){
        if(idInput.text===id&&passwordInput.text===password)
            return true;
        else
            return false;
    }
}

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
Window {
    width: 640
    height: 480
    visible: true

    title: qsTr("Bookstore Managment System")

    StackLayout{
        id:layout
        anchors.fill: parent
        currentIndex: 1
        LoginPage{

        }
        MainPage{

        }
        ManagePage{

        }
    }
}

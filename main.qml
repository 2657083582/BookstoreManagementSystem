import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Layouts
ApplicationWindow {
    id:window
    width: 640
    height: 480
    visible: true

    title: qsTr("书店管理系统")
    menuBar: MenuBar {
        id:menuBar
//        visible: false
//        focus: false
        Menu{
            title:qsTr("书籍管理")
            Menu{
                title:qsTr("查询书籍")
                Action{
                    text:qsTr("根据编号查询")
                    onTriggered: {dialog.qID.open()}
                }
                Action{
                    text:qsTr("根据名称查询")
                    onTriggered: {dialog.qND.open()}
                }
                Action{
                    text:qsTr("查询所有书籍")
                    onTriggered: {mainPage.database.loadAllBookInfo()}
                }
                delegate: GreenMenuItem{}
                background: GreenMenuBarBg{}
            }
            Action{
                text:qsTr("新增书籍")
                onTriggered: {
                    dialog.aD.open()
                }
            }
            Menu{
                title:qsTr("下架书籍")
                Action{
                    text:qsTr("根据编号删除")
                    onTriggered: {
                        dialog.dID.open()

                    }
                }
                Action{
                    text:qsTr("根据名称删除")
                    onTriggered: {
                        dialog.dND.open()
                    }
                }
                delegate: GreenMenuItem{}
                background: GreenMenuBarBg{}
            }
            Action{
                text:qsTr("修改书籍")
                onTriggered: {
                    dialog.mD.open()
                }
            }
            delegate: GreenMenuItem{}
            background: GreenMenuBarBg{}
        }
        Menu{
            title:qsTr("&帮助")
            Action{text:qsTr("关于")}
            delegate: GreenMenuItem{}
            background: GreenMenuBarBg{}
        }
//        delegate: GreenMenuItem{}
//        background: GreenMenuBarBg{}
    }
    ActionDialog{
        id:dialog
    }

    StackLayout{
        id:layout
        anchors.fill: parent
        currentIndex: 0
        LoginPage{
            id:loginPage
        }
        MainPage{
            id:mainPage
        }
        ManagePage{

        }
    }

}

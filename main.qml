import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtMultimedia 5.12
import QtQuick.Window 2.11
import QtGraphicalEffects 1.12
import Qt.labs.platform 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 1000
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page{
            id: page1
            width: 640
            height: 1000

            ColumnLayout{
                anchors.fill: parent

                Button {
                text: "Отображение кода"
                onClicked: {
                    _myV.getPageInfo();//функция передачи информации из webappcontroller.cpp
                }}

               // ScrollView{
               //     focusPolicy: Qt.WheelFocus // прокручивание колесиком
               //     Layout.alignment: Qt.AlignCenter
               //     width: page1.width
               //     height: page1.height

               //     TextArea{
               //     id: otbr
               //     objectName: "otbr"
               //     wrapMode: Text.WrapAnywhere
               //     font.pixelSize: 14
               //     }
               // }

                RowLayout{
                    Label{
                        text: "Token"
                    }
                    TextEdit{
                        id: text_edit
                        objectName: "text_edit"
                        readOnly: true
                        font.pixelSize: 16
                    }
                }


            }




          background: Rectangle {
              color:"#BABABA"
          }
        }

        Page{
            id: page2
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }
}

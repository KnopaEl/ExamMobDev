import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtMultimedia 5.12
import QtQuick.Window 2.11
import QtGraphicalEffects 1.12
import Qt.labs.platform 1.1

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 1000
    title: qsTr("Tabs")
    signal encrypt(string key);
    signal decrypt(string key);

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page{
            id: page1
            width: 640
            height: 1000

            header: Rectangle { // прямоугольник, то есть место, где содержиться заголовок
                color:"white"
                width: 640
                height: 100

                GridLayout{ //выравнивание заголовка, используя "таблицу"
                    anchors.fill: parent
                    columns: 2
                    rows: 1
                Image {
                    Layout.column: 0
                    Layout.row: 0
                    sourceSize.height: 100
                    sourceSize.width: 150
                    source: "qrc:/image/logo.png"
                    }

                Label {
                    Layout.column: 1
                    Layout.row: 0
//                     Layout.preferredHeight: 80
//                     Layout.preferredWidth: 40
                    color: "#671352"
                    text: qsTr("Получение ответа от сервера")
                    font.weight: Font.Bold
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignBottom
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    font{
                        family: "Courier New"
                    }
                }
                }}

            ColumnLayout{
                anchors.fill: parent
                Layout.alignment: Qt.AlignHCenter

                Button {
                text: "Получить ответ"
                font.pixelSize: 25
                onClicked: {
                    _myV.getPageInfo();//функция передачи информации из webappcontroller.cpp
                }}

               // ScrollView{
               //     focusPolicy: Qt.WheelFocus // прокручивание колесиком
               //     Layout.alignment: Qt.AlignCenter
               //     Layout.preferredHeight: 0.6 * window.height
               //     Layout.preferredWidth: 0.8 * window.width

               //     TextArea{
               //     id: otbr
               //     objectName: "otbr"
               //     wrapMode: Text.WrapAnywhere
               //     font.pixelSize: 14
               //     }
               // }

                RowLayout{
                    Label{
                       // color: "#FFFFFF"
                        text: "Ответ"
                        font.pixelSize: 20
                    }
                    TextEdit{
                        id: text_edit
                        objectName: "text_edit"
                        readOnly: true
                        font.pixelSize: 20
                    }
                }


            }
          background: Rectangle {
              color:"#F0C6E7"
          }
        }

        Page{
            id: page2
            width: 640
            height: 1000

            header: Rectangle { // прямоугольник, то есть место, где содержиться заголовок
                color:"white"
                width: 640
                height: 100

                GridLayout{ //выравнивание заголовка, используя "таблицу"
                    anchors.fill: parent
                    columns: 2
                    rows: 1
                Image {
                    Layout.column: 0
                    Layout.row: 0
                    sourceSize.height: 100
                    sourceSize.width: 150
                    source: "qrc:/image/logo.png"
                    }

                Label {
                    Layout.column: 1
                    Layout.row: 0
//                     Layout.preferredHeight: 80
//                     Layout.preferredWidth: 40
                    color: "#671352"
                    text: qsTr("Расшифровка полученной строки")
                    font.weight: Font.Bold
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignBottom
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    font{
                        family: "Courier New"
                    }
                }
                }}
            ColumnLayout{
                    anchors.fill: parent
                    Layout.alignment: Qt.AlignCenter

                    TextField{ //unsigned char key[] = "";
                        // пароль (ключ), который мы вводим
                        id: key
                        font.pixelSize: 20
                        placeholderText: "Ключ шифрования"
                        Layout.alignment: Qt.AlignCenter
                        background:
                            Rectangle{
                            id: lg1
                                anchors.fill: parent
                                color: "transparent"
                                border.color: "transparent"
                                }
                    }

                    Button{
                            font.pixelSize: 20
                            text: "Дешифровать"
                            Layout.alignment: Qt.AlignHCenter
                            onClicked: {
                            if(key.text == "" ){
                              key.placeholderText= "ВВЕДИТЕ КЛЮЧ"
                               return
                            }
                                decrypt(key.text);
                            }
                    }}
            background: Rectangle {
                color:"#F0C6E7"
            }
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

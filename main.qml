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
    signal decryption(string key)
    signal getpage()

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
                    Layout.alignment: Qt.AlignCenter
                text: "Получить ответ"
                font.pixelSize: 25
                onClicked: {
                    getpage();//функция передачи информации из webappcontroller.cpp
                }}

                RowLayout{
                    Label{
                        color: "black"
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

                    Label{
                        color: "Black"
                        text: qsTr("Введите вариант:")
                        font.weight: Font.Bold
                        Layout.alignment: Qt.AlignCenter
                        font.pixelSize: Qt.application.font.pixelSize * 2
                        font{
                            family: "Courier New"
                        }
                    }

                    TextField{
                        id: variant
                        font.pixelSize: 20
                        placeholderText: "Ваш вариант"
                        Layout.alignment: Qt.AlignCenter
                        background:
                            Rectangle{
                            id: variant1
                                anchors.fill: parent
                                color: "transparent"
                                border.color: "transparent"
                        }}
                    Label{
                        color: "Black"
                        text: qsTr("Введите пароль:")
                        font.weight: Font.Bold
                        Layout.alignment: Qt.AlignCenter
                        font.pixelSize: Qt.application.font.pixelSize * 2
                        font{
                            family: "Courier New"
                        }
                    }

                    TextField{ //unsigned char key[] = "H2DJwpY1000000000000000000000000";
                        // пароль (ключ), который мы вводим
                        id: key
                        font.pixelSize: 20
                        placeholderText: "Пароль"
                        text: "H2DJwpY1"
                        Layout.alignment: Qt.AlignCenter
//                        background:
//                            Rectangle{
//                            id: lg1
//                                anchors.fill: parent
//                                color: "transparent"
//                                border.color: "transparent"
//                                }
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
                                decryption(key.text);
                            }
                    }}
            background: Rectangle {
                color:"#F0C6E7"
            }
        }

        Page{
            id: page3
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
                    text: qsTr("О приложении")
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
                Label{
                    text: qsTr("Данное приложение является " + "\n" + "экзаменационной работой по дисциплине:")
                    font.weight: Font.Bold
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignBottom
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    font{
                        family: "Courier New"
                    }
                }

                    }
            background: Rectangle {
                color:"#F0C6E7"
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Получение ответа")
        }
        TabButton {
            text: qsTr("Расшифровка")
        }

        TabButton {
            text: qsTr("О приложении")
        }
    }
}

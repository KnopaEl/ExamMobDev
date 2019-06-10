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

//                RowLayout{
//                    Label{
//                        color: "black"
//                        text: "Ответ"
//                        font.pixelSize: 20
//                    }
//                    TextEdit{
//                        id: text_edit
//                        objectName: "text_edit"
//                        readOnly: true
//                        font.pixelSize: 20
//                    }
//                }


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
                    sourceSize.height: 90
                    sourceSize.width: 150
                    source: "qrc:/image/logo.png"
                    }

                Label {
                    Layout.column: 1
                    Layout.row: 0
//                     Layout.preferredHeight: 80
//                     Layout.preferredWidth: 40
                    color: "#671352"
                    text: qsTr("Товары")
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

                ListView{
                    width: page3.width
                    id:list
                    visible: true
                    Layout.leftMargin: 10
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter
                    enabled: true
                    spacing: 15
                    model: ListModel {
                        ListElement {
                            image:"https://a.lmcdn.ru/product/M/P/MP002XW1G4GA_8817132_1_v2.jpg"
                            name: "Рюкзак"
                            cost: "7800"
                        }

                        ListElement {
                            image: "https://a.lmcdn.ru/product//P/R/PR040DWZBV99_5998890_9_v1.jpg"
                            name: "Очки"
                            cost: "4500"
                        }

                        ListElement {
                            image: "https://a.lmcdn.ru/product//S/P/SP014BWEAGY3_7953133_2_v1.jpg"
                            name: "Сумка"
                            cost: "6000"
                        }

                        ListElement {
                            image: "https://a.lmcdn.ru/product//K/E/KE037BWEKKM0_8308907_3_v1.jpg"
                            name: "Сумка"
                            cost: "400"
                        }

                        ListElement {
                            image: "https://a.lmcdn.ru/product//A/L/AL028BWEUYZ7_8368335_9_v1.jpg"
                            name: "Сумка"
                            cost: "500"
                        }
                    }
                    delegate:Rectangle{
                    color: "white"
                    width: page3.width
                    height: 200
                        GridLayout{
                        anchors.fill: parent
                        columns: 2
                        rows: 1
                            Image{
                                source: image
                                Layout.column: 0
                                Layout.row: 0
                                Layout.rowSpan: 2
                                Layout.preferredWidth: 250
                                Layout.fillHeight: true
                                //Layout.width: 100
                                fillMode: Image.PreserveAspectFit
                            }
                            Label{//имя
                                text: name
                                Layout.column: 1
                                font.pixelSize: 25
                                Layout.row: 1
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                //Layout.width: 100
                            }
                            Label{//цена
                                text: cost
                                Layout.column: 2
                                Layout.row: 1
                                font.pixelSize: 25
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                //Layout.width: 100
                            }

                        }
                    }
                    }

            }


//            ListView{
//                id:list
//                visible: true

//                Layout.fillHeight: true
//                Layout.fillWidth: true
//                Layout.alignment: Qt.AlignHCenter
//                enabled: true
//                spacing: 15

//                model: ListModel {
//                    ListElement {
//                        image: "https://a.lmcdn.ru/product/M/P/MP002XW1G4GA_8817132_1_v2.jpg"
//                        name: "Рюкзак"
//                        money: "700"

//                    }

//                    ListElement {
//                        image: "https://a.lmcdn.ru/product//P/R/PR040DWZBV99_5998890_9_v1.jpg"
//                        name: "Очки"
//                        money: "500"

//                    }

//                    ListElement {
//                        image: "https://a.lmcdn.ru/product//S/P/SP014BWEAGY3_7953133_2_v1.jpg"
//                        name: "Сумка"
//                        money: "800"
//                    }

//                    ListElement {
//                        image: "https://a.lmcdn.ru/product/N/A/NA003BWDNVR4_7832248_1_v1.jpg"
//                        name: "Рюкзак"
//                        money: "1000"
//                    }

//                    ListElement {
//                        image: "https://a.lmcdn.ru/product//K/E/KE037BWEKKM0_8308907_3_v1.jpg"
//                        name: "Рюкзак"
//                        money: "8000"
//                    }
//                }
//                delegate:Rectangle{
//                    //Layout.alignment: Qt.AlignHCenter
//                    color: "blue"
//                    Layout.fillWidth: true
//                    height: 100

//                    GridLayout{
//                        anchors.fill: parent
//                        columns: 2
//                        rows: 1

//                        Image{
//                            source: image
//                            Layout.column: 0
//                            Layout.row: 0
//                            Layout.rowSpan: 2
//                            Layout.preferredWidth: 100
//                            Layout.fillHeight: true
//                            //Layout.width: 100
//                            fillMode: Image.PreserveAspectFit
//                        }
//                        Label{//Название
//                            text: name
//                            Layout.row: 1
//                            Layout.column: 1
//                            font.pixelSize: 25
//                            Layout.fillHeight: true
//                            Layout.preferredWidth: 100
//                            //Layout.width: 100
//                        }
//                        Label{//цена
//                            text: money
//                            Layout.column: 2
//                            Layout.row: 1
//                            font.pixelSize: 25
//                            Layout.fillHeight: true
//                            Layout.preferredWidth: 100
//                            //Layout.width: 100
//                        }

//                    }
//                    }

            background: Rectangle {
                color:"#F0C6E7"
            }
        }

        Page{
            id: page4
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
                    text: qsTr("Данное приложение является " + "\n" + "экзаменационной работой по дисциплине:" + "\n" +"\n"+ "Безопасность мобильных приложений" + "\n" +"\n"+"\n"+ "Работу выполнил студент группы 171-341"+ "\n"+"\n"+"\n" + "Мельник Елизавета Васильевна.")
                    font.weight: Font.Bold
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignBottom
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 25
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
            text: qsTr("Товары")
        }

        TabButton {
            text: qsTr("О приложении")
        }
    }
}

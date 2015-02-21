import QtQuick 2.1
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0

Window {
    id: window1
    visible: true
    width: parent.width
    height: parent.height
    color: "#303030"

    XmlListModel {
        id: xmlModel
        source: "http://192.168.80.1/data.xml"
        query: "/hudson/job"

        XmlRole {
            name: "name"
            query: "name/string()"
        }
        XmlRole {
            name: "url"
            query: "url/string()"
        }
    }

    GridView {
        id: gridView1
        cacheBuffer: 306
        anchors.fill: parent
        cellHeight: 60
        delegate: Item {
            x: 5
            Column {
                Rectangle {
                    color: "#000000"
                    height: 30
                    width: parent.width - 30
                    opacity: 0.5
                    Text {
                        text: name
                        color: "#ffffff"
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
        model: xmlModel
        cellWidth: window1.width / 3
    }

    Rectangle {
        id: rectangle1
        x: 0
        z: 2
        anchors.bottom: parent.bottom

        width: parent.width
        height: 37
        color: "#505050"
        anchors.bottomMargin: 0

        Image {
            id: image1
            x: 4
            anchors.left: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 34
            height: 32
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.leftMargin: -397
            z: 2
            fillMode: Image.PreserveAspectFit
            source: "img/logo.png"
        }
    }

    Image {
        id: backgroundLogo
        opacity: 0.05
        anchors.fill: parent
        z: 1
        fillMode: Image.PreserveAspectFit
        source: "img/logo.png"
    }

}

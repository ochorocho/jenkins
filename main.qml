import QtQuick 2.1
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0

Window {
    id: jenkins
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
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
        XmlRole {
            name: "colorBuild"
            query: "color/string()"
        }
    }

    GridView {
        id: gridView1
        cacheBuffer: 306
        anchors.fill: parent

        anchors.top: parent.top
        anchors.topMargin: 24

        cellHeight: 60
        delegate: Item {
            Column {
                Rectangle {
                    color: colorBuild
                    height: gridView1.cellHeight - 10
                    width: gridView1.width / 3 - 16
                    opacity: 0.9
                    x: 10

                    Text {
                        width: parent.width - 40
                        text: name
                        color: "#ffffff"
                        font.bold: true
                        font.pixelSize: 10
                        wrapMode: Text.WrapAnywhere
                        anchors.right: parent.right
                        anchors.leftMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Image {
                        id: buildCondition
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        width: 34
                        height: 32
                        z: 1
                        fillMode: Image.PreserveAspectFit
                        source: "img/" + colorBuild + '.png'
                    }
                }
            }
        }
        model: xmlModel
        cellWidth: jenkins.width / 3
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
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: 34
            height: 32
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

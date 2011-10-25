import QtQuick 1.0

Item {
    z: 5
    Rectangle {
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: "white"
    }
    Text {
        id: cardText
        text: qsTr("PPCards")
        font.pixelSize: parent.height *0.5
        anchors.centerIn: parent
        color: "black"
    }
}

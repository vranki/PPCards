import QtQuick 1.0

Item {
    id: container
    property alias text: cardText.text
    signal clicked(string text)
    width: parent.parent.width/(parent.columns+1); height: parent.parent.height/(parent.rows+1)

    Rectangle {
        id: rectangle
        border.color: "black"
        anchors.fill: parent
        smooth: true
        radius: 2
    }
    Text {
        id: cardText
        text: parent.text
        font.pixelSize: parent.height *0.4
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: container.clicked(cardText.text)
    }
}

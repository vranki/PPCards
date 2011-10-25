import QtQuick 1.0

Item {
    id: container
    property alias text: cardText.text
    property alias image: cardImage.source
    signal clicked(string text, url image)
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
    Image {
        id: cardImage
        width: parent.width *0.8
        height: parent.height*0.8
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        z: 1
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: container.clicked(cardText.text, cardImage.source)
    }
}

import QtQuick 1.0

Item {
    id: container
    property alias text: cardText.text
    property alias image: cardImage.source
    signal clicked(string text, url image)
    height: parent.parent.width/(parent.rows);
    width: parent.parent.height/(parent.columns)

    Rectangle {
        id: rectangle
        border.color: "black"
        anchors.fill: parent
        smooth: true
        radius: 15
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#EEEEEE" }
            GradientStop { position: 0.08; color: "#777777" }
            GradientStop { position: 0.12; color: "#555555" }
            GradientStop { position: 0.28; color: "#333333" }
            GradientStop { position: 1.0; color: "#000000" }
        }
    }
    Text {
        id: cardText
        text: parent.text
        font.pixelSize: parent.height *0.4
        anchors.centerIn: parent
        style: Text.Sunken; color: "white"; styleColor: "black"; smooth: true
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

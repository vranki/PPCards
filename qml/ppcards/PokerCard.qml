import QtQuick 1.0

Rectangle {
    id: container
    anchors.centerIn: parent
    property alias text: cardText.text
    property alias image: cardImage.source
    property bool cardDisplayed: false
    border.color: "black"
//    color: "white"
    z: 100
    height: parent.width
    width: parent.height
    scale: 0.5
    opacity: 0.4
    smooth: true
    radius: 20
    visible: true
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#EEEEEE" }
        GradientStop { position: 0.2; color: "#FFFFFF" }
        GradientStop { position: 0.8; color: "#FFFFFF" }
        GradientStop { position: 0.0; color: "#EEEEEE" }
    }
    Text {
        id: cardText
        text: parent.text
        anchors.centerIn: parent
        font.pixelSize: parent.height * 0.4;
    }
    Image {
        id: cardImage
        width: parent.width*0.9
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        z: 1
    }
    states: [State {
        name: "show"; when: container.cardDisplayed == true
        PropertyChanges { target: container; scale: 1; opacity: 1}
    }, State {
        name: "hide"; when: container.cardDisplayed == false
        PropertyChanges { target: container; scale: 0.5; opacity: 0}
    }]

    transitions: [Transition {
        from: "*"; to: "show"; reversible: true
        ParallelAnimation {
            NumberAnimation { properties: "scale,opacity"; duration: 300; easing.type: Easing.InOutQuad }
        }},
        Transition {
        from: "*"; to: "hide"; reversible: true
        ParallelAnimation {
            NumberAnimation { properties: "scale,opacity"; duration: 100; easing.type: Easing.InOutQuad }
        }
    }
    ]
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: container.cardDisplayed = false
    }
}

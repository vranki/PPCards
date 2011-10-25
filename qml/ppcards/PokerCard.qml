import QtQuick 1.0

Rectangle {
    id: container
    anchors.centerIn: parent
    property alias text: cardText.text
    property bool cardDisplayed: false
    border.color: "black"
    color: "white"
    z: 100
    width: parent.width
    height: parent.height
    scale: 0.5
    opacity: 0.4
    smooth: true
    radius: 20
    visible: true

    Text {
        id: cardText
        text: parent.text
        anchors.centerIn: parent
        font.pixelSize: parent.height * 0.4;
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

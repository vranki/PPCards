import QtQuick 1.0

Rectangle {
    id: container
    rotation: parent.rotation
    z: 200
    color: "white"
    height: parent.width
    width: parent.height
    anchors.centerIn: parent

    Text {
        id: dialogText
        anchors.centerIn: parent
        text: "<b>Planning Poker Cards</b><br/>byVille Ranki &lt;ville.ranki@iki.fi&gt;<br/>" +
              "<a href=\"https://github.com/vranki/PPCards\">https://github.com/vranki/PPCards</a>";
        rotation: 90
        font.pointSize: 15
    }

    MouseArea {
        anchors.fill: parent
        onClicked:  { container.visible = false }
    }

    Behavior on x { SpringAnimation { spring: 2; damping: 0.2 } }
}

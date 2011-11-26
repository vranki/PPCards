import QtQuick 1.0
import com.nokia.meego 1.0

Dialog {
    id: aboutDialog
    content: Label {
        id: text
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        text: "Planning Poker Cards<br/>by Ville Ranki &lt;ville.ranki@iki.fi&gt;<br/><br/>" +
              "<a href=\"https://github.com/vranki/PPCards\">https://github.com/vranki/PPCards</a><br/>"
    }

    buttons: ButtonRow {
        style: ButtonStyle { }
        anchors.horizontalCenter: parent.horizontalCenter
        Button {text: "Ok"; onClicked: aboutDialog.accept()}
    }
}

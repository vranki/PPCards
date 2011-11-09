import QtQuick 1.0
import com.nokia.meego 1.0

Button {
    id: btn
    property alias image: cardImage.source
    width: parent.width/parent.columns
    height: parent.height/parent.rows
    opacity: 0.7
    onClicked: {
        displayedCard.text = text;
        displayedCard.image = cardImage.source;
        displayedCard.cardDisplayed=true;
    }

    Image {
        id: cardImage
        width: parent.width*0.8
        height: parent.height*0.8
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        z: 1
        visible: true
    }
}

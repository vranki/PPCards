import QtQuick 1.0

Rectangle {
    width: 800
    height: 400
    color: "black"
    rotation: -90

    PokerCard {
        id: displayedCard
    }

    AboutDialog {
        id: aboutDialog
        visible: false
        z: 1000
    }

    function cardClicked(text) {
        imageCardClicked(text, "")
    }

    function imageCardClicked(text, image) {
        console.debug("clicked " + text + " image " + image)
        displayedCard.text = text
        displayedCard.image = image
        displayedCard.cardDisplayed = true
    }

    Grid {
        anchors.centerIn: parent
        id: colorPicker
        columns: 3
        rows: 6
        spacing: 1
        CardButton { text: "Quit"; onClicked: Qt.quit(); }
        CardButton { text: "About"; onClicked: aboutDialog.visible = true }
        CardButton { text: "0"; onClicked: cardClicked(text) }
        CardButton { text: "½"; onClicked: cardClicked(text) }
        CardButton { text: "1"; onClicked: cardClicked(text) }
        CardButton { text: "2"; onClicked: cardClicked(text) }
        CardButton { text: "3"; onClicked: cardClicked(text) }
        CardButton { text: "5"; onClicked: cardClicked(text) }
        CardButton { text: "8"; onClicked: cardClicked(text) }
        CardButton { text: "13"; onClicked: cardClicked(text) }
        CardButton { text: "20"; onClicked: cardClicked(text) }
        CardButton { text: "40"; onClicked: cardClicked(text) }
        CardButton { text: "100"; onClicked: cardClicked(text) }
        CardButton { text: "?"; onClicked: cardClicked(text) }
        CardButton { text: "∞"; onClicked: cardClicked(text) }
        CardButton { text: ""
            image: "coffee.png"; onClicked: imageCardClicked(text, image); }
    }
}

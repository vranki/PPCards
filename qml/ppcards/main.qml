import QtQuick 1.0

Rectangle {
    width: 360
    height: 360
    color: "black"

    PokerCard {
        id: displayedCard
    }
    AboutDialog {
        id: aboutDialog
    }

    function cardClicked(text) {
        displayedCard.text = text
        displayedCard.cardDisplayed = true
    }

    Grid {
        anchors.centerIn: parent
        id: colorPicker
        columns: 3
        rows: 5
        spacing: 3

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
        CardButton { text: "Quit"; onClicked: Qt.quit(); }
    }
}

import QtQuick 1.1
import com.nokia.meego 1.0
Page {
    id: mainpage
    tools: commonTools
    orientationLock: PageOrientation.LockPortrait
    Rectangle {
        anchors.fill: parent
        z: -1
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#999999" }
            GradientStop { position: 0.1; color: "#FFFFFF" }
            GradientStop { position: 0.8; color: "#FFFFFF" }
            GradientStop { position: 1.0; color: "#999999" }
        }
    }

    PokerCard {
        id: displayedCard
    }

    Grid {
        anchors.centerIn: parent
        anchors.fill: parent
        id: buttonGrid
        columns: 3
        rows: 5
        CardButton { text: "0"; }
        CardButton { text: "½";  }
        CardButton { text: "1";  }
        CardButton { text: "2";  }
        CardButton { text: "3";  }
        CardButton { text: "5";  }
        CardButton { text: "8";  }
        CardButton { text: "13";  }
        CardButton { text: "20";  }
        CardButton { text: "40";  }
        CardButton { text: "100";  }
        CardButton { text: "?";  }
        CardButton { text: "∞";  }
        CardButton { text: "" ; image: "coffee.png"; }
    }
}

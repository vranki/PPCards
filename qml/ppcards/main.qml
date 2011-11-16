import QtQuick 1.1
import com.nokia.meego 1.0
import "Settings.js" as Storage

PageStackWindow {
    id: appWindow
    initialPage: mainPage
    MainPage {
        id: mainPage
    }
    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (mainMenu.status == DialogStatus.Closed) ? mainMenu.open() : mainMenu.close()
        }
    }
    Menu {
        id: mainMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr("Quit"); onClicked: Qt.quit() }
            MenuItem { text: qsTr("About"); onClicked: aboutDialog.open() }
            CheckBox { id: shakeSetting; text: qsTr("Shake to reveal"); onClicked: {
                    Storage.setSetting("shake_to_reveal", shakeSetting.checked ? "true" : "false");
                }}
        }
    }
    AboutDialog {
        id: aboutDialog
    }
    Component.onCompleted: {
        Storage.initialize();
        shakeSetting.checked = Storage.getSetting("shake_to_reveal")=="true";
    }
}

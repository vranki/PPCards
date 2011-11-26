import QtQuick 1.1
import com.nokia.meego 1.0

import QtQuick 1.1
import com.nokia.meego 1.0
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
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }
    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr("Quit"); onClicked: Qt.quit() }
            MenuItem { text: qsTr("About"); onClicked: aboutDialog.open() }
//            CheckBox { text: qsTr("Shake to reveal"); }
        }
    }
    AboutDialog {
        id: aboutDialog
//        visible: false
        z: 1000
    }
}

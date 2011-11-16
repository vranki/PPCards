import QtQuick 1.0
import QtMobility.sensors 1.1
import QtMobility.feedback 1.1

Rectangle {
    id: container
    anchors.centerIn: parent
    anchors.fill: parent
    property alias text: cardText.text
    property alias image: cardImage.source
    property bool cardDisplayed: false
    border.color: "black"

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#999999" }
        GradientStop { position: 0.2; color: "#FFFFFF" }
        GradientStop { position: 0.8; color: "#FFFFFF" }
        GradientStop { position: 1.0; color: "#999999" }
    }

    z: 100
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
    Text {
        id: shakeText
        text: "Shake to reveal"
        anchors.centerIn: parent
        opacity: 1 - cardText.opacity
    }
    Image {
        id: cardImage
        width: parent.width*0.9
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        z: 1
        opacity: cardText.opacity
    }
    states: [State {
            name: "show"; when: container.cardDisplayed == true
            PropertyChanges { target: container; scale: 1; opacity: 1; }
            StateChangeScript { script: {
                    if(shakeSetting.checked) {
                        accelerometer.start();
                        resetTimer.start();
                        cardShowTimer.start();
                        accelerometer.shakes = 0;
                        cardText.opacity = 0;
                    } else {
                        cardText.opacity = 1;
                        cardShowTimer.stop();
                    }
                }
            }
        }, State {
            name: "hide"; when: container.cardDisplayed == false
            PropertyChanges { target: container; scale: 0.5; opacity: 0}
            StateChangeScript { script: {
                    accelerometer.stop();
                    resetTimer.stop();
                }
            }
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
    Timer {
        id: resetTimer
        interval: 1000; running: true; repeat: false
        onTriggered: {
            accelerometer.shakes = 0;
            cardText.opacity = 0;
        }
    }

    // Wait a while before shake to reveal is enabled
    Timer {
        id: cardShowTimer
        interval: 1500; running: false; repeat: false
    }

    HapticsEffect {
        id: rumbleEffect
        attackIntensity: 0.0
        attackTime: 250
        intensity: 1.0
        duration: 100
        fadeTime: 250
        fadeIntensity: 0.0
    }

    Accelerometer  {
        id: accelerometer
        dataRate: 50
        property real lastAcceleration: 0
        property int shakes: 0

        onReadingChanged: {
            var r = reading
            if(cardShowTimer.running) return;

            if(Math.abs(r.x - lastAcceleration) > 1) {
                if(lastAcceleration < 0 && r.x > 0) shakes++;
                if(lastAcceleration > 0 && r.x < 0) shakes++;
                resetTimer.start();
            }
            lastAcceleration = r.x;
            if(shakes >= 4) {
                cardText.opacity = 1.0;
                accelerometer.stop();
                resetTimer.stop();
                rumbleEffect.start();
            } else {
                cardText.opacity = shakes / 4.0;
            }
        }
    }
}

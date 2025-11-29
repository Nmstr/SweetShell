import Quickshell
import QtQuick
import "root:/Widgets"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }
            implicitHeight: 30
            color: "transparent"

            Rectangle {
                anchors {
                    top: parent.top
                    right: parent.right
                    bottom: parent.bottom
                }
                width: 100
                bottomLeftRadius: 20
                color: "#101015"

                ClockWidget {
                    anchors.centerIn: parent
                }
            }
        }
    }
}

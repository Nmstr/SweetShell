import Quickshell
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            anchors {
                left: true
                right: true
                top: true
                bottom: true
            }
            aboveWindows: false

            Image {
                anchors.fill: parent
                source: configFile.wallpaperPath
            }
        }
    }
}

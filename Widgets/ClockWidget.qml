import Quickshell
import QtQuick

Text {
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    text: Qt.formatDateTime(clock.date, "hh:mm:ss")
    color: "white"
    font.family: "Jetbrains Mono"
}

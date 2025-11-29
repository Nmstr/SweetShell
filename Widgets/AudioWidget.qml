import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

Rectangle {
    implicitWidth: audioLayout.width
    implicitHeight: audioLayout.height
    color: "transparent"

    RowLayout {
        id: audioLayout
        PwObjectTracker {
            objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
        }

        Connections {
            target: Pipewire.defaultAudioSink.audio

            function onMutedChanged() {
                if (Pipewire.defaultAudioSink.audio.muted) {
                    sinkVolumeIcon.source = "../assets/icons/material/volume-off.svg";
                } else {
                    onVolumeChanged();  // not clean but good enough
                }
            }

            function onVolumeChanged() {
                let vol = Pipewire.defaultAudioSink.audio.volume;
                if (vol <= 0.3) {
                    sinkVolumeIcon.source = "../assets/icons/material/volume-low.svg";
                } else if (vol <= 0.7) {
                    sinkVolumeIcon.source = "../assets/icons/material/volume-medium.svg";
                } else {
                    sinkVolumeIcon.source = "../assets/icons/material/volume-high.svg";
                }
            }
        }

        Text {
            id: sinkVolumeText
            text: Math.round(Pipewire.defaultAudioSink.audio.volume * 100) + "%"
            color: "white"
            font.family: "Jetbrains Mono"
        }

        Image {
            id: sinkVolumeIcon
            source: "../assets/icons/material/volume-high.svg"
        }

        Text {
            text: Math.round(Pipewire.defaultAudioSource.audio.volume * 100) + "%"
            color: "white"
            font.family: "Jetbrains Mono"
        }

        Image {
            source: Pipewire.defaultAudioSource.audio.muted ? "../assets/icons/material/microphone-off.svg" : "../assets/icons/material/microphone.svg"
        }
    }

    MouseArea {
        anchors.fill: audioLayout
        onWheel: (wheel) => {
            if (wheel.x < audioLayout.width / 2) {  // Left half | Audio sink
                if (wheel.angleDelta.y < 0) {
                    Pipewire.defaultAudioSink.audio.volume -= 0.1;
                } else {
                    Pipewire.defaultAudioSink.audio.volume += 0.1;
                }
            } else {  // Right half | Audio source
                if (wheel.angleDelta.y < 0) {
                    Pipewire.defaultAudioSource.audio.volume -= 0.1;
                } else {
                    Pipewire.defaultAudioSource.audio.volume += 0.1;
                }
            }
        }
    }
}

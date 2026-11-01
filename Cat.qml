import QtQuick

Item {
    id: cat

    width: 512
    height: 512

    Image {
        id: leftEar
        source: Qt.resolvedUrl("assets/cat/ears/left-ear.svg")
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: rightEar
        source: Qt.resolvedUrl("assets/cat/ears/right-ear.svg")
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: leftEyeBase
        source: Qt.resolvedUrl("assets/cat/eyes/left-eye-base.svg")
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: leftEyeIris
        source: Qt.resolvedUrl("assets/cat/eyes/left-eye-iris.svg")
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: rightEyeBase
        source: Qt.resolvedUrl("assets/cat/eyes/right-eye-base.svg")
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: rightEyeIris
        source: Qt.resolvedUrl("assets/cat/eyes/right-eye-iris.svg")
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: nose
        source: Qt.resolvedUrl("assets/cat/nose.svg")
        fillMode: Image.PreserveAspectFit
    }

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
            if (!(eyeMovementAnimationLeft.running || eyeMovementAnimationRight.running)) {
                if (Math.random() < 0.5) {
                    eyeMovementAnimationLeft.start();
                } else {
                    eyeMovementAnimationRight.start();
                }

                interval = 2_500 + Math.random() * 2_500
            }
        }
    }

    SequentialAnimation {
        id: eyeMovementAnimationLeft

        ParallelAnimation {
            NumberAnimation {
                target: leftEyeIris
                property: "x"
                to: -5
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: rightEyeIris
                property: "x"
                to: -5
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: leftEyeIris
                property: "y"
                to: -10
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: rightEyeIris
                property: "y"
                to: -10
                duration: 100
                easing.type: Easing.InOutSine
            }
        }
        PauseAnimation {
            duration: 120
        }
        ParallelAnimation {
            NumberAnimation {
                target: leftEyeIris
                property: "x"
                to: 0
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: rightEyeIris
                property: "x"
                to: 0
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: leftEyeIris
                property: "y"
                to: 0
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: rightEyeIris
                property: "y"
                to: 0
                duration: 100
                easing.type: Easing.InOutSine
            }
        }
    }
    SequentialAnimation {
        id: eyeMovementAnimationRight

        ParallelAnimation {
            NumberAnimation {
                target: leftEyeIris
                property: "x"
                to: 5
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: rightEyeIris
                property: "x"
                to: 5
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: leftEyeIris
                property: "y"
                to: -10
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: rightEyeIris
                property: "y"
                to: -10
                duration: 100
                easing.type: Easing.InOutSine
            }
        }
        PauseAnimation {
            duration: 120
        }
        ParallelAnimation {
            NumberAnimation {
                target: leftEyeIris
                property: "x"
                to: 0
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: rightEyeIris
                property: "x"
                to: 0
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: leftEyeIris
                property: "y"
                to: 0
                duration: 100
                easing.type: Easing.InOutSine
            }
            NumberAnimation {
                target: rightEyeIris
                property: "y"
                to: 0
                duration: 100
                easing.type: Easing.InOutSine
            }
        }
    }
}
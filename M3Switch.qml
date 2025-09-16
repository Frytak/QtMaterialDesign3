import QtQuick.Controls.Basic
import QtQuick

Switch {
    id: control

    indicator: Rectangle {
        implicitWidth: M3Size.dp(52)
        implicitHeight: M3Size.dp(32)
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: Infinity
        color: control.checked ? M3Colors.getColor("primary") : M3Colors.getColor("surfaceContainerHighest")
        border.color: control.checked ? M3Colors.getColor("primary") : M3Colors.getColor("outline")
        border.width: M3Size.dp(2)

        Rectangle {
            id: handle
            anchors.verticalCenter: parent.verticalCenter
            x: control.checked ? parent.width - width - 5 : 5
            width: control.checked ? M3Size.dp(25) : M3Size.dp(16)
            height: width
            radius: Infinity
            color: control.checked ? M3Colors.getColor("onPrimary") : M3Colors.getColor("outline")

            // border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
            Behavior on x {
                NumberAnimation {
                    duration: 100
                    easing.type: Easing.Bezier
                    easing.bezierCurve: [0.3, 0, 0.8, 0.15]
                }
            }
            Behavior on width {
                NumberAnimation {
                    duration: 100
                    easing.type: Easing.Bezier
                    easing.bezierCurve: [0.3, 0, 0.8, 0.15]
                }
            }
            Behavior on height {
                NumberAnimation {
                    duration: 100
                    easing.type: Easing.Bezier
                    easing.bezierCurve: [0.3, 0, 0.8, 0.15]
                }
            }
        }
    }

    onHoveredChanged: {
        stateLayer.state = hovered ? "HOVERED" : "NOTHOVERED";
    }

    Rectangle {
        id: stateLayer
        state: "NOTHOVERED"

        // anchors.centerIn: handle
        anchors.verticalCenter: handle.verticalCenter
        x: handle.x - width / 4 + 5
        implicitWidth: M3Size.dp(40)
        implicitHeight: M3Size.dp(40)
        radius: M3Size.dp("full")
        opacity: 0

        color: {
            switch (root.state) {
            case M3Checkbox.State.Checked:
            case M3Checkbox.State.Indeterminat:
                return root.error ? M3Colors.getColor("error") : M3Colors.getColor("primary");
            case M3Checkbox.State.Unchecked:
            default:
                return M3Colors.getColor("onSurface");
            }
        }

        states: [
            State {
                name: "HOVERED"
                PropertyChanges {
                    target: stateLayer
                    opacity: 0.08
                }
            },
            State {
                name: "NOTHOVERED"
                PropertyChanges {
                    target: stateLayer
                    opacity: 0.0
                }
            }
        ]

        // TODO: Find exact transition values
        transitions: [
            Transition {
                from: "HOVERED"
                to: "NOTHOVERED"
                OpacityAnimator {
                    target: stateLayer
                    duration: 100
                    easing.type: Easing.Bezier
                    easing.bezierCurve: [0.3, 0, 0.8, 0.15]
                } // easing-emphasized-accelerate
            },
            Transition {
                from: "NOTHOVERED"
                to: "HOVERED"
                OpacityAnimator {
                    target: stateLayer
                    duration: 100
                    easing.type: Easing.Bezier
                    easing.bezierCurve: [0.05, 0.7, 0.1, 1]
                } // easing-emphasized-decelerate
            }
        ]
    }
}

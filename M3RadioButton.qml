import QtQuick
import QtQuick.Effects
import QtQuick.Controls.Basic

RadioButton {
    id: root

    readonly property int borderSize: M3Size.dp(20) 
    readonly property int stateLayerSize: M3Size.dp(40) 

    checkable: true
    implicitWidth: M3Size.dp(48)
    implicitHeight: M3Size.dp(48)

    padding: (this.implicitHeight - borderSize) / 2
    leftInset: (this.implicitHeight - stateLayerSize) / 2
    topInset: (this.implicitHeight - stateLayerSize) / 2
    rightInset: (this.implicitHeight - stateLayerSize) / 2
    bottomInset: (this.implicitHeight - stateLayerSize) / 2

    indicator: Rectangle {
        id: border
        anchors.centerIn: parent
        implicitWidth: M3Size.dp(20)
        implicitHeight: M3Size.dp(20)

        color: "transparent"
        radius: M3Size.dp("full")
        border.width: M3Size.dp(2)
        border.color: root.checked ? M3Colors.getColor("primary") : M3Colors.getColor("onSurfaceVariant")

        Rectangle {
            id: circle
            anchors.centerIn: parent
            implicitWidth: M3Size.dp(10)
            implicitHeight: M3Size.dp(10)

            color: root.checked ? M3Colors.getColor("primary") : "transparent"
            radius: M3Size.dp("full")
        }
    }

    background: Rectangle {
        id: stateLayer
        state: "NOTHOVERED"

        anchors.centerIn: parent
        implicitWidth: M3Size.dp(40)
        implicitHeight: M3Size.dp(40)
        radius: M3Size.dp("full")
        opacity: 0

        color: {
            switch (root.state) {
                case M3Checkbox.State.Checked:
                case M3Checkbox.State.Indeterminat:
                return root.error ? M3Colors.getColor("error") : M3Colors.getColor("primary")

                case M3Checkbox.State.Unchecked:
                default:
                return M3Colors.getColor("onSurface")
            }
        }

        states: [
            State {
                name: "HOVERED"
                PropertyChanges { target: stateLayer; opacity: 0.08 }
            },
            State {
                name: "NOTHOVERED"
                PropertyChanges { target: stateLayer; opacity: 0.0 }
            }
        ]

        // TODO: Find exact transition values
        transitions: [
            Transition {
                from: "HOVERED"
                to: "NOTHOVERED"
                OpacityAnimator { target: stateLayer; duration: 100; easing.type: Easing.Bezier; easing.bezierCurve: [0.3, 0, 0.8, 0.15] } // easing-emphasized-accelerate
            },
            Transition {
                from: "NOTHOVERED"
                to: "HOVERED"
                OpacityAnimator { target: stateLayer; duration: 100; easing.type: Easing.Bezier; easing.bezierCurve: [0.05, 0.7, 0.1, 1] } // easing-emphasized-decelerate
            }
        ]

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onEntered: { stateLayer.state = "HOVERED" }
            onExited: { stateLayer.state = "NOTHOVERED" }
        }
    }
}

import QtQuick
import QtQuick.Effects
import QtQuick.Controls

Item {
    id: root

    enum State {
        Checked,
        Indeterminat,
        Unchecked
    }

    property int state: M3Checkbox.State.Indeterminat
    property bool error: false

    property string icon: {
        switch (state) {
        case M3Checkbox.State.Checked:
            return "\ue5ca";
        case M3Checkbox.State.Indeterminat:
            return "\uf88a";
        default:
            return "";
        }
    }

    FontLoader { id: materialSymbols; source: "/nix/store/qqdjqvd9lvnnyv9c1i7dxjpibggsj74j-material-symbols-4.0.0-unstable-2024-05-17/share/fonts/TTF/MaterialSymbolsOutlined.ttf" }

    implicitWidth: M3Size.dp(48)
    implicitHeight: M3Size.dp(48)

    Rectangle {
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
                return root.error ? M3Colors.getColor("error") : M3Colors.getColor("primary");
            case M3Checkbox.State.Unchecked:
            default:
                return M3Colors.getColor("onSurface");
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
            onClicked: {
                if (root.state == M3Checkbox.State.Unchecked || root.state == M3Checkbox.State.Indeterminat) {
                    root.state = M3Checkbox.State.Checked
                } else {
                    root.state = M3Checkbox.State.Unchecked;
                }
            }
        }
    }

    Rectangle {
        id: background

        anchors.centerIn: parent
        implicitWidth: M3Size.dp(18)
        implicitHeight: M3Size.dp(18)

        color: root.state == M3Checkbox.State.Unchecked ? "transparent" : (root.error ? M3Colors.getColor("error") : M3Colors.getColor("primary"))

        radius: M3Size.dp(2)
        border.width: M3Size.dp(2)
        border.color: root.error ? M3Colors.getColor("error") : (root.state == M3Checkbox.State.Unchecked ? M3Colors.getColor("onSurface") : M3Colors.getColor("primary"))

        Text {
            id: icon

            visible: root.state == M3Checkbox.State.Unchecked ? false : true
            text: root.icon
            anchors.centerIn: parent
            color: root.error ? M3Colors.getColor("onError") : M3Colors.getColor("onPrimary")
            font.family: materialSymbols.name
            font.pixelSize: M3Size.dp(18)
        }
    }
}

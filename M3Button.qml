import QtQuick
import QtQuick.Effects
import QtQuick.Controls

Item {
    id: root

    enum Size {
        ExtraSmall,
        Small,
        Medium,
        Large,
        ExtraLarge
    }

    enum Shape {
        Round,
        Square
    }

    enum Style {
        Elevated,
        Filled,
        Tonal,
        Outlined,
        Text
    }

    function typeToName(color) {
        switch (color) {
        case M3Button.Style.Elevated:
            return "elevated";
        case M3Button.Style.Filled:
            return "filled";
        case M3Button.Style.Tonal:
            return "tonal";
        case M3Button.Style.Outlined:
            return "outlined";
        case M3Button.Style.Text:
            return "text";
        }
    }

    function sizeToPixels(size) {
        switch (size) {
        case M3Button.Size.ExtraSmall:
            return {
                padding: M3Size.dp(12),
                height: M3Size.dp(32),
                fontSize: M3Size.pt(14)
            };
        case M3Button.Size.Small:
            return {
                padding: M3Size.dp(16),
                height: M3Size.dp(40),
                fontSize: M3Size.pt(14)
            };
        case M3Button.Size.Medium:
            return {
                padding: M3Size.dp(24),
                height: M3Size.dp(56),
                fontSize: M3Size.pt(16)
            };
        case M3Button.Size.Large:
            return {
                padding: M3Size.dp(48),
                height: M3Size.dp(96),
                fontSize: M3Size.pt(24)
            };
        case M3Button.Size.ExtraLarge:
            return {
                padding: M3Size.dp(64),
                height: M3Size.dp(136),
                fontSize: M3Size.pt(32)
            };
        }
    }

    property int style: M3Button.Style.Filled
    property int size: M3Button.Size.Medium
    property int shape: M3Button.Shape.Round
    property alias text: label.text
    signal clicked

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight

    property double radius: shape == M3Button.Shape.Round ? M3Size.dp("full") : M3Size.dp(12)
    property color backgroundColor: style == M3Button.Style.Outlined || style == M3Button.Style.Text ? "transparent" : (() => {
            return root.styleConfig[root.typeToName(style)].container;
        })()
    property double borderWidth: style == M3Button.Style.Outlined ? M3Size.dp(1) : 0
    property color borderColor: style == M3Button.Style.Outlined ? (() => {
            return root.styleConfig[root.typeToName(style)].container;
        })() : "transparent"

    readonly property var styleConfig: ({
            "elevated": {
                container: M3Colors.getColor("surfaceContainerLow"),
                icon_and_label: M3Colors.getColor("primary"),
                hovered_state_layer: M3Colors.getColor("primary"),
                hovered_icon_and_label: M3Colors.getColor("primary")
            },
            "filled": {
                container: M3Colors.getColor("primary"),
                icon_and_label: M3Colors.getColor("onPrimary"),
                hovered_state_layer: M3Colors.getColor("onPrimary"),
                hovered_icon_and_label: M3Colors.getColor("onPrimary")
            },
            "tonal": {
                container: M3Colors.getColor("secondaryContainer"),
                icon_and_label: M3Colors.getColor("onSecondaryContainer"),
                hovered_state_layer: M3Colors.getColor("onSecondaryContainer"),
                hovered_icon_and_label: M3Colors.getColor("onSecondaryContainer")
            },
            "outlined": {
                container: M3Colors.getColor("outlineVariant"),
                icon_and_label: M3Colors.getColor("onSurfaceVariant"),
                hovered_state_layer: M3Colors.getColor("onSurfaceVariant"),
                hovered_icon_and_label: M3Colors.getColor("onSurfaceVariant")
            },
            "text": {
                container: "transparent",
                icon_and_label: M3Colors.getColor("primary"),
                hovered_state_layer: M3Colors.getColor("primary"),
                hovered_icon_and_label: M3Colors.getColor("primary")
            }
        })

    Elevation {
        level: root.style == M3Button.Style.Elevated ? Elevation.Level.One : Elevation.Level.Zero

        Rectangle {
            id: background
            state: "NOTHOVERED"
            radius: root.radius
            implicitWidth: label.implicitWidth + (sizeToPixels(size).padding * 2)
            implicitHeight: sizeToPixels(size).height

            color: root.backgroundColor
            border.width: root.borderWidth
            border.color: root.borderColor

            Rectangle {
                id: stateLayer
                anchors.fill: parent
                radius: root.radius
                opacity: 0
                color: (() => {
                    return root.styleConfig[root.typeToName(style)].hovered_state_layer;
                })()
            }

            Text {
                id: label
                anchors.centerIn: background
                font.family: "Roboto"
                font.weight: Font.Medium
                font.pixelSize: sizeToPixels(size).fontSize
                color: (() => {
                    return root.styleConfig[root.typeToName(style)].icon_and_label;
                })()
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onEntered: { background.state = "HOVERED" }
                onExited: { background.state = "NOTHOVERED" }
                onClicked: root.clicked()
            }

            states: [
                State {
                    name: "HOVERED"
                    PropertyChanges {
                        target: stateLayer
                        opacity: 0.08
                    }
                    PropertyChanges { target: label; color: (() => {
                        return root.styleConfig[root.typeToName(style)].hovered_icon_and_label;
                    })() }
                },
                State {
                    name: "NOTHOVERED"
                    PropertyChanges {
                        target: stateLayer
                        opacity: 0
                    }
                    PropertyChanges { target: label; color: (() => {
                        return root.styleConfig[root.typeToName(style)].icon_and_label;
                    })() }
                }
            ]

            // TODO: Find exact transition values
            transitions: [
                Transition {
                    from: "HOVERED"
                    to: "NOTHOVERED"
                    // easing-emphasized-accelerate
                    OpacityAnimator { target: stateLayer; duration: 100; easing.type: Easing.Bezier; easing.bezierCurve: [0.3, 0, 0.8, 0.15] }
                    ColorAnimation { target: label; duration: 100; easing.type: Easing.Bezier; easing.bezierCurve: [0.3, 0, 0.8, 0.15] }
                },
                Transition {
                    from: "NOTHOVERED"
                    to: "HOVERED"
                    // easing-emphasized-decelerate
                    OpacityAnimator { target: stateLayer; duration: 100; easing.type: Easing.Linear; easing.bezierCurve: [0.05, 0.7, 0.1, 1] }
                    ColorAnimation { target: label; duration: 100; easing.type: Easing.Linear; easing.bezierCurve: [0.05, 0.7, 0.1, 1] }
                }
            ]
        }
    }
}

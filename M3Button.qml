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

    property int type: M3Button.Style.Filled
    property int size: M3Button.Size.Medium
    property int shape: M3Button.Shape.Round
    property alias text: label.text
    signal clicked

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight

    property double radius: shape == M3Button.Shape.Round ? M3Size.dp("full") : M3Size.dp(12)
    property color backgroundColor: type == M3Button.Style.Outlined || type == M3Button.Style.Text ? "transparent" : (() => {
            return root.styleConfig[root.typeToName(type)].container;
        })()
    property double borderWidth: type == M3Button.Style.Outlined ? M3Size.dp(1) : 0
    property color borderColor: type == M3Button.Style.Outlined ? (() => {
            return root.styleConfig[root.typeToName(type)].container;
        })() : "transparent"

    readonly property var styleConfig: ({
            "elevated": {
                container: M3Colors.getColor("surfaceContainerLow"),
                icon_and_label: M3Colors.getColor("primary")
            },
            "filled": {
                container: M3Colors.getColor("primary"),
                icon_and_label: M3Colors.getColor("onPrimary")
            },
            "tonal": {
                container: M3Colors.getColor("secondaryContainer"),
                icon_and_label: M3Colors.getColor("onSecondaryContainer")
            },
            "outlined": {
                container: M3Colors.getColor("outlineVariant"),
                icon_and_label: M3Colors.getColor("onSurfaceVariant")
            },
            "text": {
                icon_and_label: M3Colors.getColor("primary")
            }
        })

    Elevation {
        level: root.type == M3Button.Style.Elevated ? Elevation.Level.One : Elevation.Level.Zero

        Rectangle {
            id: background
            radius: root.radius
            implicitWidth: label.implicitWidth + (sizeToPixels(size).padding * 2)
            implicitHeight: sizeToPixels(size).height

            color: root.backgroundColor
            border.width: root.borderWidth
            border.color: root.borderColor

            Text {
                id: label
                anchors.centerIn: background
                font.family: "Roboto"
                font.weight: Font.Medium
                font.pixelSize: sizeToPixels(size).fontSize
                color: (() => {
                        return root.styleConfig[root.typeToName(type)].icon_and_label;
                    })()
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: root.clicked()
            }
        }
    }
}

import QtQuick
import QtQuick.Effects
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root
    state: "DEFAULT_EMPTY"

    enum Style {
        Filled,
        Outlined
    }

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight

    property alias text: input.text
    property alias placeholderText: input.placeholderText
    property alias supportingText: supportingText.text
    property int style: M3TextField.Style.Outlined
    readonly property int margin: M3Size.dp(16)

    Rectangle {
        id: background
        implicitWidth: input.implicitWidth
        implicitHeight: M3Size.dp(56)
        radius: M3Size.dp(4)
        color: "transparent"

        TextField {
            id: input
            font.pixelSize: M3Size.pt(16)
            anchors.fill: parent
            leftPadding: margin
            padding: margin
            color: M3Colors.getColor("onSurface")
            placeholderTextColor: "transparent"
            background: Rectangle {
                color: "transparent"
            }
            onActiveFocusChanged: {
                if (input.activeFocus) {
                    root.state = "FOCUSED"
                } else {
                    if (root.text == "") {
                        root.state = "DEFAULT_EMPTY"
                    } else {
                        root.state = "DEFAULT_FILLED"
                    }
                }
            }
        }
    }

    Rectangle {
        id: primary
        implicitWidth: primaryText.implicitWidth + primaryText.anchors.leftMargin + primaryText.anchors.rightMargin
        implicitHeight: primaryText.implicitHeight
        anchors.left: background.left
        anchors.bottom: background.top
        anchors.leftMargin: M3Size.dp(16) - primaryText.anchors.leftMargin
        color: M3Colors.getColor("background") // TODO: Should be transparent

        Text {
            id: primaryText
            text: placeholderText
            anchors.fill: parent
            anchors.leftMargin: M3Size.dp(4)
            anchors.rightMargin: M3Size.dp(4)
        }
    }

    RowLayout {
        spacing: M3Size.dp(16)
        anchors {
            top: background.bottom
            left: background.left
            right: background.right
            topMargin: M3Size.dp(4)
            leftMargin: M3Size.dp(16)
            rightMargin: M3Size.dp(16)
        }

        Text {
            id: supportingText
            color: M3Colors.getColor("onSurfaceVariant")
        }
    }

    states: [
        State {
            name: "DEFAULT_EMPTY"
            PropertyChanges {
                background {
                    border.width: M3Size.dp(1)
                    border.color: M3Colors.getColor("outline")
                }
                primary {
                    anchors.bottomMargin: -((background.height / 2) + (primary.height / 2))
                }
                primaryText {
                    color: M3Colors.getColor("onSurfaceVariant")
                    font.pixelSize: M3Size.dp(16)
                }
            }
        },
        State {
            name: "DEFAULT_FILLED"
            PropertyChanges {
                background {
                    border.width: M3Size.dp(1)
                    border.color: M3Colors.getColor("outline")
                }
                primary {
                    anchors.bottomMargin: -(primary.height / 2)
                }
                primaryText {
                    color: M3Colors.getColor("onSurfaceVariant")
                    font.pixelSize: M3Size.dp(12)
                }
            }
        },
        State {
            name: "FOCUSED"
            PropertyChanges {
                background {
                    border.width: M3Size.dp(3)
                    border.color: M3Colors.getColor("primary")
                }
                primary {
                    anchors.bottomMargin: -(primary.height / 2)
                }
                primaryText {
                    color: M3Colors.getColor("primary")
                }
            }
        }
    ]

    transitions: [
        Transition {
            to: "DEFAULT_FILLED,FOCUSED"
            NumberAnimation {
                target: primary
                properties: "anchors.bottomMargin"
                duration: 100
                to: -(primary.height / 2)
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.3, 0, 0.8, 0.15]
            }
            NumberAnimation {
                target: primaryText
                properties: "font.pixelSize"
                duration: 100
                to: M3Size.pt(12)
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.3, 0, 0.8, 0.15]
            }
            ColorAnimation {
                target: primaryText
                properties: "color"
                duration: 100
                to: M3Colors.getColor("primary")
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.3, 0, 0.8, 0.15]
            }
            NumberAnimation {
                target: background
                properties: "border.width"
                duration: 100
                to: M3Size.dpReal(3)
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.3, 0, 0.8, 0.15]
            }
            ColorAnimation {
                target: background
                properties: "border.color"
                duration: 100
                to: M3Colors.getColor("primary")
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.3, 0, 0.8, 0.15]
            }
        },
        Transition {
            to: "DEFAULT_EMPTY"
            NumberAnimation {
                target: primary
                properties: "anchors.bottomMargin"
                duration: 100
                to: -((background.height / 2) + (primary.height / 2))
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.05, 0.7, 0.1, 1]
            }
            NumberAnimation {
                target: primaryText
                properties: "font.pixelSize"
                duration: 100
                to: M3Size.pt(16)
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.05, 0.7, 0.1, 1]
            }
            ColorAnimation {
                target: primaryText
                properties: "color"
                duration: 100
                to: M3Colors.getColor("onSurfaceVariant")
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.05, 0.7, 0.1, 1]
            }
            NumberAnimation {
                target: background
                properties: "border.width"
                duration: 100
                to: M3Size.dpReal(1)
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.05, 0.7, 0.1, 1]
            }
            ColorAnimation {
                target: background
                properties: "border.color"
                duration: 100
                to: M3Colors.getColor("outline")
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.05, 0.7, 0.1, 1]
            }
        }
    ]
}
